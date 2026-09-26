param (
    [switch]$Agy,
    [switch]$Claude,
    [switch]$Codex,
    [switch]$All,
    [switch]$Symlink,
    [switch]$Uninstall,
    [switch]$Help
)

if ($Help) {
    Write-Host "Usage: .\install.ps1 [OPTIONS]"
    Write-Host ""
    Write-Host "Targets:"
    Write-Host "  -Agy         Target Google Antigravity (~/.gemini/config/skills)"
    Write-Host "  -Claude      Target Claude Code (~/.claude/skills)"
    Write-Host "  -Codex       Target OpenAI Codex (~/.codex/skills)"
    Write-Host "  -All         Target all assistants (default)"
    Write-Host ""
    Write-Host "Options:"
    Write-Host "  -Symlink     Create symbolic links instead of copying"
    Write-Host "  -Uninstall   Remove installed super-skills from targets"
    Write-Host "  -Help        Show this help message"
    exit 0
}

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$SourceDir = Join-Path $ScriptDir "skills"

$Targets = @()
if ($Agy) { $Targets += "agy" }
if ($Claude) { $Targets += "claude" }
if ($Codex) { $Targets += "codex" }
if ($All -or ($Targets.Count -eq 0)) {
    $Targets = @("agy", "claude", "codex")
}

function Manage-Target {
    param (
        [string]$TargetDir,
        [string]$ToolName
    )

    if ($Uninstall) {
        Write-Host "Uninstalling Super-Skills from $ToolName..."
        $Count = 0
        Get-ChildItem -Path $SourceDir -Directory | ForEach-Object {
            $SkillPath = Join-Path $TargetDir $_.Name
            if (Test-Path $SkillPath) {
                Remove-Item -Path $SkillPath -Recurse -Force
                $Count++
            }
        }
        Write-Host "Removed $Count Super-Skills from $TargetDir."
        Write-Host ""
        return
    }

    if ($Symlink) {
        Write-Host "Linking Super-Skills (symlink) to $ToolName..."
    } else {
        Write-Host "Installing Super-Skills to $ToolName..."
    }
    Write-Host "Target: $TargetDir"

    if (-not (Test-Path $TargetDir)) {
        New-Item -ItemType Directory -Path $TargetDir -Force | Out-Null
    }

    $Count = 0
    Get-ChildItem -Path $SourceDir -Directory | ForEach-Object {
        $DestSkill = Join-Path $TargetDir $_.Name
        if (Test-Path $DestSkill) {
            Remove-Item -Path $DestSkill -Recurse -Force
        }
        if ($Symlink) {
            New-Item -ItemType SymbolicLink -Path $DestSkill -Target $_.FullName | Out-Null
        } else {
            Copy-Item -Path $_.FullName -Destination $TargetDir -Recurse -Force
        }
        $Count++
    }
    Write-Host "Successfully configured $Count Super-Skills for $ToolName."
    Write-Host ""
}

$HomeDir = [Environment]::GetFolderPath("UserProfile")

foreach ($Target in $Targets) {
    switch ($Target) {
        "agy" {
            $Dest = Join-Path $HomeDir ".gemini\config\skills"
            Manage-Target -TargetDir $Dest -ToolName "Google Antigravity (agy)"
        }
        "claude" {
            $Dest = Join-Path $HomeDir ".claude\skills"
            Manage-Target -TargetDir $Dest -ToolName "Claude Code"
        }
        "codex" {
            $Dest = Join-Path $HomeDir ".codex\skills"
            Manage-Target -TargetDir $Dest -ToolName "OpenAI Codex"
        }
    }
}

if ($Uninstall) {
    Write-Host "Uninstallation complete."
} else {
    Write-Host "Configuration complete. Your AI assistants are now equipped with the Super-Skills suite."
}
