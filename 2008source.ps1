#param([string]$base_tag,[string]$recipe_file,[string]$output_tag,[string]$description)
#$base_tag - name of base image used to construct bakery image - MUST not be a sysprepped image
#$recipe_file - full path to .rcp file containing recipe scriptblock
#$output_tag - name of image that will be stored in the bakery database

$base_tag="W2008R2-Vanilla"
$recipe_file="d:\github\bakery\recipes\W2008R2-source.rcp"
$output_tag="W2008R2-Source"
$os=1
$version="2008R2"
$provider="1"
bake-instance $base_tag $recipe_file $output_tag $os $version $provider