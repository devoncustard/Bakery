param([string]$version,[System.Management.Automation.PSCredential]$cred,[string]$ip,[string]$bootstrap)


function getsession()
{
	param ([string]$ip,[System.Management.Automation.PSCredential]$cred)
	$s=new-pssession -computername $ip -cred $cred
	$s
}
function remotecopytextfiles()
{
	param ([string]$localsourcefolder,[string]$remotedestfolder,[System.Management.Automation.Runspaces.PSSession]$rsession)
	$files=[IO.Directory]::GetFiles($localsourcefolder)
	foreach($file in $files)
	{
        $filename=[IO.Path]::GetFileName($file)
        foreach($line in [IO.File]::ReadLines($file))
        {
            $sbtext="write-output '${line}' | out-file -append -encoding ascii -filepath ${remotedestfolder}\${filename}"
            $sb=[ScriptBlock]::Create($sbtext)
		    invoke-command -session $rsession -ScriptBlock $sb
        }
	}

}



cd \
#Create remoting session and start patch 
$session=getsession $ip $cred

remotecopytextfiles "d:\github\bakery\sysprep\${version}\sysprep" "c:\windows\system32\sysprep" $session

invoke-command -session $session {cd \windows\system32\sysprep;c:\windows\system32\sysprep\sysprep.exe /oobe /shutdown /generalize /unattend:c:\windows\system32\sysprep\unattend.xml}


$session.close
