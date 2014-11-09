param ([string]$instancename,[string]$basetag,[string]$provider,[string]$metadata)

#$identifier is unique host generated identifier - enables scripts to locate machine
$imagedetails=get-bakeryimage $provider $basetag 1

#create new instance

$identifier=create-instance $provider $basetag $imagedetails['Location'] -name $instancename
#start instance
start-instance $provider $identifier
waitforstartup $provider $identifier

#wait for WinRM capabilities
waitforwinrm $identifier $provider

#Get instance IP
$ip=get-instanceip $identifier 192.168.1 $provider

#set credentials and session objects
$creds=create-credentials Vagrant Vag-rant1
$session=new-pssession -computername $ip -cred $creds

#Set remote BOOTSTRAP variable No longer needed
#et-remoteenvvar $ip $creds BOOTSTRAP $provider

#Rename the server
remote-invoke -script 'cscript c:\windows\system32\slmgr.vbs -ipk "GDRKC-WG4G4-636M3-3PM3K-K9Y3P";cscript c:\windows\system32\slmgr.vbs -ato' -session $session
Start-Sleep -seconds 15
renamehost -session $session -hostname $instancename
restart-computer -computername $ip -credential $creds -wait -for  WinRM -Force
#restablish session as reboot killed the previous one
$session=new-pssession -computername $ip -cred $creds
#Join specified domain
join-domain -session $session -domain "mojo" -username "mojo\joe" -password "Ncc-1701d" -ou "OU=Web,OU=Servers,OU=MSD,DC=mojo,DC=local" 
restart-computer -computername $ip -credential $creds -wait -for  WinRM -Force



"Handoff to instance complete"