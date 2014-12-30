param([System.Management.Automation.PSCredential]$cred,[string]$ip,[string]$name,[string]$path)
new-psdrive -name $name -PSProvider FileSystem -Root \\$ip\$path -Credential $cred -scope Global
