# install-theme.ps1
# This script installs the Dark Knight theme for Visual Studio Code

# Clean old vsix
if (Test-Path ".\darkknight-0.0.1.vsix") {
    Remove-Item ".\darkknight-0.0.1.vsix" -Force
    Write-Host "Removed old .vsix file"
}else {
    Write-Host "No .vsix file found to clean up"
}

# Package
vsce package

# Install
code --install-extension .\darkknight-0.0.1.vsix --force
Write-Host "✅ Installed Dark Knight theme successfully"
Write-Host "ℹ️  Please restart VS Code to see theme changes take effect."

# RUN:
# PS D:\dumps\work\repos\githubrepos\darkknight> .\install-theme.ps1