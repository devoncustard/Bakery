param([string]$identifier,[string]$provider)




function RemoveInstanceVAG($identifier)
{
}
function RemoveInstanceVAG($identifier)
{
}
function RemoveInstanceVAG($identifier)
{
}

switch ($provider)
{
    "VAG" { RemoveInstanceVAG $identifier }
    "AWS" { RemoveInstanceAWS $identifier }
    "ESX" { RemoveInstanceESX $identifier }
}