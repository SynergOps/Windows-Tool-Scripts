@ECHO OFF &COLOR 70 &TITLE -- Windows 10 default apps re-installer--  Licence: GNU GPL 3 &echo/ 
SET QUIT=PING -n 10 0 ^>NUL 2^>^&1 ^&COLOR 70 ^&EXIT/B
:: check win version
FOR /F "tokens=4-5 delims=. " %%i IN ('ver') DO SET "WINVER=%%i%%j"
IF %WINVER% LSS 100 COLOR 74 &echo ERROR! ONLY FOR WINDOWS 10 &%QUIT%
:: check for admin rights
SET "ADM=" &bcdedit >NUL 2>&1
IF NOT "%ERRORLEVEL%"=="1" SET "ADM=Y"
IF NOT DEFINED ADM COLOR 74 &echo  ERROR! Run again by right-clicking and selecting 'Run as administrator' &%QUIT%
:: gives time to cancel before any changes (all scripts should provide this...)
FOR /L %%I IN (10,-1,1) DO CLS &echo. &echo  Starting in %%Is. Press [Ctrl+C] or X corner to cancel... &PING -n 2 0 >NUL 2>&1

Get-AppXPackage -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}


echo/ &echo Done, reboot your PC now... &%QUIT%
