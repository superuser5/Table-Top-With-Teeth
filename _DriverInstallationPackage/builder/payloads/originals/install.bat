REM Install Local CA
certutil -addstore Root AtomicRedTeam_CA.cer >> AtomicRedTeam_Install.log

REM Install Driver 
copy combroker.sys C:\Windows\System32\drivers
sc.exe create COMBroker binpath=  C:\Windows\System32\drivers\combroker.sys type= kernel start= auto displayname= "Atomic Red Team Driver" >> AtomicRedTeam_Install.log

REM Start Driver 
sc.exe start COMBroker >> AtomicRedTeam_Install.log

REM Verify Installation

sc.exe query COMBroker >>  AtomicRedTeam_Install.log
driverquery.exe | findstr combroker >> AtomicRedTeam_Install.log

