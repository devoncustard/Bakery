#param([string]$base_tag,[string]$recipe_file,[string]$output_tag,[string]$description)
#$base_tag - name of base image used to construct bakery image - MUST not be a sysprepped image
#$recipe_file - full path to .rcp file containing recipe scriptblock
#$output_tag - name of image that will be stored in the bakery database

$base_tag="joe"
$recipe_file="d:\bakery\recipes\test.rcp"
$output_tag="joe"
$description="joes test"
$os="Windows"
$version="2008R2"
$ipnetmask="192.168.1"
#useful variables
#
#$instance_identifier - identifier returned by provider that will be used to manage baking process
#
#$provider - Virtualisation provider. Used by most scripts to determine which wrapper script to call
#
#$recipe - Holds the specific scriptblock used to configure the instance once it is available





$provider="VAG"


#get bakery image details
Write-Host "Getting base image details from repository" -ForegroundColor Magenta
$imagedetails=get-bakeryimage $provider $base_tag 1


# Create and launch instance
Write-Host "Creating instance" -ForegroundColor Magenta
$identifier=create-instance $provider $base_tag $imagedetails['Location']
start-instance $provider $identifier

