@echo off
:start
cls
echo Hello
echo The following scripts are some useful scripts on Windows PC's.

echo Runs normally
echo Winget			:	Will update all of the program windows finds.
echo IP			:	Shows you the IP address of you internet modules
echo Ports			:	This shows you all the currently open ports on this IP address
echo MacAdr			:	This will show you all of your computer's Mac addresses.
echo Ping			:	Pings a website to see if you should be able to connect and shows the delay in ms
echo CPing			:	A ping that continuous until the this command prompt is closed
echo PPing			:	A ping that shows you the path to the specified website
echo TPing			:	A ping that shows you the path + 3 different packets being sent out
echo RunningPrg		:	Shows you all of the currently running programs (even those task manager doesn't show)
echo ClosePrg		: 	This will stop a currently running program
echo Users			:	This shows you all the users on this machine

echo Needs this file to run as administrator
echo sfcScan			:	will scan and try to repair corrupted files.
echo DISMOnlineCleanup	:	Will try to repair corrupt windows files. (Recommended to run after sfcScan)
echo checkDisk		:	This will check your disk and see if there is any errors 
echo checkDiskSector		:	This will check your disk and sectors and see if there is any errors
echo energyInfo		:	This will show you how your energy is going
echo batteryInfo		: 	This will show you how your battery is going
echo Powerconfig		:	This will modify the power configuration of this pc


echo BIOS			: 	This will restart your computer into its bios without you having to press a button


set /p command=What command do you want to run?

goto %command%

:Winget
cls
WINGET UPGRADE --ALL
echo Command done. Press enter to return to start
pause
goto start

:MacAdr
cls
getmac /v
echo Command done. Press enter to return to start
pause
goto start

:energyInfo
cls
powercfg /energy
echo Copy the address above to look at the report
echo Command done. Press enter to return to start
pause
goto start

:batteryInfo
cls
powercfg /batteryreport
echo Copy the address above to look at the report
echo Command done. Press enter to return to start
pause
goto start

:sfcScan
cls
sfc /scannow
echo Command done. Press enter to return to start
pause
goto start

:DISMOnlineCleanup 
cls
DISM.exe /Online /Cleanup-image /Restorehealth
echo Command done. Press enter to return to start
pause
goto start

:checkDisk 
cls
chkdsk /f
echo Command done. Press enter to return to start
pause
goto start

:checkDiskSector
cls
chkdsk /r
echo Command done. Press enter to return to start
pause
goto start

:BIOS
cls
shutdown /r /fw /f /t 0

:ping
cls
set /p web=What website do you wanna ping (connect to)?
ping %web%
pause
goto start

:Cping
cls
set /p web=What website do you wanna ping (connect to)?
ping -t %web%
pause

:pping
cls
set /p web=What website do you wanna ping (connect to)?
pathping %web%
echo Command done. Press enter to return to start
pause
goto start

:pping
cls
set /p web=What website do you wanna ping (connect to)?
pathping %web%
echo Command done. Press enter to return to start
pause
goto start

:tping
cls
set /p web=What website do you wanna ping (connect to)?
tracert %web%
echo Command done. Press enter to return to start
pause
goto start

:RunningPrg
cls
tasklist -svc
echo Command done. Press enter to return to start
echo what do you wanna do next?
echo Back or close (a program)?
set /p tasklistchoice=(Back/Close)?
goto %tasklistchoice%
:close
set /p CloseCommand=What application do you wanna close?
taskkill -im %CloseCommand%.exe
echo Command done. Press enter to return to start
pause
goto start
:back
goto start

:ClosePrg
cls
set /p CloseCommand=What application do you wanna close?
taskkill -im %CloseCommand%.exe
echo Command done. Press enter to return to start
pause
goto start

:users
cls
finger
echo Command done. Press enter to return to start
pause
goto start

:IP
cls
ipconfig
echo Command done. Press enter to return to start
pause
goto start

:ports
cls
netstat -an
echo Command done. Press enter to return to start
pause
goto start

:Powerconfig
echo what do you wanna configure?
echo 1: List powerstates on this computer
echo 2: Unlock Ultimate Performance (optimal ytelse)
echo 3: Hibernate ON
echo 4: Hibernate Off
echo 5: Show available hibernate states of this pc
echo 6: Disable modern standby and enable S3 sleep (Reccomended on laptops)
echo 7: Enable modern standby (Not reccomended because modern standy is bad)
echo 0: Back
set /p GUID=What do you wanna do?
goto %GUID%

:0
goto start

:1
cls
powercfg /l
goto Powerconfig

:2
cls
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
echo Unlocked. Go to control panel to enable it
goto Powerconfig

:3 
cls
powercfg hibernate on
echo Hibernate is now on
pause
goto Powerconfig

:4 
cls
powercfg hibernate off
echo Hibernate is now off
pause
goto Powerconfig

:5
cls
powercfg /a
pause
goto Powerconfig

:6
cls
reg add HKLM\System\CurrentControlSet\Control\Power /v PlatformAoAcOverride /t REG_DWORD /d 0
echo Modern standby is now disabled
pause
goto Powerconfig

7:
cls
reg delete "HKLM\System\CurrentControlSet\Control\Power" /v PlatformAoAcOverride /f
echo Modern standby is now enabled
pause
goto Powerconfig

