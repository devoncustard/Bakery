
	param ([string]$taskname,[string]$username,[string]$password,[string]$ip)
	schtasks /query /tn $taskname /fo CSV /v /s:$ip /HRESULT /u:$username /p:$password| out-file ".\x.csv"
	$csv=import-csv ".\x.csv"
	remove-item ".\x.csv"
	$csv."Last Result"
