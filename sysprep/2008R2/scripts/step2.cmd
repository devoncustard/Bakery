REM Delete this task. Now weve renamed and rebooted the server we can go ahead and configure puppet
REM and then run it to start pulling configuration data down.
schtasks /delete /TN "Step 2" /f
powershell -ExecutionPolicy Unrestricted -File "c:\windows\setup\scripts\configurepuppet.ps1" 
net start puppet
net stop puppet
puppet agent --test --waitforcert 15 >>c:\windows\setup\scripts\out.txt