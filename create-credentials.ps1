#create credentials
param ([string]$username,[string]$password)
$secure_password=ConvertTo-SecureString -String $password -AsPlainText -Force
$cred=new-object -typename System.Management.Automation.PSCredential -argumentlist $username, $secure_password
$cred