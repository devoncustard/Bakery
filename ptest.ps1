$instancename="W2008R2-Base-x"
$puppet="puppet8.mojo.local"
$domain="mojo.local"
$environment="mojo"
$basetag="W2008R2-Base"
$provider="VAG"
$metadata=create-metadata $instancename $puppet $domain $environment
provision-instance $instancename $basetag $provider $metadata

