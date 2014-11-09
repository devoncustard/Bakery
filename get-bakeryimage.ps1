param([string]$Provider,[string]$Searchtag,[string]$sysprepped)
#$conn=new-object system.data.sqlclient.sqlconnection
#$conn.connectionstring="Server=127.0.0.1;Database=Bakery;Trusted_Connection=true;"
#$cmd=new-object System.data.sqlclient.sqlcommand
#$cmd.connection=$conn
#$conn.open()
#$cmd.commandtext="SELECT TOP 1 * FROM Images WHERE SearchTag='${tag}' AND SysPrep=${sysprepped} AND Provider='${provider}' ORDER BY BAKEDON DESC"
#$ds=New-Object System.Data.Dataset
#$da=New-Object System.Data.SqlClient.SqlDataAdapter($cmd)
#$da.fill($ds) |Out-Null
#$conn.close()
#Return $ds.tables[0].rows[0]

$Provider="VAG"
$SearchTag="W2008R2-BASE"

$Sysprep=($sysprepped -EQ "true")


Add-Type @"
using System;public class ImageRequest{ public string SearchTag {get;set;}public bool Sysprep {get;set;} public string Provider {get;set;} } 
"@


$o=new-object ImageRequest
$o.SearchTag=$Searchtag
$o.Sysprep=($sysprepped -EQ "True")
$o.Provider=$Provider

$ht2=@{}

$o.psobject.Properties |Foreach { $ht2[$_.Name]=$_.Value }

$r=invoke-restmethod -URI "http://webbake/Bakery/api/image/?Sysprep=${Sysprep}&SearchTag=${Searchtag}&Provider=${Provider}" -Method Get
$r