#!/bin/bash
set -e  # Exit on error
set -x  # Print commands for debugging

echo "=== Starting build ==="
echo "Timestamp: $(date)"

# Setup paths
REPO_DIR="$(pwd)"
CARGO_BIN="$CARGO_HOME/bin"
RHEO_CACHE="$REPO_DIR/.rheo-binary"
RHEO_BIN="$RHEO_CACHE/rheo"

# Install Rust if not already cached
if [ ! -f "$CARGO_BIN/cargo" ]; then
  echo "Installing Rust toolchain..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain stable --profile minimal
  source "$CARGO_HOME/env"
else
  echo "Using cached Rust toolchain"
fi

# Add cargo to PATH
export PATH="$CARGO_BIN:$PATH"

# Verify Rust installation
rustc --version
cargo --version

# Build or use cached rheo binary
if [ ! -f "$RHEO_BIN" ]; then
  echo "Building rheo from source..."

  # Clone the rheo repository using GitHub token for private repo access
  # The GITHUB_TOKEN environment variable should be set in Netlify
  if [ -z "$GITHUB_TOKEN" ]; then
    echo "Error: GITHUB_TOKEN environment variable not set"
    echo "Please add a GitHub Personal Access Token in Netlify's environment variables"
    exit 1
  fi

  git clone https://${GITHUB_TOKEN}@github.com/breezykermo/rheo /tmp/rheo

  cd /tmp/rheo

  # Build rheo in release mode
  cargo build --release

  # Verify binary was created
  if [ ! -f "target/release/rheo" ]; then
    echo "Error: rheo binary not found after build"
    exit 1
  fi

  # Cache the binary
  mkdir -p "$RHEO_CACHE"
  cp target/release/rheo "$RHEO_BIN"
  chmod +x "$RHEO_BIN"

  cd "$REPO_DIR"

  echo "Rheo built and cached successfully"
else
  echo "Using cached rheo binary"
fi

# Add rheo to PATH
export PATH="$RHEO_CACHE:$PATH"

# Verify rheo is accessible
rheo --version || echo "Warning: rheo --version failed, but continuing..."

# Compile the vocabulary project
echo "Compiling  with rheo..."
rheo compile .

# Verify output was generated
if [ ! -f "build/html/index.html" ]; then
  echo "Error: build/html/index.html not found after compilation"
  exit 1
fi

# Count generated HTML files
HTML_COUNT=$(find build/html -name "*.html" | wc -l)
echo "Successfully generated $HTML_COUNT HTML files"

echo "=== Build completed successfully ==="
echo "Timestamp: $(date)"
