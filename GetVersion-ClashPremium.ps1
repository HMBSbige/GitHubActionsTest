$ErrorActionPreference = "Stop"

$json = Invoke-RestMethod 'https://api.github.com/repos/Dreamacro/clash/releases/tags/premium'
$verison = ( -Split ($json.name))[1]
Write-Output $verison
