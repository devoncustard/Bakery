param([string]$base_tag,[string]$recipeFile,[string]$outputTag,[string]$os,[string]$version,[string]$netmask,[string]$provider)
#$base_tag - name of base image used to construct bakery image - MUST not be a sysprepped image
#$recipeFile - full path to .rcp file containing recipe scriptblock
#$outputTag - name of image that will be stored in the bakery database

Write-Host "Reading recipe" -ForegroundColor Magenta
$recipe=[IO.File]::ReadAllText($recipeFile)
#Sample process for VAGrant provider


#get bakery image details
Write-Host "Getting base image details from repository" -ForegroundColor Magenta
$imagedetails=get-bakeryimage $provider $base_tag 0


# Create and launch instance
Write-Host "Creating instance" -ForegroundColor Magenta
$identifier=create-instance -provider $provider -base $base_tag -location $imagedetails['Location']
$identifier
start-instance -provider $provider -identifier $identifier

#get ipaddress
$ip=get-instanceip -identifier $identifier -ipnetmask $ipnetmask -provider $provider

#Establish Credentials to use
Write-Host "Create credentials" -ForegroundColor Magenta
$username="Vagrant"
$password="Vag-rant1"
$secure_password=ConvertTo-SecureString -String $password -AsPlainText -Force
$cred=new-object -typename System.Management.Automation.PSCredential -argumentlist $username, $secure_password


# Execute recipe. Recipe should shutdown server
Write-Host "Baking recipe" -ForegroundColor Magenta
execute-recipe $provider $identifier $recipe $ip $cred

#need to take image here
Write-Host "Take image (and upload where necessary)" -ForegroundColor Magenta
shutdown-instance -identifier $identifier -provider $provider 
waitforshutdown -provider $provider -identifier $identifier
$dough=image-instance -identifier $identifier -provider $provider
#upload 
Write-Host "Upload image details to repository" -ForegroundColor Magenta
add-bakeryimage -name $dough -location "http://webbake/${dough}.box" -tag $outputTag -sysprep 0 -provider $provider -os $os -version $version


# Sysprep image
Write-Host "Start image again" -ForegroundColor Magenta
start-instance $provider $identifier
start-sleep -s 60
Write-Host "Sysprep image" -ForegroundColor Magenta
sysprep-instance $version $cred $ip
waitforshutdown $provider $identifier
# Take final image and upload metadata to database
Write-Host "Take image (and upload where necessary)"  -ForegroundColor Magenta
$loaf=image-instance $identifier $provider 
add-bakeryImage -name $loaf -location "http://webbake/${loaf}.box" -tag $outputTag -sysprep 1 -provider $provider -os $os -version $version

#Tidyup
remove-instance $identifier $provider
