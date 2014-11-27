param([int]$Provider,[string]$CommonName,[string]$ImageType)

#For testing



Add-Type @"
using System;public class ImageRequest{ public string CommonName {get;set;}public int ImageType {get;set;} public string Provider {get;set;} } 
"@



$r=invoke-restmethod -URI "http://webbake/bakery/api/image/?CommonName=${CommonName}&ImageType=${ImageType}&Provider=${Provider}" -Method Get
$r