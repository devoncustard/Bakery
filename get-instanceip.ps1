param([string]$identifier,[string]$provider)

function GetInstanceIPVAG
{
	Param([string]$identifier)

    $info=vboxmanage showvminfo $identifier | Select-String -pattern Bridged
    $info=$info.ToString();
    $mac=$info.Substring($info.IndexOf("MAC")+5,12);
    $netid=vboxmanage guestproperty enumerate $identifier | select-string -pattern $mac
    $netid=$netid.ToString().Split('/')[4];
    $ip=(vboxmanage guestproperty get $identifier "/VirtualBox/GuestInfo/Net/${netid}/V4/IP").Replace("Value: ","")
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
    1 { $ip=GetInstanceIPVAG $identifier}
    "ESX" { $ip=GetInstanceIPESX $identifier}
    "AWS" { $ip=GetInstanceIPAWS $identifier}

}

$ip


