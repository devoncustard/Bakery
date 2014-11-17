param([string]$id,[string]$location,[string]$commonname,[int]$imagetype,[int]$provider,[int]$os,[string]$version)

# test parameters
$id=[Guid]::NewGuid().ToString().Replace("-","")
$desc="test desc"
$location="anywhere"
$commonname="blahblah"
$imagetype=1
$bakedon=get-date
$provider=1
$osfamily=1
$osversion="2008R2"

$body=@{
	Id=$id
	Description=$desc
	Location=$location
	CommonName=$commonname
	ImageType=$ImageType
	Bakedon=$bakedon
	Provider=$provider
	OS_Family=$osfamily
	OS_Version=$osversion
	}


invoke-restmethod http://localhost:65316/api/image -Method Post -Body $body
