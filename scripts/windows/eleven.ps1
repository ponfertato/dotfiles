# Создаем список возможных вариантов выбора
$choices = @(
	"1. Установки для Docker",
	"2. Установки для Podman",
	"3. Установки для Visual Studio Code",
	"4. Установки для удаленной работы",
	"5. Установки для оболочки Posh",
	"0. Только применение конфига windows.conf"
)

# Выводим список выбора пользователю
Write-Host "Выберите установки (цифры можно перечислить через пробел): "
$choices | ForEach-Object { Write-Host $_ }

# Запрос выбора у пользователя
$choice = Read-Host "Введите номера через пробел"

# Логика в зависимости от выбранного варианта
switch ($choice) {
	"1" {
		Write-Host "Установки для Docker"
		Get-ChildItem -Path "${BASEDIR}/scripts/windows/eleven/containerization/docker" -Filter "*.ps1" | Foreach-Object { & $_.FullName }
	}
	"2" {
		Write-Host "Установки для Podman"
		Get-ChildItem -Path "${BASEDIR}/scripts/windows/eleven/containerization/podman" -Filter "*.ps1" | Foreach-Object { & $_.FullName }
	}
	"3" {
		Write-Host "Установки для Visual Studio Code"
		Get-ChildItem -Path "${BASEDIR}/scripts/windows/eleven/editors/vscode" -Filter "*.ps1" | Foreach-Object { & $_.FullName }
	}
	"4" {
		Write-Host "Установки для удаленной работы"
		Get-ChildItem -Path "${BASEDIR}/scripts/windows/eleven/remoteness" -Filter "*.ps1" | Foreach-Object { & $_.FullName }
	}
	"5" {
		Write-Host "Установки для оболочки Posh"
		Get-ChildItem -Path "${BASEDIR}/scripts/windows/eleven/shell/posh" -Filter "*.ps1" | Foreach-Object { & $_.FullName }
	}
	default {
		Clear-Host
		Write-Host "Неверный выбор. Пожалуйста, попробуйте еще раз."
		Start-Sleep 2
		Clear-Host
		. "${BASEDIR}/scripts/windows/eleven.ps1"
	}
}