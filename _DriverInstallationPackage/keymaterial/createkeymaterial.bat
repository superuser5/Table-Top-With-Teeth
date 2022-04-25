REM AtomicRedTeam 
REM Create Key Material For Excercise

del /Q AtomicRedTeam_*

PATH %PATH%;"..\builder\tools";
makecert -r -pe -n "CN=AtomicRedTeam_Simulation_CA" -ss CA -sr CurrentUser ^
   -a sha256 -cy authority -sky signature ^
   -sv AtomicRedTeam_CA.pvk AtomicRedTeam_CA.cer

makecert -pe -n "CN=AtomicRedTeam_Simulation_SPC" -a sha256 -cy end ^
   -sky signature ^
   -ic AtomicRedTeam_CA.cer -iv AtomicRedTeam_CA.pvk ^
   -sv AtomicRedTeam_SPC.pvk AtomicRedTeam_SPC.cer

pvk2pfx -pvk AtomicRedTeam_SPC.pvk -spc AtomicRedTeam_SPC.cer ^
   -pfx AtomicRedTeam_SPC.pfx ^
   -po atomic
   
pvk2pfx -pvk AtomicRedTeam_CA.pvk -spc AtomicRedTeam_CA.cer ^
   -pfx AtomicRedTeam_CA.pfx ^
   -po atomic

