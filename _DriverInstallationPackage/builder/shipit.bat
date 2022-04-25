REM AtomicRedTeam 
REM Run as Administrator 
REM signtool.exe used since it allows us to append signatures. Set-Authenticode doesn't appear to..

del /Q package.zip
del /Q package_encoded.txt
del /Q .\output\*

PATH %PATH%;".\tools";

copy .\payloads\originals\*.* .\output
ren .\output\Capcom.sys combroker.sys

signtool sign /as /d "description" /du "AtomicRedTeam_Simulation" ^
   /fd SHA256 ^
   /f ..\keymaterial\AtomicRedTeam_SPC.pfx ^
   /p atomic ^
   /v .\output\combroker.sys 
   
REM Output Hash Report

copy ..\keymaterial\AtomicRedTeam_CA.cer .\output

powershell.exe -File .\hasher.ps1

powershell.exe -File .\packer.ps1

del /Q .\output\*.* 

