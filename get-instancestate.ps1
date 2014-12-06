param ([string]$provider,[string]$identifier)
#Get-State
function GetStateVAG ()
{
    param ([string]$identifier)
	$x=vboxmanage showvminfo ${identifier} | select-string State: 
	$x=$x.ToString().Substring(17,$x.ToString().Indexof(' (')-17)
	$x
}


$state=""
switch ($provider)
{
	1 { $state=GetStateVAG $identifier}
	"AWS" {}
	"ESX" {}
}

switch ($state.ToLower())
{
    "running" { $state="On" }
    "powered off" { $state="Off" }
}

$state


