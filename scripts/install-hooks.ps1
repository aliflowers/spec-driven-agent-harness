# PowerShell Script to install Git Hooks
$ErrorActionPreference = "Stop"

$HooksDir = ".git/hooks"
$SourceDir = "scripts/git-hooks"

if (-not (Test-Path -Path $HooksDir)) {
    Write-Error "No .git directory found. Run this from your repository root."
    exit 1
}

Copy-Item "$SourceDir/pre-commit" "$HooksDir/pre-commit" -Force
Copy-Item "$SourceDir/pre-push" "$HooksDir/pre-push" -Force

Write-Host "✅ Spec-Driven Agent Harness Git Hooks installed successfully into $HooksDir" -ForegroundColor Green
