param([string]$identifier,[string]$provider,[System.Management.Automation.PSCredential]$cred,[string]$ip)


stop-computer -computer $ip -credential $cred -Force



#switch ($provider)
#{
#    "VAG" { shutdown-instance-vagrant $identifier $provider $cred $ip}
#}