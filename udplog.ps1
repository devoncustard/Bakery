[int] $Port = 65009 
$IP = "127.0.0.1" 
$Address = [system.net.IPAddress]::Parse($IP) 
 
# Create IP Endpoint 
$End = New-Object System.Net.IPEndPoint $address, $port 
 
# Create Socket 
$Saddrf   = [System.Net.Sockets.AddressFamily]::InterNetwork 
$Stype    = [System.Net.Sockets.SocketType]::Dgram 
$Ptype    = [System.Net.Sockets.ProtocolType]::UDP 
$Sock     = New-Object System.Net.Sockets.Socket $saddrf, $stype, $ptype 
$Sock.TTL = 26 
 
# Connect to socket 
$sock.Connect($end) 
 
# Create encoded buffer 
$Enc     = [System.Text.Encoding]::ASCII 
$d=get-date
$Message = "{0}|{1}|{2}|{3}" -F "a guid should be here",$d,"Windows 2008 R2","some old crap logging message"
$Buffer  = $Enc.GetBytes($Message) 
 
# Send the buffer 
$Sent   = $Sock.Send($Buffer) 
"{0} characters sent to: {1} " -f $Sent,$IP 
"Message is:" 
$Message 
# End of Script 
 



