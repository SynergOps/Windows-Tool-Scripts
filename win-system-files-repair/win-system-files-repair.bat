@ECHO OFF &COLOR 70 &TITLE Windows System Repair script, Licence: GNU GPL 3 &echo/ 
SET QUIT=PING -n 10 0 ^>NUL 2^>^&1 ^&COLOR 70 ^&EXIT/B
:: check for admin rights
SET "ADM=" &bcdedit >NUL 2>&1
IF NOT "%ERRORLEVEL%"=="1" SET "ADM=Y"
IF NOT DEFINED ADM COLOR 74 &echo  ERROR! Run again by right-clicking and selecting 'Run as administrator' &%QUIT%
:: gives time to cancel before any changes (all scripts should provide this...)
FOR /L %%I IN (10,-1,1) DO CLS &echo. &echo  Starting in %%Is. Press [Ctrl+C] or X corner to cancel... &PING -n 2 0 >NUL 2>&1
CLS

:: first scan system files
sfc /scannow


:: Then download a default system image file and try to repair
DISM /Online /Cleanup-Image /RestoreHealth

echo/ &echo Done, reboot your PC now... &%QUIT%
