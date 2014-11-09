

Add-Type @"
    using System;public class request{
    public string basetag {get;set;}
    public string domain {get;set;}
    public string environment {get;set;}
    public string location {get;set;}
    public string provider {get;set;}
    public string puppetmaster {get;set;}
    public string role {get;set;}
} 
"@


$n=new-object request;

$n.basetag="W2008R2-BASE"
$n.domain="mojo.local"
$n.environment="TEST"
$n.location="Benifold"
$n.provider="VAG"
$n.puppetmaster="puppet.mojo.local"
$n.role="web"

$ht2=@{}

$n.psobject.Properties |Foreach { $ht2[$_.Name]=$_.Value }

invoke-restmethod http://provsvc/provisioning/api/stack -Method Post -Body $ht2