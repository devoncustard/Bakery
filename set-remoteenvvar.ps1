#set environment variable on remote instance
param ([string]$hostname,[System.Management.Automation.PSCredential]$creds,[string]$VariableName,[string]$VariableValue)
$hostname
$creds
$VariableName
$VariableValue
$session=new-pssession -computername $hostname -cred $creds
$sb="[Environment]::SetEnvironmentVariable(""${VariableName}"",""${VariableValue}"",""Machine"")"
$sb=[ScriptBlock]::Create($sb)
invoke-command -session $session -ScriptBlock $sb
