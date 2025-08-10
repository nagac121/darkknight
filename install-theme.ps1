# install-theme.ps1
# Exit if vsce is not installed
if (-not (Get-Command vsce -ErrorAction SilentlyContinue)) {
    Write-Host "vsce is not installed. Installing globally..."
    npm install -g vsce
}

# Remove old .vsix files
Remove-Item *.vsix -ErrorAction SilentlyContinue

# Package the theme
vsce package

# Get the newly created .vsix file
$vsix = Get-ChildItem *.vsix | Sort-Object LastWriteTime -Descending | Select-Object -First 1

if ($vsix) {
    # Install the theme into VS Code
    code --install-extension $vsix.FullName
    Write-Host "Theme installed successfully: $($vsix.Name)"
} else {
    Write-Host "No .vsix file found. Packaging may have failed."
}
