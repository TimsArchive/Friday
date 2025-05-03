@echo off
:start
	CLS
	title Friday - Reflect

	REM Declare Global Variables
        REM Declare Friday folder location
            set "fridayRootFolder=Friday_Root"
            set "documentsPath=%USERPROFILE%\Documents"
            set "fridayRootLocation=%documentsPath%\%fridayRootFolder%"

        REM Declare Friday "Mainroutines"
            REM Location
            set "fridayMainroutinesLocation=%fridayRootLocation%"

            REM Main MenuChoice1 [Communication]
            set "fridayMainMenuChoice1=%fridayRootLocation%\Friday_MenuChoice1_Communication.bat"

            REM Main MenuChoice2 [System Info]
            set "fridayMainMenuChoice2=%fridayMainroutinesLocation%\Friday_MenuChoice2_SystemInfo.bat"

            REM Main MenuChoice4 [Exit Friday]
                REM This is not needed but kept for consistency.

            REM Main MenuChoice5 [Options] (WIP)
            set "fridayMainMenuChoice2=%fridayMainroutinesLocation%\Friday_MenuChoice5_Options.bat"

            REM Main MenuChoice6 [Passwords] (WIP)
            set "fridayMainMenuChoice6=%fridayMainroutinesLocation%\Friday_MenuChoice6_Passwords.bat"

            REM Main MenuChoice7 [Saves]
            set "fridayMainMenuChoice7=%fridayMainroutinesLocation%\Friday_MenuChoice7_Saves.bat"

            REM Main MenuChoice8 [Update menu] (mostly used for Main menu clock)
                REM Also not needed but kept for consistency.

            REM Main MenuChoice9 [TestSite]
            set "fridayMainMenuChoice9=%fridayMainroutinesLocation%\Friday_MenuChoice9_TestSite.bat"

        REM Declare Friday Subroutines location
            set "fridaySubroutinesLocation=%fridayRootLocation%\Friday\Subroutines"

        REM Declare Sub-directories
            REM Documents
            set "fridayDocumentsFolder=Friday Documents"
            set "fridayDocumentsLocation=%fridayRootLocation%\%fridayDocumentsFolder%"

                REM Messages
                set "fridayMessagesFolder=Friday Messages"
                set "fridayNotesLocation=%fridayRootLocation%\%fridayDocumentsFolder%\%fridayMessagesFolder%"

                REM Alarms
                set "fridayAlarmsFolder=Friday Alarms"
                set "fridayAlarmsFolderLocation=%fridayRootLocation%\%fridayDocumentsFolder%\%fridayAlarmsFolder%"


                REM Games
                set "fridayGamesFolder=Friday Games"
                set "fridayGamesFolderLocation=%fridayRootLocation%\%fridayDocumentsFolder%\%fridayGamesFolder%"

            REM Reflect
            set "fridayReflectFolder=Friday Reflect"
            set "fridayReflectFolderLocation=%fridayRootLocation%\%fridayDocumentsFolder%\%fridayReflectFolder%"

	REM Set the first variable sent to Friday_Reflect as a "trigger"
	set trigger=%1

	REM Jump to event
	goto event%trigger%

REM ---------------------------------------------------------------------------------------------------------------------------------
REM AlarmClock (Countdown)
REM Root Trigger: Friday (Page 1)
:eventAlarmClockCountdown
		setlocal enabledelayedexpansion
		CLS

		set fridayAlarmPromptMessage=%time:~0,5% Friday Alarm:
		set timerTime=%2
		set userMessage=%3

		:countDownLoop
		if %timerTime% gtr 0 (

			CLS
			echo %fridayAlarmPromptMessage% "Countdown Started!"
			echo                     "Don't close this window"
			echo                     "%timerTime% seconds remaining"

			timeout /t 1 /nobreak >nul

			set /a timerTime-=1
			goto countDownLoop
		)

		REM When timer ends, start alarm and send relevant variables
		set reflectedEvent=AlarmActive
		start "" cmd /k call "!fridaySubroutinesLocation!\Menu Page 1 (Start)\Friday MenuChoice 1\Friday_MenuChoice1_Alarm.bat" !reflectedEvent! !userMessage!
        endlocal
		goto reflectEnd

REM ---------------------------------------------------------------------------------------------------------------------------------
REM AlarmClock (System Time)
REM Root Trigger: Friday (Page 1)
:eventAlarmClockTime
		setlocal enabledelayedexpansion
		CLS
		set fridayAlarmPromptMessage=%time:~0,5% Friday Alarm:
		set timerTime=%2
		set userMessage=%3

		:eventAlarmClockTimeLoopStart
		if %timerTime%==%time:~0,5% (

			CLS
			goto eventAlarmClockTimeEnd

		) else (

			CLS
			echo %fridayReflectPromptMessage% "Alarm will be triggered at %timerTime%"
			echo %fridayReflectPromptMessage% "Current Time is: %time:~0,5%"
			timeout /nobreak /t 1 >nul
			goto eventAlarmClockTimeLoopStart

		)

		:eventAlarmClockTimeEnd
		REM When timer ends, start alarm and send relevant variables
		set reflectedEvent=AlarmActive
		start "" cmd /k call "!fridaySubroutinesLocation!\Menu Page 1 (Start)\Friday MenuChoice 1\Friday_MenuChoice1_Alarm.bat" !reflectedEvent! !userMessage!
		endlocal
		goto reflectEnd

REM ---------------------------------------------------------------------------------------------------------------------------------
REM Choose Menu Page
REM Root Trigger: Friday (Page 1)
:eventChooseMenuPage
    @echo off
    CLS

    REM If echo is on; Display: "([Hour]:[Minute]) %fridayPromptMessage% " as the prompt
    prompt %time:~0,5% Friday:
    set fridayPromptMessage=%time:~0,5% Friday:

    REM Prompt User
    echo %fridayPromptMessage% "Loading.."
    goto continueChooseMenuPageMain

    :continueChooseMenuPageMain
        endlocal
        goto chooseMenuPageMain

    :chooseMenuPageMain
        @echo off
        CLS
        setlocal enabledelayedexpansion

        REM Print menu options.
        echo =------------------------------------------------~ { Friday Reflect } ~------------------------------------------------=
        echo {MenuPages\[Choose]
        echo.
        echo                          Current Page                    Pages                        Status
        echo                         +------------+         +-----------------------+           +----------+
        echo                              0/9
        echo                                                    1 - Main (Page 1)                   DONE
        echo                                                    2 - Friday Utility                  90 %%
        echo                                                    3 - Experimental                    TBC
        echo.
        echo                                                    4 - Page 4                          TBC
        echo.
        echo                                                    5 - Page 5                          TBC
        echo                                                    6 - Page 6                          TBC
        echo                                                    7 - Page 7                          TBC
        echo                                                    8 - Page 8                          TBC
        echo                                                    9 - Page 9                          TBC

        REM Loop to place the cursor bottom left
        :cursorBottomLeft
        for /L %%i in (1,1,10) do (

                REM If variable "i" is <= the specified number (8), print echo.
                if %%i leq 10 (

                    echo.
                )
        )
        echo                    TBD = To Be Decided ^| TBC = To Be created ^| xx%% ^= Work In Progress ^(i.e xx%% complete^)
        echo =------------------------------------------------------~ ======= ~----------------------------------------------------=

        choice /n /c 123456789
        endlocal
        goto chooseMenuPageChoice%errorlevel%

        REM Choice 1 [Main (Page1)] ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
        :chooseMenuPageChoice1
            CLS
            setlocal enabledelayedexpansion

            REM Search directory
            set "searchDir=%fridayRootLocation%\Friday"

            REM Target file
            set "fileName=Friday.bat"

            REM Recursively find the targeted file and call it.
            for /f "delims=" %%F in ('dir "%searchDir%\%fileName%" /s /b') do (

                call "%%F"

            )
            endlocal

            REM Parachute
            CLS
            echo %fridayPromptMessage% "Couldn't find..."
            echo                     "File:" %fileName%
            echo                     "in..."
            echo                     "Directory:" %searchDir%
            echo.
            echo [Press any key to continue...]
            pause >nul
            endlocal
            goto Main

        REM Choice 2 [Friday Utility] ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
        :chooseMenuPageChoice2
            CLS
            setlocal enabledelayedexpansion

            REM Search directory
            set "searchDir=%fridayRootLocation%\Friday"

            REM Target file
            set "fileName=Friday_Utility.bat"

            REM Recursively find the targeted file and call it.
            for /f "delims=" %%F in ('dir "%searchDir%\%fileName%" /s /b') do (

                call "%%F"

            )
            endlocal

            REM Parachute
            CLS
            echo %fridayPromptMessage% "Couldn't find..."
            echo                     "File:" %fileName%
            echo                     "in..."
            echo                     "Directory:" %searchDir%
            echo.
            echo [Press any key to continue...]
            pause >nul
            endlocal
            goto Main

        REM Choice 3 [Experimental] ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
        :chooseMenuPageChoice3
            CLS
            setlocal enabledelayedexpansion

            REM Search directory
            set "searchDir=%fridayRootLocation%\Friday\Subroutines\Menu Page 3"

            REM Target file
            set "fileName=Friday_Page3_Menu.bat"

            REM Recursively find the targeted file and call it.
            for /f "delims=" %%F in ('dir "%searchDir%\%fileName%" /s /b') do (

                call "%%F"

            )
            endlocal

            REM Parachute
            CLS
            echo %fridayPromptMessage% "Couldn't find..."
            echo                     "File:" %fileName%
            echo                     "in..."
            echo                     "Directory:" %searchDir%
            echo.
            echo [Press any key to continue...]
            pause >nul
            endlocal
            goto Main
        REM Choice 4 [Empty] ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
             echo chooseMenuPageChoice2
             pause
             goto Main

        :chooseMenuPageChoice4
            CLS
            setlocal enabledelayedexpansion

            REM Search directory
            set "searchDir=%fridayRootLocation%\Friday\Subroutines\Menu Page 4"

            REM Target file
            set "fileName=Friday_Page4_Menu.bat"

            REM Recursively find the targeted file and call it.
            for /f "delims=" %%F in ('dir "%searchDir%\%fileName%" /s /b') do (

                call "%%F"

            )
            endlocal

            REM Parachute
            CLS
            echo %fridayPromptMessage% "Couldn't find..."
            echo                     "File:" %fileName%
            echo                     "in..."
            echo                     "Directory:" %searchDir%
            echo.
            echo [Press any key to continue...]
            pause >nul
            endlocal
            goto Main


        REM Choice 5 [Empty] ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
        :chooseMenuPageChoice5
            CLS
            setlocal enabledelayedexpansion

            REM Search directory
            set "searchDir=%fridayRootLocation%\Friday\Subroutines\Menu Page 5"

            REM Target file
            set "fileName=Friday_Page5_Menu.bat"

            REM Recursively find the targeted file and call it.
            for /f "delims=" %%F in ('dir "%searchDir%\%fileName%" /s /b') do (

                call "%%F"

            )
            endlocal

            REM Parachute
            CLS
            echo %fridayPromptMessage% "Couldn't find..."
            echo                     "File:" %fileName%
            echo                     "in..."
            echo                     "Directory:" %searchDir%
            echo.
            echo [Press any key to continue...]
            pause >nul
            endlocal
            goto Main


        REM Choice 6 [Empty] ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
        :chooseMenuPageChoice6
            CLS
            setlocal enabledelayedexpansion

            REM Search directory
            set "searchDir=%fridayRootLocation%\Friday\Subroutines\Menu Page 6"

            REM Target file
            set "fileName=Friday_Page6_Menu.bat"

            REM Recursively find the targeted file and call it.
            for /f "delims=" %%F in ('dir "%searchDir%\%fileName%" /s /b') do (

                call "%%F"

            )
            endlocal

            REM Parachute
            CLS
            echo %fridayPromptMessage% "Couldn't find..."
            echo                     "File:" %fileName%
            echo                     "in..."
            echo                     "Directory:" %searchDir%
            echo.
            echo [Press any key to continue...]
            pause >nul
            endlocal
            goto Main


        REM Choice 7 [Empty] ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
        :chooseMenuPageChoice7
            CLS
            setlocal enabledelayedexpansion

            REM Search directory
            set "searchDir=%fridayRootLocation%\Friday\Subroutines\Menu Page 7"

            REM Target file
            set "fileName=Friday_Page7_Menu.bat"

            REM Recursively find the targeted file and call it.
            for /f "delims=" %%F in ('dir "%searchDir%\%fileName%" /s /b') do (

                call "%%F"

            )
            endlocal

            REM Parachute
            CLS
            echo %fridayPromptMessage% "Couldn't find..."
            echo                     "File:" %fileName%
            echo                     "in..."
            echo                     "Directory:" %searchDir%
            echo.
            echo [Press any key to continue...]
            pause >nul
            endlocal
            goto Main


        REM Choice 8 [Empty] ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
        :chooseMenuPageChoice8
            CLS
            setlocal enabledelayedexpansion

            REM Search directory
            set "searchDir=%fridayRootLocation%\Friday\Subroutines\Menu Page 8"

            REM Target file
            set "fileName=Friday_Page8_Menu.bat"

            REM Recursively find the targeted file and call it.
            for /f "delims=" %%F in ('dir "%searchDir%\%fileName%" /s /b') do (

                call "%%F"

            )
            endlocal

            REM Parachute
            CLS
            echo %fridayPromptMessage% "Couldn't find..."
            echo                     "File:" %fileName%
            echo                     "in..."
            echo                     "Directory:" %searchDir%
            echo.
            echo [Press any key to continue...]
            pause >nul
            endlocal
            goto Main


        REM Choice 9 [Empty] ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
        :chooseMenuPageChoice9
            CLS
            setlocal enabledelayedexpansion

            REM Search directory
            set "searchDir=%fridayRootLocation%\Friday\Subroutines\Menu Page 9"

            REM Target file
            set "fileName=Friday_Page9_Menu.bat"

            REM Recursively find the targeted file and call it.
            for /f "delims=" %%F in ('dir "%searchDir%\%fileName%" /s /b') do (

                call "%%F"

            )
            endlocal

            REM Parachute
            CLS
            echo %fridayPromptMessage% "Couldn't find..."
            echo                     "File:" %fileName%
            echo                     "in..."
            echo                     "Directory:" %searchDir%
            echo.
            echo [Press any key to continue...]
            pause >nul
            endlocal
            goto Main

REM ---------------------------------------------------------------------------------------------------------------------------------
REM Friday Reflect End
:reflectEnd
		CLS
		echo %fridayReflectPromptMessage% End of Reflect
		timeout /t 1
		exit