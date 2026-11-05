# Harness Bootstrapper for Existing Projects (PowerShell)
param(
    [string]$TargetDirectory = "."
)

$ErrorActionPreference = "Stop"
Write-Host "🚀 Initializing Spec-Driven Agent Harness into $TargetDirectory..." -ForegroundColor Cyan

$CurrentScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$HarnessRootDir = Split-Path -Parent $CurrentScriptDir

# Copy Protocol and Config
Copy-Item "$HarnessRootDir/AGENTS.md" "$TargetDirectory/AGENTS.md" -Force
if (-not (Test-Path "$TargetDirectory/harness.config.json")) {
    Copy-Item "$HarnessRootDir/harness.config.example.json" "$TargetDirectory/harness.config.json"
}

# Copy .agents directory
if (-not (Test-Path "$TargetDirectory/.agents")) {
    New-Item -ItemType Directory -Path "$TargetDirectory/.agents" -Force | Out-Null
}
Copy-Item "$HarnessRootDir/.agents/*" "$TargetDirectory/.agents/" -Recurse -Force

# Copy Scripts & Hooks
if (-not (Test-Path "$TargetDirectory/scripts")) {
    New-Item -ItemType Directory -Path "$TargetDirectory/scripts" -Force | Out-Null
}
Copy-Item "$HarnessRootDir/scripts/*" "$TargetDirectory/scripts/" -Recurse -Force

# Install hooks if git exists
if (Test-Path "$TargetDirectory/.git") {
    & "$TargetDirectory/scripts/install-hooks.ps1"
}

Write-Host "✅ Harness successfully initialized! Review AGENTS.md and harness.config.json." -ForegroundColor Green
