$ErrorActionPreference = "Stop"

$CONFIG = "windows"
$SUFFIX = ".conf.yaml"
$DOTBOT_DIR = "dotbot"

$BASEDIR = "$PSScriptRoot"
$DOTBOT_BIN = "bin/dotbot"
$DOTBOT_PLUGIN = "dotbot-plugins"

Set-Location "$BASEDIR"

git -C "$DOTBOT_DIR" submodule sync --quiet --recursive
git submodule update --init --recursive "$DOTBOT_DIR"

$PYTHON = ('python', 'python3', 'python2') | where-object { & { $ErrorActionPreference = "SilentlyContinue"; ![string]::IsNullOrEmpty((&$_ -V)); $ErrorActionPreference = "Stop" } } | select-object -first 1

$osVersion = [System.Environment]::OSVersion.Version.Build
$firstTwoDigits = $osVersion.ToString().substring(0, 2)
if ($firstTwoDigits -eq "19") {
	Write-Host "Windows 10"
	. "${BASEDIR}/scripts/windows/ten.ps1"
	&$PYTHON $(Join-Path "$BASEDIR" -ChildPath "$DOTBOT_DIR" | Join-Path -ChildPath "$DOTBOT_BIN") -d "$BASEDIR" --plugin-dir $DOTBOT_PLUGIN/* -c "$CONFIG$SUFFIX" "$Args"
}
elseif ($firstTwoDigits -eq "22") {
	Write-Host "Windows 11"
	. "${BASEDIR}/scripts/windows/eleven.ps1"
	&$PYTHON $(Join-Path "$BASEDIR" -ChildPath "$DOTBOT_DIR" | Join-Path -ChildPath "$DOTBOT_BIN") -d "$BASEDIR" --plugin-dir $DOTBOT_PLUGIN/* -c "$CONFIG$SUFFIX" "$Args"
}
else {
	Write-Host "unknown windows osVersion: $osVersion, not doing anything special"
}
Write-Error "Error: Cannot find Python."
