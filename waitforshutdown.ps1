param([string]$provider,[string]$identifier)


$currentstate
while ($currentstate -ne "Off")
{
	start-sleep -s 5
	Write-Host "." -nonewline
	$currentstate=get-instancestate $provider $identifier
}