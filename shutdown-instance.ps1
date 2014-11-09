param([string]$provider,[string]$identifier)

function ACPIShutdownVAG()
{
	param([string]$identifier)

	vboxmanage controlvm ${identifier} acpipowerbutton
}
function ACPIShutdownAWS()
{
}

function ACPIShutdownESX()
{
}





switch ($provider)
{
    "VAG" { ACPIShutdownVAG $identifier}
    "AWS" { ACPIShutdownAWS $identifier}
    "ESX" { ACPIShutdownESX $identifier}
	
}


