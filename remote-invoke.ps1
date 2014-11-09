param([string]$script,[System.Management.Automation.Runspaces.PSSession]$session)
$script

$sb=[ScriptBlock]::Create($script)
invoke-command -session $session -ScriptBlock $sb;
$session.close
