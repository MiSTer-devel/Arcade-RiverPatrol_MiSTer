@echo off

set    zip=rpatrolb.zip
set ifiles=rp1.4l+rp2.4j+rp3.4f+rp4.4e+rp5.4c+rp6.6n+rp7.6l+rp8.6k+rp9.6h+rp11.6c+rp10.6a

set  ofile=a.rpatrol.rom

rem =====================================
setlocal ENABLEDELAYEDEXPANSION

set pwd=%~dp0
echo.
echo.

if EXIST %zip% (

	!pwd!7za x -otmp %zip%
	if !ERRORLEVEL! EQU 0 ( 
		cd tmp

		copy /b/y %ifiles% !pwd!%ofile%
		if !ERRORLEVEL! EQU 0 ( 
			echo.
			echo ** done **
			echo.
			echo Copy "%ofile%" into root of SD card
		)
		cd !pwd!
		rmdir /s /q tmp
	)

) else (

	echo Error: Cannot find "%zip%" file
	echo.
	echo Put "%zip%", "7za.exe" and "%~nx0" into the same directory
)

echo.
echo.
pause
