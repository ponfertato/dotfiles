# oh-my-posh init pwsh | Invoke-Expression

$params = @{
	ApplicationID  = "973218058208428092"
	LargeImageKey  = "ps_black_1024px"
	LargeImageText = "Powershell $($PSVersionTable.PSVersion.Major).$($PSVersionTable.PSVersion.Minor).$($PSVersionTable.PSVersion.Patch)"
	# SmallImageKey  = "oh-my-posh_1024px"
	# SmallImageText = "Oh-My-Posh $(oh-my-posh version)"
	Details        = "Located in $((Get-Location).path)"
	Start          = "Now"
	UpdateScript   = {
		#Update-DSAsset -LargeImageText "" -SmallImageText ""
		Update-DSRichPresence -Details "Located in $((Get-Location).path)"
	}
}
Start-DSClient @params

Clear-Host
