$name="test"


$body=@{
	Name=$name

	}


invoke-restmethod http://localhost:65316/api/image -Method Delete -Body $body