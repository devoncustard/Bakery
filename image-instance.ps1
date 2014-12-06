param([string]$identifier,[string]$provider)
function ImageInstanceVAG()
{
	param([string]$identifer)
	$newid=[Guid]::NewGuid().ToString().Replace("-","")
	vboxmanage clonevm $identifier --mode machine --options keepallmacs --name $newid --basefolder d:\packing --register | Write-Host
	vagrant package --output "e:/box/${newid}.box" --base $newid |Write-Host
	d:
	cd \
	copy e:\box\${newid}.box \\webbake\boxes\${newid}.box
	vboxmanage unregistervm ${newid} --delete |Write-Host
	remove-item e:\box\${newid}.box |Write-Host
	return $newid
}

function ImageInstanceAWS()
{}
function ImageInstanceESX()
{}


$newinstance=""
#[Guid]::NewGuid().ToString().Replace("-","")
switch ($provider)
{
    1 { $newinstance=ImageInstanceVAG $identifier}
    "AWS" { $newinstance=ImageInstanceAWS $identifier}
    "ESX" { $newinstance=ImageInstanceESX $identifier}
}

return $newinstance


