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
    title=Friday Utility

    REM If echo is on; Display: "([Hour]:[Minute]) %fridayPromptMessage% " as the prompt
    prompt %time:~0,5% Friday:
    set fridayPromptMessage=%time:~0,5% Friday:

    REM Prompt User
    echo %fridayPromptMessage% "Loading.."

    REM Declare Friday folder location
        set "fridayRootFolder=Friday_Root"
        set "documentsPath=%USERPROFILE%\Documents"
        set "fridayRootLocation=%documentsPath%\%fridayRootFolder%"
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

    :continueMain
        endlocal
        goto Main

REM Main ---------------------------------------------------------------------------------------------------------------------------------------------------------
:Main

    CLS

    REM Isolate scope until "endlocal"
    setlocal enabledelayedexpansion

    REM Array of days used by day loop
    set daysArr[0]=Sunday
    set daysArr[1]=Monday
    set daysArr[2]=Tuesday
    set daysArr[3]=Wednesday
    set daysArr[4]=Thursday
    set daysArr[5]=Friday
    set daysArr[6]=Saturday

    REM Array of months used by months loop
    set monthsArr[1]=January
    set monthsArr[2]=February
    set monthsArr[3]=March
    set monthsArr[4]=April
    set monthsArr[5]=May
    set monthsArr[6]=June
    set monthsArr[7]=July
    set monthsArr[8]=August
    set monthsArr[9]=September
    set monthsArr[10]=October
    set monthsArr[11]=November
    set monthsArr[12]=December

	REM Get current system day using Powershell
	for /f "tokens=2 delims==" %%a in ('wmic path win32_localtime get dayofweek /format:list') do set sysDayOfWeek=%%a

	REM Get current system week using Powershell
	for /f %%i in ('powershell -command "(Get-Date).DayOfYear / 7 + 1"') do set sysWeek=%%i

	set sysTime=!time:~0,5!

    echo =------------------------------------------------~ ^{ Friday Utility ^} ~------------------------------------------------=
    echo {Utility\Main[Choose]

	REM Prints YYYY-MM-DD | Year clamp | YYYY-MM-DD
	for /f %%i in ('powershell -NoProfile -Command ^"Get-Date -Format yyyy-MM-dd^"') do set "currentDate=%%i"

	REM Crop year, month, and day from currentDate
	set "sysYear=!currentDate:~0,4!"
	set "sysMonth=!currentDate:~5,2!"
	set "sysDay=!currentDate:~8,2!"

	REM Convert sysMonth to int for month name
	set /a monthIndex=1!sysMonth! - 100

	REM Retrieve the month name from the months array
	for /L %%i in (1,1,12) do (
		if %%i==!monthIndex! (
			call set "monthName=%%monthsArr[%%i]%%"
		)
	)

	REM Print date, time, week and day of week
	echo                                                      !sysTime! - !daysArr[%sysDayOfWeek%]!
	echo                                                        !sysYear! !monthName! !sysDay!
	echo                                                           W.!sysWeek:~0,2!

    REM Print Main menu.
    echo.
    echo.
    echo                                                        Utility Menu                   Status
    echo                                                  +----------------------+          +----------+
    echo.
    echo                                                    1 - View Root Folder                DONE
    echo                                                    2 - Shortcuts                       DONE
    echo                                                    3 - Uninstall Friday                DONE
    echo.
    echo                                                    4 - ^Exit                            DONE
    echo.
    echo                                                    5 - Repair                          TBC
    echo.
    echo.
    echo.
    echo.

    REM Loop to place the cursor bottom left
    :cursorBottomLeft
        for /L %%i in (1,1,6) do (
              REM If variable "i" is <= the specified number, print echo.
              if %%i leq 6 (
                echo.
              )
        )

    echo                    TBD = To Be Decided ^| TBC = To Be created ^| xx%% ^= Work In Progress ^(i.e xx%% complete^)
    echo =------------------------------------------------------~ ======= ~-----------------------------------------------------=

    REM Returnless input (don't show options, update menu every 3 seconds)
    choice /n /d 8 /t 15 /c 123456789
    endlocal
    goto Utility%errorlevel%

REM Menu Choice1 [View Root] ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
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
        start "" explorer.exe "%fridayRootLocation%"
        echo %fridayPromptMessage% "Displaying Root"
        timeout /t 2 >nul
        goto utility1End

    :utility1End
        endlocal
        goto Main

        REM parachute
        echo File found and called but it got interrupted.
        pause
        goto Main

REM Menu Choice3 [Create Shortcut] -----------------------------------------------------------------------------------------------------------------------------------------------------
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
        set boolBoth=0

        echo %fridayPromptMessage% "Which app should a shortcut be created for?"
        echo.
        echo.
        echo.
        echo.
        echo Choose
        echo 1 - Friday (Recommended)
        echo 2 - Friday Utility
        echo 3 - Both
        echo.
        echo 4 - Back
        echo.

        choice /n /c 1234
        goto createShortcut%errorlevel%

        REM Friday shortcut
        :createShortcut1
            CLS
            setlocal enabledelayedexpansion

            REM Friday Shortcut Variables
                REM Target file and the icon file
                set "shortcutPath=C:\Windows\explorer.exe"
                set "fridayExecutable=%fridayRootLocation%\Friday\Friday.bat"
                set "iconLocation=%fridayRootLocation%\Friday iCON.ico"

                REM Declare the shortcut name and destination
                set "shortcutName=Friday"
                set "fridayShortcutDestination=%USERPROFILE%\Desktop\%shortcutName%.lnk"

            REM Check if the shortcut already exists
            if exist "%fridayShortcutDestination%" (

                echo %fridayPromptMessage% "Friday shortcut already exists on the Desktop.."
                timeout /t 2 >nul
                goto utility2End

            ) else (

                CLS
                echo %fridayPromptMessage% "No Friday shortcut found.."
                echo.
                timeout /t 2 >nul
                goto fridayShortcut

            )

            REM Create a shortcut using Powershell
            :fridayShortcut
                CLS
                echo %fridayPromptMessage% "Creating Friday shortcut.."
                powershell -Command "$WshShell = New-Object -ComObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%fridayShortcutDestination%'); $Shortcut.TargetPath = '%shortcutPath%'; $Shortcut.Arguments = '%fridayExecutable%'; $Shortcut.IconLocation = '%iconLocation%'; $Shortcut.Save()"
                timeout /t 2 >nul

                REM If user has selected both shortcuts (option 3)
                if %boolBoth%==1 (

                    goto createShortcut2

                ) else (

                    goto utility2End

                )


        REM Friday Utility shortcut
        :createShortcut2
            CLS
            setlocal enabledelayedexpansion

            REM Friday Shortcut Variables
                REM Target file and the icon file
                set "shortcutPath=C:\Windows\explorer.exe"
                set "fridayUtilityExecutable=%fridaySubroutinesLocation%\Friday_Utility.bat"
                set "iconLocation=%fridayRootLocation%\Friday Utility iCON.ico"

                REM Declare the shortcut name and destination
                set "shortcutName=Friday Utility"
                set "utilityShortcutDestination=%USERPROFILE%\Desktop\%shortcutName%.lnk"

            REM Check if the shortcut already exists
            if exist "%utilityShortcutDestination%" (

                echo %fridayPromptMessage% "Utility shortcut already exists on the Desktop.."
                timeout /t 2 >nul
                goto utility2End

            ) else (

                CLS
                echo %fridayPromptMessage% "No Utility shortcut found.."
                echo.
                timeout /t 1 >nul
                goto utilityShortcut

            )

            REM Create a shortcut using Powershell
            :utilityShortcut
                CLS
                echo %fridayPromptMessage% "Creating Utility shortcut.."
                powershell -Command "$WshShell = New-Object -ComObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%utilityShortcutDestination%'); $Shortcut.TargetPath = '%shortcutPath%'; $Shortcut.Arguments = '%fridayUtilityExecutable%'; $Shortcut.IconLocation = '%iconLocation%'; $Shortcut.Save()"
                timeout /t 2 >nul
                echo %fridayPromptMessage% "Utility shortcut created!"

                REM If user has selected both shortcuts (option 3)
                if %boolBoth%==1 (

                    goto continueMultiShortcuts

                ) else (

                    goto utility2End

                )

        REM Create 2 shortcuts
        :createShortcut3
            CLS
            set boolBoth=1
            goto createShortcut1

            :continueMultiShortcuts
                CLS
                set boolBoth=0

                echo %fridayPromptMessage% "Friday & Utility shortcuts created!"
                timeout /t 2 >nul
                goto utility2End



        REM Back
        :createShortcut4
            CLS
            goto utility2End

    :utility2End
        endlocal
        goto Main

        REM parachute
        echo "Create shortcut" parachute triggered.
        pause
        goto Main

REM Menu Choice4 [Exit] ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
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

        echo %fridayPromptMessage% "Exit Utility and return to Friday?"
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
            timeout /t>nul 2

        setlocal enabledelayedexpansion

        REM Search directory
        set "searchDir=%fridayRootLocation%\Friday"

        REM Target file
        set "fileName=Friday.bat"

        REM Recursively find the targeted file and call it.
        for /f "delims=" %%f in ('dir "%searchDir%\%fileName%" /s /b 2^>nul') do (
            set "fileFound=true"
            call "%%f"
        )

        REM Check if file was never found
        if "!fileFound!"=="false" (
            echo %fridayPromptMessage% "Unable to find file: %fileName%"
            echo %fridayPromptMessage% "...in directory: %searchDir%"
            echo.
            timeout /t 2 >nul
            echo Returning to Main...
            timeout /t 2 >nul
            goto Main

        )
        endlocal

        REM Return to Main
        :EndChoice2
            goto Main

    :utility4End
        REM Parachute
        echo Parachute triggered.
        pause
        goto Main

REM Menu Choice5 [Repair] ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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

REM Menu Choice6 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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

REM Menu Choice7 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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

REM Menu Choice8 [Update Menu] ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:Utility8
    goto Main

REM Menu Choice9 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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
    echo ERROR: "Friday Utility" parachute triggered.
    echo The very end of "Friday Utility" reached.
    echo.
    echo %fridayPromptMessage% "Somewhere the code is 'leaking' and the interpreter is not being 'catched' correctly by new lines of code."
    timoeout /t 2 >nul
    echo %fridayPromptMessage% "Suggest using [pause] & [echo <Message>] commands to debug."
    echo.
    echo "(This parachute is here to catch 'leaking' code and not let the interpreter reach the end of the file, which will close the program if reached.)"
    pause

    CLS
    echo Returning to Main..
    timeout /t 2
    goto Main

REM Menu Choice3 [Uninstall] ----------------------------------------------------------------------------------------------------------------------------------------------------------------
REM Moved to bottom to avoid possible conflicts after removing "Friday_Utility.bat"
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
        setlocal enabledelayedexpansion

        echo %fridayPromptMessage% "This action will remove everything inside the 'Friday_Root' folder"
        echo               "This includes all notes and or alarms created"
        echo.
        echo                       "This action cannot be undone"
        echo                       "Are you sure you want to continue?"
        echo.
        echo.
        echo 1 - Yes, delete the Friday_Root and everything inside
        echo 2 - No, abort deletion

        choice /n /c 12
        goto deletionConfirmation!errorlevel!

        REM Don't delete Friday_Root
        :deletionConfirmation2
            CLS
            echo %fridayPromptMessage% "Deletion aborted"
            timeout /t 2 >nul
            endlocal
            goto utility3End

        :utility3End
            endlocal
            goto Main

            REM parachute
            echo File found and called but it got interrupted.
            pause
            goto Main

        REM Delete Friday_Root
        :deletionConfirmation1

            CLS
            echo.
            echo                                               The program will be uninstalled
            echo                                            Thank you ^for trying out my program ^:^)
            echo.

            set closingColorArray[0]=c0
            set closingColorArray[1]=f0
            set closingColorArray[2]=f0
            set closingColorArray[3]=70
            set closingColorArray[4]=70
            set closingColorArray[5]=87
            set closingColorArray[6]=87
            set closingColorArray[7]=87
            set closingColorArray[8]=07
            set closingColorArray[9]=07
            set closingColorArray[10]=07

            for /l %%i in (10,-1,0) do (

	            echo                                                             %%i
	            color !closingColorArray[%%i]!
	            timeout /nobreak /t 1 >nul

            )
            CLS
            for /l %%i in (1,1,12) do (

	            echo.

            )
            echo "                                                    So long (^-^)7                                                    "
            echo                                                          - Tim
            timeout /nobreak /t 1 >nul
            echo.
            echo.

            set foundFirstShortcut=0
            set foundSecondShortcut=0

            if exist "!userprofile!\Desktop\Friday.lnk" (

                del "!userprofile!\Desktop\Friday.lnk"
                set foundFirstShortcut=1

            )

            if exist "!userprofile!\Desktop\Friday Utility.lnk" (

                del "!userprofile!\Desktop\Friday Utility.lnk"
                set foundSecondShortcut=1

            )

            set /a sumShortcuts=!foundFirstShortcut! + !foundSecondShortcut!

            if !sumShortcuts!==1 (

                echo %fridayPromptMessage% "1 shortcut found, removing..."
                timeout /nobreak /t 2 >nul

            ) else (

                if !sumShortcuts!==2 (

                    echo %fridayPromptMessage% "2 shortcuts found, removing..."

                ) else (

                    echo %fridayPromptMessage% "No shortcuts found, continuing..."
                    goto uninstallEnd
                )
            )

            :uninstallEnd
                echo %fridayPromptMessage% "Displaying Friday_Root Location..."
                timeout /nobreak /t 2 >nul
                start "" explorer.exe "!userprofile!\Documents"

                timeout /nobreak /t 2 >nul
                echo %fridayPromptMessage% "Thank you user" o7
                timeout /nobreak /t 3 >nul

                echo.
                echo %fridayPromptMessage% "Removing Root Folder..."
                timeout /nobreak /t 2 >nul

                if exist "!userprofile!\Documents\Friday_Root" (

                    rd /s /q "!userprofile!\Documents\Friday_Root"
                    Exit

                ) else ( REM If user removes the Root folder right before 'Friday'
                    echo %fridayPromptMessage% "Unable to find root directory..."
                    echo %fridayPromptMessage% "I guess someone beat me to it" ;^)
                    Exit
                )
                REM Just in case lol
                Exit