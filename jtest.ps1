$instancename="testthis3"
$puppet="puppet7.mojo.local"
$domain="mojo.local"
$environment="mojo"
$basetag="W2008R2-Base"
$provider="VAG"
$metadata=create-metadata $instancename $puppet $domain $environment
$identifier="517b0b6ad3d14fd196690f9db5b420d0"
$ip=get-instanceip $identifier 192.168.1 $provider
$creds=create-credentials Vagrant Vag-rant1
$ip
waitforwinrm -identifier $identifier -provider $provider
$session=new-pssession -computername $ip -cred $creds
$session

renamehost -session $session -hostname $instancename
join-domain -session $session -ou "OU=Web,OU=Benifold,OU=Mojo-Software,DC=mojo,DC=local" -username "mojo\Administrator" -password "Ncc1701d" -domain "mojo"
remote-invoke -Script "shutdown /r /f /t 0" -session $session