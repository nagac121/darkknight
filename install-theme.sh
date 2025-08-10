#!/usr/bin/env bash
set -e
# Cross-platform script to package and install VS Code Dark Knight theme

# Detect if running in PowerShell
if [ -n "$PSModulePath" ] && [ -n "$ComSpec" ]; then
    SHELL_TYPE="powershell"
else
    SHELL_TYPE="bash"
fi

VSIX_FILE="darkknight-0.0.2.vsix"

echo "🔍 Shell detected: $SHELL_TYPE"

# Remove old VSIX
if [ -f "$VSIX_FILE" ]; then
    rm -f "$VSIX_FILE"
    echo "🗑️  Removed old $VSIX_FILE"
else
    echo "ℹ️  No old $VSIX_FILE found"
fi

# Package extension
echo "📦 Packaging extension..."
vsce package

# Install extension
if [ "$SHELL_TYPE" = "powershell" ]; then
    code --install-extension ".\\$VSIX_FILE" --force
else
    code --install-extension "./$VSIX_FILE" --force
fi

echo "✅ Installed Dark Knight theme successfully"
echo "ℹ️  Please restart VS Code to see theme changes take effect."
