param ([string]$hostname,[System.Management.Automation.Runspaces.PSSession]$session)
$script="`$computerinfo=get-wmiobject -Class Win32_ComputerSystem ; `$computerinfo.rename(""$hostname"")"
remote-invoke -script $script -session $session
