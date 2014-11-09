$a

switch ($env:BOOTSTRAP)
    {
        "VAG" { $a=get-content c:\metadata\metadata.txt }
        default {
                  exit                  
                }

    }
          



$h=@{}
foreach ($i in $a)
{
    $data=$i.split(":");
    $h.Add($data[0],$data[1]);
}
$newname=$h.get_item("Hostname")
$computerinfo=get-wmiobject -Class Win32_ComputerSystem
$computerinfo.rename($newname)

