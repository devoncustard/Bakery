$name="test"
$desc="test desc"
$location="anywhere"
$searchtag="dontusethis"
$sysprep=$true
$bakedon=get-date
$provider="VAG"
$osfamily="CentOS"
$osversion="7"

$body=@{
	Name=$name
	Description=$desc
	Location=$location
	SearchTag=$searchtag
	Sysprep=$sysprep
	Bakedon=$bakedon
	Provider=$provider
	OS_Family=$osfamily
	OS_Version=$osversion
	}


invoke-restmethod http://localhost:65316/api/image -Method Post -Body $body