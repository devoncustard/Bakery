param([string]$name,[string]$location,[string]$tag,[bool]$sysprep,[string]$provider,[string]$os,[string]$version)
$conn=new-object system.data.sqlclient.sqlconnection
$conn.connectionstring="Server=127.0.0.1;Database=Bakery;Trusted_Connection=true;"

$cmd=new-object System.data.sqlclient.sqlcommand
$cmd.connection=$conn
$conn.open()
$text="insert into Images (Name,Location,SearchTag,Sysprep,BakedOn,Provider,OS_Family,OS_Version) Values(@name,@loc,@stag,@sysp,@bakedon,@provider,@os_family,@os_version)"
$cmd.commandtext=$text
$cmd.Parameters.Add((new-object Data.SqlClient.SqlParameter("@name",[Data.SQLDBType]::NVarChar,50))) >$null
$cmd.Parameters.Add((new-object Data.SqlClient.SqlParameter("@loc",[Data.SQLDBType]::NVarChar,250))) >$null
$cmd.Parameters.Add((new-object Data.SqlClient.SqlParameter("@stag",[Data.SQLDBType]::NVarChar,50))) >$null
$cmd.Parameters.Add((new-object Data.SqlClient.SqlParameter("@sysp",[Data.SQLDBType]::Bit))) >$null
$cmd.Parameters.Add((new-object Data.SqlClient.SqlParameter("@bakedon",[Data.SQLDBType]::DateTime))) >$null
$cmd.Parameters.Add((new-object Data.SqlClient.SqlParameter("@provider",[Data.SQLDBType]::NVarChar,50))) >$null
$cmd.Parameters.Add((new-object Data.SqlClient.SqlParameter("@os_family",[Data.SQLDBType]::NVarChar,50))) >$null
$cmd.Parameters.Add((new-object Data.SqlClient.SqlParameter("@os_version",[Data.SQLDBType]::NVarChar,50))) >$null

$cmd.Parameters["@name"].Value=$name
$cmd.Parameters["@loc"].Value=$location
$cmd.Parameters["@stag"].Value=$tag
$cmd.Parameters["@sysp"].Value=$sysprep
$cmd.Parameters["@bakedon"].Value=Get-Date
$cmd.Parameters["@provider"].Value=$provider
$cmd.Parameters["@os_family"].Value=$os
$cmd.Parameters["@os_version"].Value=$version
$cmd.executenonquery() >$null
$conn.close()
