@echo off

:main
	color 0a
	title Writer
	set exit_cmd=*q*
	echo.
	echo Enter your chat log file location. 
	echo Ex: "\\USER-PC\FOLDER\chatlogs.txt"
	echo.
	set/p logs=Logs location: 
	cls

	for /F "tokens=2" %%i in ('date /t') do set mydate=%%i
	set mytime=%time%
	echo.
	set/p name=Enter your username: 
	(
		echo.
		echo [%mydate%-%mytime%]
		echo %name% has joined the chat 
	) >> %logs%
	start visualizer.bat %logs%

	:write_loop
		@mode con cols=70 lines=20
		cls

		echo.
		set/p msg=Message (*q* to exit): 
	
		for /F "tokens=2" %%i in ('date /t') do set mydate=%%i
		set mytime=%time%
		
		if /i "%msg%"=="%exit_cmd%" (
			(
				echo.
				echo [%mydate%-%mytime%]
				echo %name% has left the chat 
			) >> %logs%
			echo.
			echo Exiting the chat
			echo Press a key to close the console...
			pause > nul
			exit
		) else (
			(
				echo.
				echo [%mydate%-%mytime%]
				echo %name%: %msg% 
			) >> %logs%
			goto write_loop
		)