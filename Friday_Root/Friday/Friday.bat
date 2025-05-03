REM Friday Desktop Companion

REM Jump to Start Section
goto Start

REM (Visual Studio) Ctrl + M -> Ctrl + L = Collapse/Expand all codeblocks

REM Start of the program ------------------------------------------------------------------------------------------------------------------------------------------------------------
:Start
    REM Turn off console log
    @echo off

    REM Clear console
    CLS

    REM Set window name to "Friday"
    title=Friday

    REM If echo is on; Display: "([Hour]:[Minute]) %fridayPromptMessage% " as the prompt
    prompt %time:~0,5% Friday:
    set fridayPromptMessage=%time:~0,5% Friday:

    REM Variable for current version of Friday
    set fridayVersion=v0.500

    REM Prompt User
    echo %fridayPromptMessage% "Loading.."


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

    REM Array of Directories to create on startup
    set documentsChildFolder[1]=%fridayNotesLocation%
    set documentsChildFolder[2]=%fridayAlarmsFolderLocation%
    set documentsChildFolder[3]=%fridayGamesFolderLocation%

    setlocal enabledelayedexpansion

    REM Check if the Friday Documents location exists
        if exist "!fridayDocumentsLocation!" (

            for /L %%i in (1, 1, 3) do (

                set "folderPath=!documentsChildFolder[%%i]!"

                REM Check if the child folder exists
                if not exist "!folderPath!" (

                    echo !fridayPromptMessage! "Folder !folderPath! does not exist. Creating..."
                    mkdir "!folderPath!"

                ) else (

                    echo !fridayPromptMessage! "Folder !folderPath! already exists, continuing.."
                    echo folder exists
                )
            )

        ) else (

            REM Create the Friday Documents folder
            mkdir "!fridayDocumentsLocation!"
            echo !fridayPromptMessage! "Documents folder created, continuing..."

            REM Create child folders
            for /L %%i in (1, 1, 3) do (

                set "folderPath=!documentsChildFolder[%%i]!"

                if not exist "!folderPath!" (

                    echo !fridayPromptMessage! "Folder !folderPath! does not exist. Creating..."
                    mkdir "!folderPath!"

                ) else (

                    echo !fridayPromptMessage! "Folder !folderPath! already exists, continuing.."
                    echo folder didnt exist
                )
            )
        )

    :continueMain
        endlocal
        goto Main

REM Main ---------------------------------------------------------------------------------------------------------------------------------------------------------
:Main
	CLS
	setlocal enabledelayedexpansion

	REM Array of days
	set daysArr[0]=Sunday
	set daysArr[1]=Monday
	set daysArr[2]=Tuesday
	set daysArr[3]=Wednesday
	set daysArr[4]=Thursday
	set daysArr[5]=Friday
	set daysArr[6]=Saturday

	REM Array of months
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

	echo =----------------------------------------------------~ ^{ Friday ^} ~----------------------------------------------------=
	echo {Page1\Main\[Choose]

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

	:continuePrintMenu
	REM Print main menu options.
		echo.
		echo.
		echo                          Current Page                   Main Menu                     Status
		echo                         +------------+          +-----------------------+          +----------+
		echo                               1/9
		echo                                                     1 - Communication                  DONE
		echo                                                     2 - System Info                    DONE
		echo                                                     3 - Common Folders                 DONE
		echo.
		echo                                                     4 - ^Exit                           DONE
		echo.
		echo                                                     5 - Options                        10 %%
		echo                                                     6 - Password                       TBC
		echo                                                     7 - Presets                        TBC
		echo                                                     8 - Update Menu                    DONE
		echo                                                     9 - Menu Pages                     DONE

	REM Loop to place the cursor bottom left
	:cursorBottomLeft
		for /L %%i in (1,1,7) do (
			REM If variable "i" is <= the specified number, print echo.
			if %%i leq 6 (
				echo.
			)
		)

		echo                    TBD = To Be Decided ^| TBC = To Be created ^| xx%% ^= Work In Progress ^(i.e xx%% complete^)
		echo =-----------------------------------------------------~ %fridayVersion% ~------------------------------------------------------=
        endlocal

        REM Returnless input (don't show options, update menu every 3 seconds)
        choice /n /d 8 /t 15 /c 123456789
        goto MenuChoice%errorlevel%

REM Menu Choice1 [Communication] ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
:MenuChoice1
    goto communicationStart

    REM -- TODO --
    REM * Options
    REM     - Clean file (Y/N). Clean by overwriting existing.
    REM     - Remove specific file. (See option 7.)
    REM * Send msg to Discord server. (Webhook)
    REM * Give examples of formatting.
    REM
    REM

    REM   --- Completed ---
    REM * Options
    REM     - Write to file.
    REM     - List all available files in "Friday Messages" folder.
    REM
    REM

    :communicationStart
        CLS
        setlocal enabledelayedexpansion

        REM Search directory
        set "searchDir=%fridaySubroutinesLocation%\Menu Page 1 (Start)\Friday MenuChoice 1"

        REM Target file
        set "fileName=Friday_MenuChoice1_Communication.bat"

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
        goto communicationEnd

    :communicationEnd
        goto Main

        REM parachute
        echo File found and called but it got interrupted.
        pause
        goto Main

REM Menu Choice2 [System Info] ----------------------------------------------------------------------------------------------------------------------------------------------------------------
:MenuChoice2
    goto systemInfoStart

    REM -- TODO --
    REM * filler
    REM     - filler child
    REM *
    REM *
    REM *
    REM *
    REM *

    REM   --- Completed ---
    REM *
    REM
    REM
    REM
    REM
    :systemInfoStart
        @echo off
        CLS
        setlocal enabledelayedexpansion

        REM Search directory
        set "searchDir=%fridayRootLocation%\Friday"

        REM Target file
        set "fileName=Friday_MenuChoice2_SystemInfo.bat"

        REM Recursively find the targeted file and call it.
        for /f "delims=" %%F in ('dir "%searchDir%\%fileName%" /s /b') do (

                call "%%F"

        )

        endlocal

        REM Parachute
        echo File found and called but it got interrupted.
        pause
        goto Main

REM Menu Choice3 [Common Folders] -----------------------------------------------------------------------------------------------------------------------------------------------------
:MenuChoice3
    goto commonFoldersStart

    REM   --- TODO ---
    REM  * Option to rename files (help rename)
    REM  * Option to rename folders
    REM  * Option to create files, Name=UserInput
    REM  * Option to create folders, Name=UserInput
    REM  * Synergy with "remind me" @ Message?
    REM  * Use for loop and build it from user input

    REM   --- Completed ---
    REM
    REM
    REM
    REM
    REM
    REM

    REM  --- UI Mockup ---
    REM "What would you like to loop?"
    REM [User input]

    REM "How many loops?"
    REM [User input]

    REM [Optional] "Where would this loop take place?"
    REM If no user input, use %temp% folder. Create file > Execute loop > Close File > Del temp file.

    :commonFoldersStart
        @echo off
        CLS
        setlocal enabledelayedexpansion

        REM Search directory
        set "searchDir=%fridayRootLocation%\Friday"

        REM Target file
        set "fileName=Friday_MenuChoice3_CommonFolders.bat"

        REM Recursively find the targeted file and call it.
        for /f "delims=" %%F in ('dir "%searchDir%\%fileName%" /s /b') do (

            call "%%F"

        )

        endlocal

        REM Parachute
        CLS
        echo %fridayPromptMessage% "Couldn^'t find %fileName% in %searchDir%"
        pause
        goto Main

REM Menu Choice4 [Exit Friday] ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
:MenuChoice4
    goto exitProgramStart

    REM   --- TODO ---
    REM  *
    REM
    REM
    REM

    REM   --- Completed ---
    REM
    REM


    :exitProgramStart
        CLS
        setlocal enabledelayedexpansion
        goto fridayExit

        REM Prompt confirmation
        :fridayExit
            CLS
            echo ^Exit Friday?
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
                timeout /t >nul 2

                endlocal
                exit

            REM Return to Main
            :EndChoice2
                endlocal
                goto Main

REM Menu Choice5 [Options] (WIP) ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:MenuChoice5
    goto optionsStart

    REM   --- TODO ---
    REM  * System info
    REM  *    - Display all options.
    REM  *    - Display specific part option.
    REM  *    - Crop display to show relevant info.
    REM  *
    REM  *
    REM  *
    REM  * Change Title of Friday. (%fridayPromptMessage% [User choice])
    REM  * Activate or deactivate prompt. (Echo on/off)
    REM  *
    REM  * Nuke (Prompt multiple confirmations for user.)
    REM  *    - Remove all notes.
    REM  *    - Remove all documents produced by Friday (Trample delete. Target maps named "Friday [...]")
    REM  *    - Remove Friday.bat.
    REM  *    - Remove all savefiles.
    REM  *
    REM  *
    REM  *
    REM  *
    REM  *
    REM  *
    REM  *
    REM  *

    REM   --- Completed ---
    REM  * Theme
    REM  *    - Carries over from main
    REM
    REM
    REM
    REM
    REM
    REM

    :optionsStart
        CLS
        REM Set local scope
        setlocal enabledelayedexpansion

            REM Print menu
            echo {Page1\Main\Options\[Choose]
            echo                                                         Options
            echo                                                  +------------------+
            echo                                                     1 - Theme
            echo                                                     2 - Placeholder
            echo                                                     3 - Placeholder
            echo.
            echo                                                     4 - Back
            echo.
            echo                                                     5 - Placeholder
            echo                                                     6 - Placeholder
            echo                                                     7 - Placeholder
            echo                                                     8 - Placeholder
            echo                                                     9 - Placeholder


        choice /n /c 123456789
        goto option!errorlevel!

        REM Option 1 - Theme
        :option1
            :chooseAThemeStart
                CLS
                setlocal enabledelayedexpansion

                echo {Page1\Main\Options\Theme\[Choose]
                echo                                                         Themes
                echo                                                  +------------------+
                echo                                                     1 - Default ^(Black ^& White^)
                echo                                                     2 - Forest ^(Light^)
                echo                                                     3 - Ocean ^(Dark^)
                echo.
                echo                                                     4 - Back
                echo.
                echo                                                     5 - Blood ^(Light^)
                echo                                                     6 - Custom
                echo.
                echo.
                endlocal

                choice /n /c 123456
                goto Theme!errorlevel!

            REM Theme - Default
            :Theme1
                CLS
                echo {Main\Theme\Default
                echo.

                color 07
                echo %fridayPromptMessage% "Theme restored!"
                echo %fridayPromptMessage% "Returning to Main.."
                timeout /t 3 >nul
                goto Main

            REM Theme - Forest
            :Theme2
                CLS
                echo {Main\Theme\Forest
                echo.

                color 72
                echo %fridayPromptMessage% "'I see skies of green, red roses too...'"
                timeout /t 1 >nul
                echo [reply terminated due to copyright infringement]
                timeout /t 2 >nul
                echo %fridayPromptMessage% "Returning to Main.."
                timeout /t 3 >nul
                goto Main

            REM Theme - Ocean
            :Theme3
                CLS
                echo {Main\Theme\Ocean
                echo.

                color 09
                echo %fridayPromptMessage% "Did you know that bluewhale babies can gain up to 90kg each day?"
                echo %fridayPromptMessage% "Returning to Main.."
                timeout /t 3 >nul
                goto Main

            REM Theme - Back - Main
            :Theme4
                goto Main

            REM Theme - Blood
            :Theme5
                CLS
                echo {Main\Theme\Blood
                echo.

                color F4
                echo %fridayPromptMessage% "Did you know that cows have roughly 800 different types of blood?!"
                echo %fridayPromptMessage% "Returning to Main.."
                timeout /t 3 >nul
                goto Main

            REM Theme - Custom
            :Theme6
                CLS
                echo {Main\Theme\[Background]
                echo.
                setlocal enabledelayedexpansion

                REM List of color options for the color command.
                echo Options:
                echo    0 = Black
                echo    1 = Blue
                echo    2 = Green
                echo    3 = Aqua
                echo    4 = Red
                echo    5 = Purple
                echo    6 = Yellow
                echo    7 = White
                echo    8 = Gray
                echo.


                REM Prompt user for input for background color
                :colorChoiceFirst
                    echo %fridayPromptMessage% "Choose a background color (0-8)"
                    echo %fridayPromptMessage% "NOTE: The same color cannot be chosen twice in a row.."
                    echo.

                    echo [Background]
                    choice /n /c 012345678
                    set "firstColor=%errorlevel%"
                    goto colorChoiceSecond

                :colorChoiceSecond
                    CLS
                    echo {Main\Theme\Background\[Text]
                    echo.

                    REM List of color options for the color command.
                    echo Options:
                    echo    0 = Black
                    echo    1 = Blue
                    echo    2 = Green
                    echo    3 = Aqua
                    echo    4 = Red
                    echo    5 = Purple
                    echo    6 = Yellow
                    echo    7 = White
                    echo    8 = Gray
                    echo.

                    echo %fridayPromptMessage% "Choose a text color (0-8)"
                    echo.

                    echo [Text]
                    choice /n /c 012345678
                    set "secondColor=%errorlevel%"

                    REM Adjust firstColor and secondColor to the correct format for color command
                    set /a firstColor-=1
                    set /a secondColor-=1

                    REM Combine the user inputs into the color command
                    set "combineCustomColor=color !firstColor!!secondColor!"

                    REM Execute the command
                    call !combineCustomColor!


                CLS
                echo %fridayPromptMessage% "Nice choice"
                echo %fridayPromptMessage% "Returning to menu.."
                timeout /t 3 >nul
                endlocal
                goto optionsStart

        REM Option 2 Placeholder
        :option2
            CLS
            setlocal enabledelayedexpansion

            echo Option Placeholder 2
            pause

            endlocal
            goto optionsStart

        REM Option 3 Placeholder
        :option3
            CLS
            setlocal enabledelayedexpansion

            echo Option Placeholder 3
            pause

            endlocal
            goto optionsStart

        REM Option 4 Back - Back to Main
        :option4
            CLS
            goto Main

        REM Option 5 Placeholder
        :option5
            CLS
            setlocal enabledelayedexpansion

            echo Option Placeholder 5
            pause

            endlocal
            goto optionsStart
        REM Option 6 Placeholder
        :option6
            CLS
            setlocal enabledelayedexpansion

            echo Option Placeholder 6
            pause

            endlocal
            goto optionsStart
        REM Option 7 Placeholder
        :option7
            CLS
            setlocal enabledelayedexpansion

            echo Option Placeholder 7
            pause

            endlocal
            goto optionsStart
        REM Option 8 Placeholder
        :option8
            CLS
            setlocal enabledelayedexpansion

            echo Option Placeholder 8
            pause

            endlocal
            goto optionsStart
        REM Option 9 Placeholder
        :option9
            CLS
            setlocal enabledelayedexpansion

            echo Option Placeholder 9
            pause

            endlocal
            goto optionsStart

REM Menu Choice6 [Passwords] (WIP) ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:MenuChoice6
    goto passwordsStart

    REM   --- TODO ---
    REM  * Random password.
    REM  * Random part of password.
    REM  * Save password to .txt file.
    REM  * Find specific password from file.
    REM  * Display passwords from file.
    REM  *

    REM   --- Completed ---
    REM
    REM
    REM
    REM
    REM
    REM

    :passwordsStart
        CLS
        setlocal enabledelayedexpansion

        echo Choice6 Password Generator
        pause
        endlocal
        goto Main

REM Menu Choice7 [Saves] ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:MenuChoice7
    goto MenuChoice7Start

    REM   --- TODO ---
    REM  * Save specifics to file. User chooses name (start w/ saving theme).
    REM  * Read specifics from file.
    REM  * Show list of savefiles (1-9).
    REM  * Options page: Delete savefile. Load savefile. Create backup. (Y/N).
    REM  * Selected savefile goes to options page.
    REM  *

    REM   --- Completed ---
    REM
    REM
    REM
    REM
    REM
    REM

    :MenuChoice7Start
        CLS
        setlocal enabledelayedexpansion

        echo Choice7 Manage Friday Saves.
        pause
        goto Main

REM Menu Choice8 [Update menu] (used to update Main menu clock) ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:MenuChoice8
    goto Main

REM Menu Choice9 [Menu Pages] ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:MenuChoice9
    goto menuPagesStart

    REM   --- TODO ---
    REM  *
    REM  *
    REM  *
    REM  *
    REM  *
    REM  *

    REM   --- Completed ---
    REM
    REM
    REM
    REM
    REM
    REM

    :menuPagesStart
        @echo off
        CLS
        setlocal enabledelayedexpansion

        REM Search directory
        set "searchDir=%fridayRootLocation%\Friday\Subroutines"

        REM Target file
        set "fileName=Friday_Reflect.bat"

        REM Send targeted event
        set "reflectTrigger=ChooseMenuPage"

        REM Recursively find the targeted file and call it.
        for /f "delims=" %%F in ('dir "%searchDir%\%fileName%" /s /b') do (

            call "%%F" %reflectTrigger%

        )
        goto menuPagesEnd

    :menuPagesEnd

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

    REM parachute
        endlocal
        echo.
        echo %fridayPromptMessage% ERROR: "Menu Choice 9 parachute triggered"
        echo.
        echo %fridayPromptMessage% "Somewhere the code is 'leaking' and the interpreter is not being 'catched' correctly by new lines of code."
        echo %fridayPromptMessage% "Suggest using [pause] & [echo <Message>] commands to debug."
        echo.
        echo "(This parachute is here to catch 'leaking' code and not let the interpreter reach the end of the file, which will close the program if reached.)"
        pause

        CLS
        echo Returning to Main..
        timeout /t 2
        goto Main

REM Friday parachute.
:FridayParachute
    endlocal
    echo.
    echo ERROR: "Friday" parachute triggered.
    echo The very end of "Friday" reached.
    echo.
    echo %fridayPromptMessage% "Somewhere the code is 'leaking' and the interpreter is not being 'catched' correctly by new lines of code."
    echo %fridayPromptMessage% "Suggest using [pause] & [echo <Message>] commands to debug."
    echo.
    echo "(This parachute is here to catch 'leaking' code and not let the interpreter reach the end of the file, which will close the program if reached.)"
    pause

    CLS
    echo Returning to Main..
    timeout /t 2
    goto Main