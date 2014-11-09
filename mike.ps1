param ([string]$vbname)
$r=vboxmanage showvminfo $vbname | select-string -pattern State
$r=$r.ToString()
$r=$r.substring(17, ($r.indexof(" (")-17))
$r
