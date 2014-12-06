param([string]$identifier,[string]$ipnetmask,[string]$provider)

function GetInstanceIPVAG
{
	Param([string]$identifier,[string]$ipnetmask)

	$ip1=vboxmanage guestproperty get $identifier "/VirtualBox/GuestInfo/Net/0/V4/IP"
	$ip2=vboxmanage guestproperty get $identifier "/VirtualBox/GuestInfo/Net/1/V4/IP"
	if ($ip1.Contains($ipnetmask))
	{
		$ip=$ip1.Replace("Value: ","")
	}
	elseif ($ip2.Contains($ipnetmask))
	{
		$ip=$ip2.Replace("Value: ","")
	}
	else
	{
		$ip="none found"
	}
		
	$ip
}

function GetInstanceIPAWS
{
}

function GetInstanceIPESX
{
}

switch ($provider)
{
    1 { $ip=GetInstanceIPVAG $identifier $ipnetmask;}
    "ESX" { $ip=GetInstanceIPESX $identifier $ipnetmask;}
    "AWS" { $ip=GetInstanceIPAWS $identifier $ipnetmask;}

}

$ip


