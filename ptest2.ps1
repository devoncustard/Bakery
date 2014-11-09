$instancename="testme2"
$puppet="puppet7.mojo.local"
$domain="mojo.local"
$environment="mojo"
$basetag="W2008R2-Base"
$provider="VAG"
$metadata=create-metadata $instancename $puppet $domain $environment
provision-instance $instancename $basetag $provider $metadata

