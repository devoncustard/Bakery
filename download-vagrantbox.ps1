param([string]$boxname,[string]$location)
$x= Vagrant box list | Select-String -Pattern $boxname
if ( $x -EQ $null)
	{vagrant box add --name $boxname --insecure $location | Write-Host}