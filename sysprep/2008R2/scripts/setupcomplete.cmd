REM Create the scheduled task Step 1 that will start on next boot. Then force a reboot
cscript //h:cscript
slmgr.vbs -ato
start /wait shutdown /r /t 2