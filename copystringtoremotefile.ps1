param ([string]$remotedestfolder,[System.Management.Automation.Runspaces.PSSession]$session,[string]$data,[string]$filename)
	$data | split-string -separator "`r`n" | foreach-object{
		$sbtext="write-output '$_' | out-file -append -encoding ascii -filepath ${remotedestfolder}\${filename}";
		$sb=[ScriptBlock]::Create($sbtext);
		invoke-command -session $session -ScriptBlock $sb;
	}
