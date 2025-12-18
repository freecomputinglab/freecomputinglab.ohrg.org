#!/bin/bash
set -e

echo "=== Starting build ==="

# Setup paths
REPO_DIR="$(pwd)"
RHEO_CACHE="$REPO_DIR/.rheo-binary"
RHEO_BIN="$RHEO_CACHE/rheo"

# Install Rust toolchain (rustup/cargo are pre-installed on Netlify)
if ! command -v rustc &> /dev/null; then
  echo "Installing Rust stable toolchain..."
  rustup toolchain install stable --profile minimal
  rustup default stable
else
  echo "Rust toolchain already available"
fi

# Build or use cached rheo binary
if [ ! -f "$RHEO_BIN" ]; then
  echo "Building rheo from source..."

  if [ -z "$GITHUB_TOKEN" ]; then
    echo "Error: GITHUB_TOKEN environment variable not set"
    exit 1
  fi

  git clone https://${GITHUB_TOKEN}@github.com/breezykermo/rheo /tmp/rheo
  cd /tmp/rheo
  cargo build --release

  mkdir -p "$RHEO_CACHE"
  cp target/release/rheo "$RHEO_BIN"
  chmod +x "$RHEO_BIN"
  cd "$REPO_DIR"
else
  echo "Using cached rheo binary"
fi

# Compile with rheo
echo "Compiling with rheo..."
"$RHEO_BIN" compile .

# Verify output
if [ ! -f "build/html/index.html" ]; then
  echo "Error: build/html/index.html not found"
  exit 1
fi

echo "=== Build completed successfully ==="
echo "Generated $(find build/html -name "*.html" | wc -l) HTML files"
