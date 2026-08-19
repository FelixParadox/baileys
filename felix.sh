#!/bin/bash

# Script deploy ke npm

# 4. Cek package
echo "📋 Checking package..."
npm publish --dry-run

# 5. Konfirmasi
read -p "🚀 Publish to npm? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  npm publish --access public
  echo "✅ Published successfully!"
else
  echo "❌ Cancelled."
fi