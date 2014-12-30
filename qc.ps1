param([string]$id)

$ip=get-instanceip -provider 1 -identifier $id
$username="vagrant"
$password="Vag-rant1"
$cred=create-credentials.ps1 -username $username -password $password
$session=new-pssession -computername $ip -cred $cred
$session