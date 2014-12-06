param([string]$id,[string]$desc,[string]$location,[string]$commonname,[int]$imagetype,[int]$provider,[int]$osfamily,[string]$osversion,[string]$user,[string]$pass)

$bakedon=get-date
$id
$base64AuthInfo=[Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $user,$pass)))
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


invoke-restmethod http://webbake/bakery/api/image -Method Post -Body $body -Headers @{Authorization=("Basic {0}" -f $base64AuthInfo)}
#invoke-restmethod http://localhost:65316/api/image -Method Post -Body $body

