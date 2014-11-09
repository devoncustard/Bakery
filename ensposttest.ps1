

Add-Type @"
using System;public class wnode{ public string hostname {get;set;}public string enctext {get;set;} } 
"@

$enctext="---`nclasses:`n   windows`n";

$n=new-object wnode;
$n.hostname=[string]"test123";
$n.enctext=[string]$enctext

$ht2=@{}

$n.psobject.Properties |Foreach { $ht2[$_.Name]=$_.Value }

invoke-restmethod -uri http://localhost:63062/api/node -Method Post -Body $ht2