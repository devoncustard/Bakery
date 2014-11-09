param (	[string]$domain,
		[string]$ou,
		[string]$username,
		[string]$password,
		[System.Management.Automation.Runspaces.PSSession]$session
	)

$script= "netsh interface ip add dns name=""Local Area Connection 2"" addr=192.168.1.50; `$securepassword =  ConvertTo-SecureString ""$password"" -asPlainText -Force ; `$credential = New-Object System.Management.Automation.PSCredential(""${username}"",`$securepassword); Add-Computer -DomainName ""$domain"" -Credential `$credential -oupath ""$ou"""

remote-invoke -script $script -session $session