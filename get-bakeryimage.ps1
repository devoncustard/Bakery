param([string]$Provider,[string]$ImageName,[string]$ImageType)

#For testing
$Provider=1
$ImageName="blahblah"
$ImageType=1


Add-Type @"
using System;public class ImageRequest{ public string CommonName {get;set;}public int ImageType {get;set;} public string Provider {get;set;} } 
"@



$r=invoke-restmethod -URI "http://localhost:65316/api/image/?CommonName=${ImageName}&ImageType=${ImageType}&Provider=${Provider}" -Method Get
$r