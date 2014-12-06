param ([string]$provider,[string]$identifier)
function StartInstanceVAG()
{
	param([string]$identifier)
	d:
	cd \vagrant\${identifier}
	vagrant up ${identifier}
}
function StartInstanceAWS()
{}
function StartInstanceESX()
{}

write-host "Starting instance ${instance}" -ForegroundColor Cyan
switch ($provider)
{
    1 { write-host "Using VirtualBox provider" -ForegroundColor Magenta;StartInstanceVAG $identifier}
}

