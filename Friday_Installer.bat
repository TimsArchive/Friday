REM Friday Utility app

REM Skip Notes
goto Start

REM (Visual Studio) Ctrl + M > Ctrl + L = Collapse/Expand all codeblocks

REM Start of the program ------------------------------------------------------------------------------------------------------------------------------------------------------------
:Start
    REM Turn off console log
    @echo off

    REM Clear console
    CLS

    REM Set window name to "Friday"
    title=Friday Installer

    REM If echo is on; Display: "([Hour]:[Minute]) %fridayPromptMessage% " as the prompt
    prompt %time:~0,5% Friday:
    set fridayPromptMessage=%time:~0,5% Friday:

    REM Prompt User
    echo %fridayPromptMessage% "Loading.."

    REM Declare Friday folder location
        set "fridayRootFolder=Friday_Root"
        set "documentsPath=%USERPROFILE%\Documents"
        set "fridayRootLocation=%documentsPath%\%fridayRootFolder%"

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

    :continueToMain
        endlocal
        goto Main

REM Main ---------------------------------------------------------------------------------------------------------------------------------------------------------
:Main
    CLS

    REM Isolate scope until "endlocal"
    setlocal enabledelayedexpansion

    if exist "!userprofile!\Desktop\Friday_Root" (

        goto continueMain

    ) else (

        echo %fridayPromptMessage% "Missing the 'Friday_Root' folder.."
        echo               "Please add it to the desktop and try again"
        echo.
        echo [Press any key to close..]
        pause >nul
        exit /b

    )

    :continueMain

    REM Array of days used by day loop
    set days[0]=Sunday
    set days[1]=Monday
    set days[2]=Tuesday
    set days[3]=Wednesday
    set days[4]=Thursday
    set days[5]=Friday
    set days[6]=Saturday

    REM Array of months used by months loop
    set months[1]=January
    set months[2]=February
    set months[3]=March
    set months[4]=April
    set months[5]=May
    set months[6]=June
    set months[7]=July
    set months[8]=August
    set months[9]=September
    set months[10]=October
    set months[11]=November
    set months[12]=December

	REM Get current system day using Powershell
	for /f "tokens=2 delims==" %%a in ('wmic path win32_localtime get dayofweek /format:list') do set sysDayOfWeek=%%a

	REM Get current system week using Powershell
	for /f %%i in ('powershell -command "(Get-Date).DayOfYear / 7 + 1"') do set sysWeek=%%i

	set sysTime=!time:~0,5!

	echo =------------------------------------------------~ ^{ Friday Installer ^} ~----------------------------------------------=
	echo.

	:continuePrintMenu
	REM Print main menu options.
        echo.
        echo.
        echo                                                            Menu
        echo                                                  +----------------------+
        echo.
        echo                                                    1 - Install Friday
        echo                                                    2 - ^Exit
        echo.

        REM Loop to place the cursor bottom left
        :cursorBottomLeft
            for /L %%i in (1,1,17) do (

                  REM If variable "i" is <= the specified number, print echo.
                  if %%i leq 17 (

                    echo.
                  )
            )

    echo.
	echo =-------------------------------------------------------~ ======= ~----------------------------------------------------=
    REM Returnless input (don't show options, update menu every 3 seconds)
    endlocal
    choice /n /c 12
    goto Utility%errorlevel%

REM Menu Choice1 [Installation] ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
:Utility1
    goto utility1Start
    REM -- TODO --
    REM *
    REM
    REM

    REM   --- Completed ---
    REM *
    REM
    REM

    :utility1Start
        CLS
        setlocal enabledelayedexpansion

        mkdir "%userprofile%\Documents\Friday_Root"
        set "targetDestination=%userprofile%\Documents\Friday_Root"
        set "objectLocation=%userprofile%\Desktop\Friday_Root"

        echo.
        echo Choose using ^[Y,N,A^]
        xcopy !objectLocation! !targetDestination! /q /e /i
        CLS

        REM Create Friday shortcut
        REM Set the target file and the icon file
        set "shortcutPath=C:\Windows\explorer.exe"
        set "fridayExecutable=%fridayRootLocation%\Friday\Friday.bat"
        set "iconLocation=%USERPROFILE%\Desktop\Friday_Root\Friday iCON.ico"

        REM Assign target to variable
        set "target=%fridayExecutable%"

        REM Declare the shortcut name and destination
        set "shortcutName=Friday"
        set "shortcutDestination=%USERPROFILE%\Desktop\%shortcutName%.lnk"

        :continueInstallation
            CLS
            echo %fridayPromptMessage% "Installing Friday.."
            echo.
            timeout /nobreak /t 2 >nul

            REM Loop through the files moved and print their location
            for /r "%targetDestination%" %%i in (*) do (

	            set "iteration=%%i"
	            echo    ^-^> !iteration!

            )
            echo.
            timeout /nobreak /t 2 >nul

        REM Check if the shortcut already exists
        if exist "%shortcutDestination%" (

            echo %fridayPromptMessage% "Shortcut already exists"
            timeout /nobreak /t 2 >nul
            goto utility1End

        ) else (

            echo %fridayPromptMessage% "No shortcut found.."
            timeout /nobreak /t 2 >nul
            goto createFridayShortcut

        )

        REM Create a shortcut using Powershell
        :createFridayShortcut
            echo %fridayPromptMessage% "Creating shortcut.."
            powershell -Command "$WshShell = New-Object -ComObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%shortcutDestination%'); $Shortcut.TargetPath = '%shortcutPath%'; $Shortcut.Arguments = '%fridayExecutable%'; $Shortcut.IconLocation = '%iconLocation%'; $Shortcut.Save()"
            timeout /nobreak /t 2 >nul
            goto utility1End

    :utility1End
        rd /s /q "%userprofile%\Desktop\Friday_Root"
        echo.
        echo %fridayPromptMessage% "Installation successful"
            timeout /nobreak /t 2 >nul
        echo %fridayPromptMessage% "Starting Friday..."
        timeout /nobreak /t 2 >nul

        start cmd.exe /k call "%userprofile%\Documents\Friday_Root\Friday\Friday.bat"
	    del /f "%userprofile%\Desktop\Friday_Installer.bat"

        REM -- Archived optional codeblock --
        REM echo %fridayPromptMessage% "Installation successful"
        REM echo.
        REM echo [Press any key to continue...]
        REM pause >nul

        REM endlocal
        REM exit /b

        REM parachute (incase something goes wrong)
        echo Code leaked ^at Installer (choice 1).
        pause
        goto Main

REM Menu Choice2 [Exit] ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
:Utility2
    goto utility2Start

    REM -- TODO --
    REM *
    REM
    REM

    REM   --- Completed ---
    REM *
    REM
    REM

    :utility2Start
        CLS

        echo %fridayPromptMessage% "Exit program?"
        echo.
        echo 1 - Yes
        echo 2 - No
        echo.

        REM User choice
        choice /n /c 12
        goto EndChoice%errorlevel%

        REM Exit program
        :EndChoice1
            CLS
            echo Exiting...
            timeout /nobreak /t>nul 2
            exit /b

        REM Return to Main
        :EndChoice2
            goto Main

    :utility2End
        REM Parachute
        echo Parachute triggered.
        pause
        goto Main

REM Menu Choice3 [Placeholder] ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:Utility3
    goto utility3Start

    REM -- TODO --
    REM *
    REM
    REM

    REM   --- Completed ---
    REM *
    REM
    REM

    :utility3Start
        CLS
        goto Main
        setlocal

        echo utility 3
        pause
        endlocal
        goto utility3End

    :utility3End
        goto Main

        REM parachute
        echo File found and called but it got interrupted.
        pause
        goto Main

REM Menu Choice4 [Placeholder] ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:Utility4
    goto utility4Start

    REM -- TODO --
    REM *
    REM
    REM

    REM   --- Completed ---
    REM *
    REM
    REM

    :utility4Start
        CLS
        goto Main
        setlocal

        echo utility 4
        pause
        endlocal
        goto utility4End

    :utility4End
        goto Main

        REM parachute
        echo File found and called but it got interrupted.
        pause
        goto Main

REM Menu Choice5 [Placeholder] ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:Utility5
    goto utility5Start

    REM -- TODO --
    REM *
    REM
    REM

    REM   --- Completed ---
    REM *
    REM
    REM

    :utility5Start
        CLS
        setlocal

        echo utility 5
        pause
        endlocal
        goto utility5End

    :utility5End
        goto Main

        REM parachute
        echo File found and called but it got interrupted.
        pause
        goto Main

REM Menu Choice6 [Placeholder] ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:Utility6
    goto utility6Start

    REM -- TODO --
    REM *
    REM
    REM

    REM   --- Completed ---
    REM *
    REM
    REM

    :utility6Start
        CLS
        setlocal

        echo utility 6
        pause
        endlocal
        goto utility6End

    :utility6End
        goto Main

        REM parachute
        echo File found and called but it got interrupted.
        pause
        goto Main

REM Menu Choice7 [Placeholder] ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:Utility7
    goto utility7Start

    REM -- TODO --
    REM *
    REM
    REM

    REM   --- Completed ---
    REM *
    REM
    REM

    :utility7Start
        CLS
        goto Main
        setlocal

        echo utility 7
        pause
        endlocal
        goto utility7End

    :utility7End
        goto Main

        REM parachute
        echo File found and called but it got interrupted.
        pause
        goto Main

REM Menu Choice8 [Placeholder] ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:Utility8
    goto Main

REM Menu Choice9 [Placeholder] ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:Utility9
    goto utility9Start

    REM -- TODO --
    REM *
    REM
    REM

    REM   --- Completed ---
    REM *
    REM
    REM

    :utility9Start
        CLS
        goto Main
        setlocal

        echo utility 9
        pause
        endlocal
        goto utility9End

    :utility9End
        goto Main

        REM parachute
        echo File found and called but it got interrupted.
        pause
        goto Main

REM Friday parachute.
:UtilityParachute
    endlocal
    echo.
    echo ERROR: "Friday Installer" parachute triggered.
    echo The very end of "Friday Installer" reached.
    echo.
    echo %fridayPromptMessage% "Somewhere the code is 'leaking' and the interpreter is not being 'catched' correctly by new lines of code."
    timoeout /t 2 >nul
    echo %fridayPromptMessage% "Suggest using [pause] & [echo <Message>] commands to debug."
    echo.
    echo "(This parachute is here to catch 'leaking' code and not let the interpreter reach the end of the file, which will close the program if reached.)"
    pause

    CLS
    echo Returning to Main..
    timeout /nobreak /t 2
    goto Main