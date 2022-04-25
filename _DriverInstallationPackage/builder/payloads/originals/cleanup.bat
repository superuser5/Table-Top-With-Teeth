certutil -delstore Root AtomicRedTeam_CA

sc.exe stop COMBroker >> AtomicRedTeam_UninstallLog.txt
sc.exe delete COMBroker >> AtomicRedTeam_UninstallLog.txt
del C:\Windows\System32\Drivers\combroker.sys >> AtomicRedTeam_UninstallLog.txt
driverquery -v >> AtomicRedTeam_UninstallLog.txt
sc.exe query COMBroker >> AtomicRedTeam_UninstallLog.txt
