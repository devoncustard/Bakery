param([string]$boxname,[string]$location)
Write-Host ($boxname)
Write-Host ("-------")
Write-Host ($location)
$x= Vagrant box list | Select-String -Pattern $boxname
if ( $x -EQ $null)
	{vagrant box add --name $boxname --insecure $location | Write-Host}