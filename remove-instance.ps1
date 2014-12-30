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
    1 { RemoveInstanceVAG $identifier }
    "AWS" { RemoveInstanceAWS $identifier }
    "ESX" { RemoveInstanceESX $identifier }
}