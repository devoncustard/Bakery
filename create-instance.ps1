param(
	[string]$provider,
	[string]$base,
	[string]$location,
	[string]$name
	)


function CreateInstanceVAG()
{
	param (
		[string]$name
		)	
	
	
	
	$vaguser="vagrant"
	$vagpass="Vag-rant1"
	
	if ($name -EQ "")
		{$name=[guid]::NewGuid().ToString().Replace("-","")}
	
	
	
	if (Test-Path d:\vagrant\$name)
	{
		d:
		cd \vagrant\$name
		if (Test-Path vagrantfile) {vagrant destroy -f}
		cd..
		remove-item $name -recurse
	}
	d:
	cd \vagrant
	mkdir $name >$null
	cd $name
	vagrant init >$null
	remove-item vagrantfile

	# Create the vagrant file
	write-output "# -*- mode: ruby -*-" | out-file -encoding ascii d:\vagrant\$name\vagrantfile
	write-output "# vi: set ft=ruby :"|out-file -encoding ascii -append d:\vagrant\$name\vagrantfile
	write-output "# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!"|out-file -encoding ascii -append d:\vagrant\$name\vagrantfile
	write-output "Vagrant.configure("2") do |config|"|out-file -encoding ascii -append d:\vagrant\$name\vagrantfile
	write-output "    config.vm.boot_timeout=600"|out-file -encoding ascii -append d:\vagrant\$name\vagrantfile
	write-output "    config.vm.define :'$name' do |guest|" |out-file -encoding ascii -append d:\vagrant\$name\vagrantfile
	write-output "        guest.vm.box= ""$base""" |out-file -encoding ascii -append d:\vagrant\$name\vagrantfile
	write-output "        guest.vm.guest = :windows" |out-file -encoding ascii -append d:\vagrant\$name\vagrantfile
	write-output "        guest.vm.communicator = ""winrm""" |out-file -encoding ascii -append d:\vagrant\$name\vagrantfile
	write-output "        guest.windows.halt_timeout=25" |out-file -encoding ascii -append d:\vagrant\$name\vagrantfile
	write-output "        guest.winrm.username = ""${vaguser}""" |out-file -encoding ascii -append d:\vagrant\$name\vagrantfile
	write-output "        guest.winrm.password=""${vagpass}""" |out-file -encoding ascii -append d:\vagrant\$name\vagrantfile
	write-output "        guest.winrm.max_tries=30" |out-file -encoding ascii -append d:\vagrant\$name\vagrantfile
	write-output "        guest.winrm.timeout=3600" |out-file -encoding ascii -append d:\vagrant\$name\vagrantfile
	write-output "        guest.windows.set_work_network" |out-file -encoding ascii -append d:\vagrant\$name\vagrantfile
	write-output "        guest.vm.network :forwarded_port, guest:5985, host:5985, id:""winrm"", auto_correct: true" |out-file -encoding ascii -append d:\vagrant\$name\vagrantfile
	write-output "        guest.vm.network ""public_network"", :bridge => 'Intel(R) Ethernet Connection I217-V'" |out-file -encoding ascii -append d:\vagrant\$name\vagrantfile
	write-output "        guest.vm.provider :virtualbox do |vb|" |out-file -encoding ascii -append d:\vagrant\$name\vagrantfile
    Write-output "			  vb.name=""$name"""	| Out-file -encoding ascii -append d:\vagrant\$name\vagrantfile						 
	write-output "            vb.gui = true" |out-file -encoding ascii -append d:\vagrant\$name\vagrantfile
	write-output "            vb.customize [""modifyvm"", :id, ""--memory"", ""1024""]" |out-file -encoding ascii -append d:\vagrant\$name\vagrantfile
	write-output "            vb.customize [""modifyvm"", :id, ""--name"", ""$name""]" |out-file -encoding ascii -append d:\vagrant\$name\vagrantfile
	write-output "        end" |out-file -encoding ascii -append d:\vagrant\$name\vagrantfile
	write-output "    end" |out-file -encoding ascii -append d:\vagrant\$name\vagrantfile
	write-output "end" |out-file -encoding ascii -append d:\vagrant\$name\vagrantfile
	
	
	download-vagrantbox $base $location | Write-Host
	Write-Host "Box downloaded"
	return $name
}

function CreateInstanceAWS()
{}
function CreateInstanceESX()
{}




$identifier=""

switch ($provider)
{
    1 { $identifier=CreateInstanceVAG -name $name}
	"ESX" { $identifier=CreateInstanceESX}
	"AWS" { $identifier=CreateInstanceAWS}
}
return $identifier




