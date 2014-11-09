param([string]$provider,[string]$identifier,[string]$recipe,[string]$ip,[System.Management.Automation.PSCredential]$cred)

#Provider agnostic script, no host interaction required.

$session=new-pssession -computername $ip -cred $cred
$sb=[ScriptBlock]::Create($recipe)
&$sb
$session.close
