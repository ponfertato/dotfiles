$ErrorActionPreference = "Stop"

$CONFIG = "windows"
$SUFFIX = ".conf.yaml"
$DOTBOT_DIR = "dotbot"

$DOTBOT_BIN = "bin/dotbot"
$BASEDIR = $PSScriptRoot

$WINDOWS_PLUGIN = "dotbot-plugins/dotbot-firefox, dotbot-plugins/dotbot-scoop, dotbot-plugins/dotbot-windows"

Set-Location $BASEDIR

git -C $DOTBOT_DIR submodule sync --quiet --recursive
git submodule update --init --recursive $DOTBOT_DIR

foreach ($PYTHON in ('python', 'python3', 'python2')) {
	if (& { $ErrorActionPreference = "SilentlyContinue"
			![string]::IsNullOrEmpty((&$PYTHON -V))
			$ErrorActionPreference = "Stop" }) {
		&$PYTHON $(Join-Path $BASEDIR -ChildPath $DOTBOT_DIR | Join-Path -ChildPath $DOTBOT_BIN) -d $BASEDIR --plugin-dir $WINDOWS_PLUGIN -c $CONFIG$SUFFIX $Args
		return
	}
}
Write-Error "Error: Cannot find Python."
