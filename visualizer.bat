@echo off
color 0b
title Chat Room
set logs=%1

:read_loop
	@mode con cols=70 lines=40
	cls
	echo.
	type %logs%
	echo.
	timeout /t 1 /nobreak > nul
goto read_loop