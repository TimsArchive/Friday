@echo off
:start
	CLS
	title Friday Alarm

	REM Global Variables
	set fridayPromptMessage=%time:~0,5% Friday Alarm:
	set reflectedEvent=%1
	set userMessage=%2
	goto event%reflectedEvent%

REM Event Trigger: AlarmClock
REM	Root Trigger: Friday
:eventAlarmActive
	REM Loop for custom message on timer
	setlocal enabledelayedexpansion

	REM Message Formatting
	:messageFormatLoopSection
		setlocal enabledelayedexpansion
		set loopIterations=5

		:formatLoopStart
			for /L %%i in (1,1,5) do (

				if %loopIterations% LEQ 0 (

					goto formatLoopEnd

				) else (

					echo.
					set /a loopIterations-=1
					goto formatLoopStart
				)
			)

		:formatLoopEnd
			endlocal
			goto messageColorLoopSection

	REM Background color loop - x15
	:messageColorLoopSection

		setlocal enabledelayedexpansion
		set loopIterations=10

		:colorLoopStart
			for /L %%i in (1,1,5) do (

				if %loopIterations% leq 0 (

					goto colorLoopEnd

				) else (

					REM %userMessage% is sent as a string from: Friday_menuChoice1_Communication
					CLS
					echo.
					echo                                                    -~ Alarm Active ~-
					echo                                                      -------------
					echo.
					echo                                              %userMessage%
					for /L %%i in (1,1,22) do (

						echo.

					)

					echo %fridayPromptMessage% Alarm closes automatically in %loopIterations%..

					timeout /nobreak /t 1 >nul
					color 80

					timeout /nobreak /t 1 >nul
					color 07

					set /a loopIterations-=1
					goto colorLoopStart

				)
			)
		:colorLoopEnd

		endlocal
		goto fridayAlarmEnd

REM Friday Alarm End
:fridayAlarmEnd
	exit