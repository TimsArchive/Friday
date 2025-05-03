:Start
    REM Turn off console log
    @echo off

    REM Clear console
    CLS

    REM Set window name to "Friday"
    title=Friday ^- Communication

    REM If echo is on; Display: "([Hour]:[Minute]) %fridayPromptMessage% " as the prompt
    prompt %time:~0,5% Friday:
    set fridayPromptMessage=%time:~0,5% Friday:

    REM Prompt User
    echo %fridayPromptMessage% "Loading.."

    REM Declare Global Variables
        REM Declare Friday_Root folder location
            set "fridayRootFolder=Friday_Root"
            set "documentsPath=%USERPROFILE%\Documents"
            set "fridayRootLocation=%documentsPath%\%fridayRootFolder%"
            set "fridayMain=%fridayRootLocation%\Friday\Friday.bat"

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

            REM Friday folder Location
                set "fridayFolder=Friday"
                set "fridayFolderLocation=%fridayRootLocation%\%fridayFolder%"

    REM Array of Directories to create in loop
        set documentsChildFolder[1]=%fridayNotesLocation%
        set documentsChildFolder[2]=%fridayAlarmsFolderLocation%
        set documentsChildFolder[3]=%fridayGamesFolderLocation%

    REM Begining of Friday Documents folder creation
        setlocal enabledelayedexpansion

        REM Check if Friday Documents folder exists
        if exist "!fridayDocumentsLocation!" (

            for /L %%i in (1, 1, 3) do (

                set "targetFolder=!documentsChildFolder[%%i]!"

                REM Check if the child folder exists, if no create them
                if not exist "!targetFolder!" (

                    echo !fridayPromptMessage! "Folder !targetFolder! does not exist. Creating..."
                    mkdir "!targetFolder!"

                ) else (

                    echo !fridayPromptMessage! "Folder !targetFolder! already exists, continuing.."
                )
            )

        ) else (

            REM Create the Friday Documents folder
            mkdir "!fridayDocumentsLocation!"
            echo !fridayPromptMessage! "Documents folder created, continuing..."

            REM Create child folders
            for /L %%i in (1, 1, 3) do (

                set "targetFolder=!documentsChildFolder[%%i]!"

                if not exist "!targetFolder!" (

                    echo !fridayPromptMessage! "Folder !targetFolder! does not exist. Creating..."
                    mkdir "!targetFolder!"

                ) else (

                    echo !fridayPromptMessage! "Folder !targetFolder! already exists, continuing.."
                )
            )
        )

    rem goto MenuChoice1

    REM Test
    set "searchDirectory=%fridaySubroutinesLocation%"

    REM Target file name
    set "fileName=Friday_ChooseMenuPage.bat"

    REM Search for specified file in directory "Friday"
    for /f "delims=" %%F in ('dir "%searchDirectory%\%fileName%" /s /b') do (

        rem echo Found: %%F
        call "%%F"
        rem goto done

    )

REM Menu Choice1 [Communication] ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
:MenuChoice1
    goto communicationStart
    REM -- TODO --
    REM * Options
    REM     - Clean file (Y/N). Clean by overwriting existing with new.
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
        @echo off
        set communicationMain1=Communication

        setlocal

        echo {Main\%communicationMain1%\[Actions]
        echo.
        echo                                             %fridayPromptMessage% "Choose Action.."
        echo.
        echo                                                         Actions                    Status
        echo                                                  +------------------+           +----------+
        echo                                                     1 ^- Notes                      DONE
        echo                                                     2 ^- Alarms                     DONE
        echo                                                     3 ^- Discord Message            TBC
        echo.
        echo                                                     4 ^- Back                       DONE
        echo.
        echo                                                     5 ^- Options...                 TBC
        echo                                                     6 ^- Custom Command             DONE
        echo                                                     7 ^- ^Print Message              DONE
        echo                                                     8 ^- View Folder...             DONE

        REM Prompt user input
        choice /n /c 12345678
        goto writeMessageChoice%errorlevel%Start

        REM Notes
        :writeMessageChoice1Start
            goto notesStart
            REM   --- TODO ---
            REM  * Repeating options.
            REM  * View upcoming reminders in a list and show activation time.
            REM  *
            REM  *

            REM   --- Completed ---
            REM  * Start program after X time.
            REM  * Store remind message in text file.
            REM
            REM
            REM
            REM
            REM
            REM

            :notesStart
                CLS
                setlocal enabledelayedexpansion

                REM Ensure folder exists
                if not exist "!fridayNotesLocation!" (
                    CLS
                    echo %fridayPromptMessage% "Folder for notes does not exist. Creating.."
                    mkdir "!fridayNotesLocation!"
                    timeout /t 2 >nul
                ) else (
                    CLS
                    echo %fridayPromptMessage% "Moving to notes folder.."
                    timeout /t 1 >nul
                )

                goto notesUserFileName

                :notesUserFileName
                    CLS

                    echo {Main\%communicationMain1%\Notes\[Files]
                    echo.
                    echo                                        %fridayPromptMessage% "Displaying available notes"
                    echo.
                    echo                                                           Notes
                    echo                                                +------------------------+
                    echo.

                    set "entryPadding=                                                 "

                    REM Check if folder has any files
                    dir /b /a:-d "!fridayNotesLocation!" 2>nul | findstr . >nul
                    if errorlevel 1 (

                        echo!entryPadding!^(No notes available^)

                    ) else (
                        for /f "delims=" %%i in ('dir /b /o:n /a:-d "!fridayNotesLocation!"') do (

                            echo !entryPadding! %%i
                        )
                    )

                    echo.
                    echo                                                +------------------------+
                    echo.

                    echo                                                     ^("?" ^for ^Help^)
                    echo                                                    ^("b" to go Back^)
                    echo.
                    set /p userNoteName=[File Name]

                    if /i "%userNoteName%"=="B" (

                        goto communicationStart
                    )

                    if "%userNoteName%"=="?" (

                        goto noteHelp

                    ) else (

                        goto continueNote
                    )

                    :noteHelp
                        CLS

                        echo {Main\%communicationMain1%\Notes\[^Help]
                        echo.
                        echo                                        %fridayPromptMessage% "Displaying help section"
                        echo.
                        echo                                                        ^Help Notes
                        echo                                                +------------------------+
                        echo                        ^-^> Creating a new note:   ^Type a new file name.
                        echo                        ^-^> Add to existing:       ^Type its name ^(without extension^) ^& the new message.
                        echo                        ^-^> Sorting:               Notes are always sorted alphabetically. (A-Z)
                        echo                        ^-^> Notes can be viewed ^at: "{Main\%communicationMain1%\[View Folder...]"
                        echo                             ^-^> ^Or in %fridayRootLocation%\Friday Documents\Friday Messages
                        echo.
                        echo                                               [Press any key to return...]
                        pause >nul
                        goto notesUserFileName

                    :continueNote
                    REM Check for empty userInput.
                    if "%userNoteName%"=="" (

                        goto emptyUserInput
                    )

                    REM Replace spaces with underscores.
                    set "userNoteName=%userNoteName: =_%"

                    REM Check if input only contains underscores (converted from spaces).
                    if "%userNoteName%"=="_" (

                        goto onlySpaceUserInput
                    )

                    REM Loop to remove multiple consecutive underscores.
                    :checkMultipleUnderscores
                        set "prevInput=%userNoteName%"

                        REM Replace double underscores with a single underscore
                        set "userNoteName=%userNoteName:__=_%"

                        REM Continue looping if changes were made.
                        if not "%userNoteName%"=="%prevInput%" (

                            goto checkMultipleUnderscores
                        )

                        REM Last check if input only contains underscores (converted from spaces).
                        if "%userNoteName%"=="" (

                            goto emptyUserInput
                        )

                    goto notesUserMessage

                    :emptyUserInput
                        CLS
                        echo %fridayPromptMessage% "Field cannot be left blank"
                        echo.
                        echo [Press any key to continue...]
                        pause >nul
                        CLS
                        goto notesUserFileName

                    :onlySpaceUserInput
                        CLS
                        echo %fridayPromptMessage% "Field cannot only consist of spaces"
                        echo.
                        echo [Press any key to continue...]
                        pause >nul
                        CLS
                        goto notesUserFileName

                :notesUserMessage
                    CLS

                    REM Check if input only contains underscores (converted from spaces).
                    if "%userNoteName%"=="_" (

                        goto onlySpaceUserInput
                    )

                    REM Prompt message to user.
                    echo {Main\%communicationMain1%\Notes\"%userNoteName%"\[Message]
                    echo.
                    echo %fridayPromptMessage% "Enter a message"
                    echo ----------------------
                    echo.
                    set /p userMessage=[Message]:

                    REM Declare output path.
                    set "outputFile=%fridayNotesLocation%\%userNoteName%.txt"

                    REM Specify the existing file and add message.
                    REM set "existingFile=%USERPROFILE%\Desktop\%outputFile%.txt"
                    rem set "newMessage=%userMessage%"

                    REM Create a temporary file.
                    set "tempFile=%USERPROFILE%\Desktop\notesTempfile.txt"

                    REM Print userMessage and contents of outputFile to tempFile
                    (

                        echo     -- Note --
                        echo %date:~8,2%-%date:~5,2%-%date:~0,4% @%time:~0,5%
                        echo _____________________
                        echo.
                        echo "%userMessage%"
                        echo.
                        echo.
                        echo.
                        type "%outputFile%"

                    )> "%tempFile%"

                    REM Overwrite the existing file with the temporary file by copying its name.
                    move /Y "%tempFile%" "%outputFile%"

                    CLS
                    echo %fridayPromptMessage% "Message stored in:"
                    echo                  %fridayRootLocation%\Friday Messages\"%userNoteName%"
                    timeout /t 5 >nul

                :notesViewFolder
                    CLS
                    echo {Main\%communicationMain1%\Notes\"%userNoteName%"\Message\[ViewFolder]
                    echo.
                    echo View folder?
                    echo 1 - Yes
                    echo 2 - No (default)

                    choice /n /d 3 /t 10 /c 123
                    goto notesViewFolder%errorlevel%

                    :notesViewFolder1
                        CLS
                        echo %fridayPromptMessage% "Displaying Folder.."
                        timeout /t 2 >nul
                        start Explorer.exe "%fridayNotesLocation%"
                        goto notesEnd

                    :notesViewFolder2
                        CLS
                        goto notesEnd

                    :notesViewFolder3
                        CLS
                        echo %fridayPromptMessage% "No input detected.. continuing"
                        timeout /t 2 >nul
                        goto notesEnd

                :notesEnd
                    REM End of writeMessageChoice1
                    endlocal
                    CLS
                    @echo off
                    echo %fridayPromptMessage% "Returning to menu.."
                    timeout /t 2 >nul
                    goto communicationStart

                    REM Notes parachute
                    endlocal
                    @echo off
                    echo.
                    echo Fishnet: End of section catcher.
                    echo %fridayPromptMessage% "If this message is seen an error has occured in notes."
                    echo.
                    echo [Press any key to return to main menu..]
                    pause >nul
                    goto communicationStart

        REM Alarm
        :writeMessageChoice2Start
            goto alarmStart
            REM   --- TODO ---
            REM  * Repeating options.
            REM  * View upcoming reminders in a list and show activation time.
            REM  *
            REM  *

            REM   --- Completed ---
            REM  * Start program after X time.
            REM  * Store remind message in text file.
            REM
            REM
            REM
            REM
            REM
            REM

            REM Note: schtasks (schedules commands or programs)

            :alarmStart
                CLS
                echo {Main\%communicationMain1%\Alarms\[Files]
                echo.

                REM Declare additional variables.
                set "folderName=Friday Alarms"
                set "targetFolder=%fridayAlarmsFolderLocation%"

                REM Check if the specified folder exists. If not, create one.
                if exist "%targetFolder%" (

                    CLS
                    echo %fridayPromptMessage% "Moving to %folderName% folder.."
                    echo.
                    timeout /t 1 >nul

                ) else (

                    REM Create a new folder in the Friday_Root directory.
                    CLS
                    echo %fridayPromptMessage% "Folder %folderName% does not exist. Creating.."
                    mkdir "%fridayRootLocation%\%folderName%"
                    echo.
                    timeout /t 2 >nul
                )
                goto alarmFileNameChoice2

                :emptyUserMessage
                    CLS
                    echo %fridayPromptMessage% "Field cannot be left blank"
                    echo.
                    echo [Press any key to continue...]
                    pause >nul
                    CLS
                    goto alarmFileMessageChoice2

                :onlySpaceUserMessage
                    CLS
                    echo %fridayPromptMessage% "Field cannot only consist of spaces"
                    echo.
                    echo [Press any key to continue...]
                    pause >nul
                    CLS
                    goto alarmFileMessageChoice2

            :alarmFileNameChoice2
                CLS
  rem start of new --------------------------------------------------------------------------------------------------------------------------------------------------------------------
                CLS

                REM Check if the specified folder exists
                if exist "%targetFolder%" (

                    echo {Main\%communicationMain1%\Alarms\[Files]
                    echo.
                    echo                                        %fridayPromptMessage% "Displaying available alarms"
                    echo.
                    echo                                                          Alarms
                    echo                                                +------------------------+
                    echo.

                    set "entryPadding=                                                 "

                    REM Check if folder has any files
                    dir /b /a:-d "!fridayAlarmsFolderLocation!" 2>nul | findstr . >nul
                    if errorlevel 1 (

                        echo!entryPadding!^(No alarms available^)

                    ) else (
                        for /f "delims=" %%i in ('dir /b /o:n /a:-d "!fridayAlarmsFolderLocation!"') do (

                            echo !entryPadding! %%i
                        )
                    )

                    echo.
                    echo                                                +------------------------+
                    echo.

                ) else (

                    echo %fridayPromptMessage% "The folder '%targetFolder%' does not exist.."
                    echo.
                    echo [Press any key to return...]
                    pause >nul
                    goto
                )

                echo                                                     ^("?" ^for ^Help^)
                echo                                                    ^("b" to go Back^)
                echo.
                set /p userAlarmName=[File Name]

                if /i "%userAlarmName%"=="B" (

                    goto communicationStart
                )

                if "%userAlarmName%"=="?" (

                    goto alarmHelp

                ) else (

                    goto continueAlarm
                )

                :alarmHelp
                    CLS

                    echo {Main\%communicationMain1%\Alarms\[^Help]
                    echo.
                    echo                                        %fridayPromptMessage% "Displaying help section"
                    echo.
                    echo                                                        ^Help Alarms
                    echo                                                +------------------------+
                    echo                        ^-^> Creating a new alarm:   ^Type a new file name.
                    echo                        ^-^> Add to existing:       ^Type its name ^& the new message.
                    echo                        ^-^> Sorting:               Alarms are always sorted alphabetically. (A-Z)
                    echo                        ^-^> View Alarms ^at: "{Main\%communicationMain1%\[View Folder...]"
                    echo                             ^-^> ^Or in %fridayRootLocation%\Friday Documents\Friday Alarms
                    echo.
                    echo                                               [Press any key to return...]
                    pause >nul
                    goto notesUserFileName
rem end of new --------------------------------------------------------------------------------------------------------------------------------------------------------------------

                :continueAlarm

                REM Check for empty userInput.
                if "%userAlarmName%"=="" (

                    goto emptyUserInput
                )

                REM Replace spaces with underscores.
                set "userAlarmName=%userAlarmName: =_%"

                REM Check if input only contains underscores (converted from spaces).
                if "%userAlarmName%"=="_" (

                    goto onlySpaceUserInput
                )

                REM Loop to remove multiple consecutive underscores.
                :checkMultipleUnderscores
                    set "prevInput=%userAlarmName%"

                    REM Replace double underscores with a single underscore
                    set "userAlarmName=%userAlarmName:__=_%"

                    REM Continue looping if changes were made.
                    if not "%userAlarmName%"=="%prevInput%" (

                        goto checkMultipleUnderscores
                    )

                    REM Last check if input only contains underscores (converted from spaces).
                    if "%userAlarmName%"=="" (

                        goto emptyUserInput
                    )

                goto alarmFileMessageChoice2

                :emptyUserInput
                    CLS
                    echo %fridayPromptMessage% "Field cannot be left blank."
                    echo.
                    echo [Press any key to continue...]
                    pause >nul
                    CLS
                    goto alarmFileNameChoice2

                :onlySpaceUserInput
                    CLS
                    echo %fridayPromptMessage% "Field cannot only consist of spaces."
                    echo.
                    echo [Press any key to continue...]
                    pause >nul
                    CLS
                    goto alarmFileNameChoice2

            :alarmFileMessageChoice2
                CLS


                REM Prompt user for message.
                echo {Main\%communicationMain1%\Alarms\"%userAlarmName%"\[Message]
                echo.
                echo %fridayPromptMessage% "Enter a message"
                echo ----------------------
                echo.
                set /p userMessage=[Message]:

                REM Basic checks of user message
                REM Check if input only contains underscores (converted from spaces).
                if "%userMessage%"=="" (

                    goto emptyUserMessage
                )

                REM Check if input only contains underscores (converted from spaces).
                if "%userMessage%"==" " (

                    goto onlySpaceUserMessage
                )

                REM Declare output path.
                set "outputFile=%fridayAlarmsFolderLocation%\%userAlarmName%.txt"

                REM Create a temporary file.
                set "tempFile=%USERPROFILE%\Desktop\notesTempfile.txt"

                REM Print userMessage and contents of outputFile to tempFile
                (

                    echo     -- Alarm Message --
                    echo Created: %date:~8,2%-%date:~5,2%-%date:~0,4% @%time:~0,5%
                    echo _____________________
                    echo.
                    echo "%userMessage%"
                    echo.
                    echo.
                    echo.
                    type "%outputFile%"

                )> "%tempFile%"

                REM Overwrite the existing file with the temporary file by copying its name.
                move /Y "%tempFile%" "%outputFile%"
                goto alarmTriggerChoice2

            :alarmTriggerChoice2
                    CLS
                    echo {Main\%communicationMain1%\Alarms\"%userAlarmName%"\Message\[Trigger]
                    echo.

                    set timerTrigger=0
                    echo %fridayPromptMessage% "How should the alarm be triggered?"
                    echo.

                    echo Choose:
                    echo 1 - Countdown
                    echo 2 - Specific ^Time

                    choice /n /c 12
                    goto alarmTriggerOption%errorlevel%

                    REM Deploy alarm using a timer.
                    :alarmTriggerOption1
                        CLS
                        echo {Main\%communicationMain1%\Alarms\"%userAlarmName%"\Message\Trigger_[Time]
                        echo.
                        setlocal enabledelayedexpansion
                        set alarmDisclaimer1=If PC is turned off during this time the alarm will be canceled.
                        set alarmDisclaimer2=The message itself is always stored in it's specified file.

                        echo %fridayPromptMessage% "How long should the countdown be?"
                        echo ------------------------------
                        echo.
                        echo Examples:
                        echo 60     = 1  minute
                        echo 300    = 5  minutes
                        echo 600    = 10 minutes
                        echo 3600   = 1  hour
                        echo 18000  = 5  hours
                        echo.
                        echo In Seconds. Max 24 hours (86,400 seconds).
                        echo.
                        echo %alarmDisclaimer1%
                        echo %alarmDisclaimer2%
                        echo.
                        set /p userTime=[Time]:

                        set timerTime=%userTime%
                        set event=AlarmClockCountdown
                        set timerTrigger=1
                        goto alarmSummary

                    REM Deploy alarm at specific system time.
                    :alarmTriggerOption2
                        REM Must use format [HH:MM].
                        CLS
                        echo {Main\%communicationMain1%\Alarms\"%userAlarmName%"\Message\Trigger_[Time]
                        echo.
                        set systemTime=%time:~0,5%
                        echo %fridayPromptMessage% "At what time should the reminder activate?"
                        echo ------------------------------
                        echo.
                        echo Format [(H)H:MM] (E.g: 9:32 or 12:56)
                        set /p userTime=[^Time]:

                        set timerTime=%userTime%
                        set event=AlarmClockTime
                        goto alarmSummary

            REM    -- ARCHIVED --
            REM PROBLEM: Currently there is no known way to effectively repeat an alarm set by a batch script.
            REM Repeat alarm.
            REM :writeMessageChoice2Repeat
                REM Options 1. Countdown 2. Start at specific system time.
                REM Start new window counting down.
                REM When countdown ends show .txt file specified by user.
                REM
                REM CLS
                REM echo {Main\%communicationMain1%\Alarms\"%userAlarmName%"\Message\When\[Repetition]
                REM echo.
                REM echo %fridayPromptMessage% "How many times?"
                REM echo.
                REM echo 1} Once
                REM echo 2} Choose
                REM echo 3} Don't repeat (default)
                REM
                REM choice /n /d 3 /t 10 /c 123
                REM goto writeMessageChoice2Repeat%errorlevel%
                REM
                REM REM Repeat Once
                REM :writeMessageChoice2Repeat1
                REM     echo Repeat Once option.
                REM     pause
                REM     goto alarmSummary
                REM
                REM
                REM REM User chosen amount of repetitions.
                REM :writeMessageChoice2Repeat2
                REM     REM User must use format [HH:MM]
                REM     REM Use: set /p [userAlarmName]
                REM     echo Repeat [X amount] of times option.
                REM     pause
                REM     goto alarmSummary
                REM
                REM REM Dont repeat.
                REM :writeMessageChoice2Repeat3
                REM     REM
                REM     echo Don't repeat option. (Default.)
                REM     pause
                    REM     goto alarmSummary

            :alarmSummary
                CLS
                echo {Main\%communicationMain1%\Alarms\"%userAlarmName%"\Message\Trigger\[Summary]
                echo.

                echo Alarm Summary

                if %timerTrigger%==1 (

                    echo %fridayPromptMessage% "Alarm will be triggered in %timerTime% seconds"
                    set timerTrigger=0

                ) else (

                    echo %fridayPromptMessage% "Alarm will be triggered at %timerTime%"

                )

                echo               "Message stored in '%userAlarmName%'"
                echo               "Don't close the 'Alarm' window"
                echo.
                timeout /t 3 >nul

                REM Call Alarm and send relevant variables.
                start /min cmd /k call "%fridaySubroutinesLocation%\Friday_Reflect.bat" %event% %timerTime% "%userMessage%"
                goto writeMessageChoice2ViewFolder

            :writeMessageChoice2ViewFolder
                CLS
                echo {Main\%communicationMain1%\Alarms\"%userAlarmName%"\Message\Trigger\Summary\[ViewFolder]
                echo.
                echo %fridayPromptMessage% View alarm folder?
                echo 1 - Yes
                echo 2 - No (default)

                REM If no input within x seconds, move to communicationStart.
                choice /n /d 2 /t 10 /c 12
                goto writeMessageChoice2ViewFolder%errorlevel%

                REM Display folder.
                :writeMessageChoice2ViewFolder1
                    CLS
                    echo %fridayPromptMessage% "Displaying Folder.."
                    timeout /t 2 >nul
                    start explorer.exe "%fridayAlarmsFolderLocation%"
                    goto writeMessageChoice2End

                REM Don't show folder.
                :writeMessageChoice2ViewFolder2
                    CLS
                    goto writeMessageChoice2End

            REM End of writeMessageChoice2
            :writeMessageChoice2End
                endlocal
                CLS
                @echo off

                echo %fridayPromptMessage% "Returning to menu.."
                timeout /t 2 >nul
                goto communicationStart

                REM parachute
                endlocal
                @echo off
                echo.
                echo Fishnet: End of section catcher.
                echo %fridayPromptMessage% "If this message is seen an error has occured."
                echo.
                echo [Press any key to return to main menu..]
                pause >nul
                goto Main

        REM Discord Message (WIP)
        :writeMessageChoice3Start
            goto discordMessageStart
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

            :discordMessageStart
                CLS
                echo Placeholder
                echo.
                echo Enter message:
                set /p userMessage=[Message]:

                echo.
                echo %userMessage%

            pause
            goto communicationStart

        REM Return to Main
        :writeMessageChoice4Start
            CLS
            echo Returning to Main.
            timeout /t 1 >nul
            endlocal
            call %fridayMain%

        REM Messages Options (WIP)
        :writeMessageChoice5Start
            goto communicationOptionsStart
            REM   --- TODO ---
            REM  * Delete specific file.
            REM  * List all files in selected Directory.
            REM     - OR List all available files in the Friday_Root folder in vertical "pillars". (Similar to the system info layout.)
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

            :communicationOptionsStart
            CLS
            setlocal
            echo {Main\%communicationMain1%\[Options]
            echo.
            echo Placeholder
            echo.
            echo [Press any key to return...]
            pause >nul

            endlocal
            goto communicationStart

        REM Execute custom command in Terminal
        :writeMessageChoice6Start
            CLS
            setlocal enabledelayedexpansion

            REM Set examples as strings to avoid potential conflict. Prints without [""] for better UX.
            set "terminalSuggestion1=cd [path]"
            set "terminalSuggestion2=echo [message]"
            set "terminalSuggestion3=tree [path]"
            set "terminalSuggestion4=help [optionalCommand]"

            REM Set explanation as strings to avoid potential conflict. Prints without [""] for better UX.
            set "terminalExplanation1=(Moves interpreter to specified location on PC.)"

            set "terminalExplanation2=(Prints the typed message.)"

            set "terminalExplanation3a=(Prints a tree of all available folders in the specified location.)"
                set "terminalExplanation3b=(If no path is specified, prints location of "Friday.bat".)"

            set "terminalExplanation4a=(Shows all different options for a specific command.)"
                set "terminalExplanation4b=(If no extra command is given, prints all available commands.)"

            echo {Main\%communicationMain1%\Custom_Command\[Command]
            echo.

            REM Examples printed before user input.
            echo Examples:
            echo      ~ %terminalSuggestion1%
            echo            %terminalExplanation1%
            echo.
            echo      ~ %terminalSuggestion2%
            echo            %terminalExplanation2%
            echo.
            echo      ~ %terminalSuggestion3%
            echo            %terminalExplanation3a%
            echo            %terminalExplanation3b%
            echo.
            echo      ~ %terminalSuggestion4%
            echo            %terminalExplanation4a%
            echo            %terminalExplanation4b%
            echo.

            set /p userMessage=[EnterCommand]:

            REM If user message is empty return to writeMessageChoice6Start
            echo "!userMessage!" | find " " >nul
            if "!userMessage!" == "" (

                CLS
                echo %fridayPromptMessage% "Field cannot be blank".
                pause >nul
                goto writeMessageChoice6Start

            REM If no spaces print as normal text (can be used for commands)
            ) else (

                CLS

                REM Execute userAlarmName in another cmd. Keep current cmd open.
                start /im cmd.exe /k "@echo off & CLS & !userMessage! & echo. & echo ------------ & echo [Press any key to close] & pause >nul & echo closing.. & exit /b"

                echo %fridayPromptMessage% "Command executed"
                echo.
                echo [Press any key to return...]
                pause >nul
                goto communicationStart

            )

            endlocal
            goto communicationStart

        REM PrintMsg in Terminal
        :writeMessageChoice7Start
            CLS
            echo {Main\%communicationMain1%\Print_Message\[Message]
            echo.
            echo Type a message to print in the console.
            echo.
            set /p userMessage=[Message]:

            REM If specified message from user, goto specified easter egg
            if "%userMessage%" == "DRAGON" (goto EEDragon)
            if "%userMessage%" == "DUCK" (goto EEDuck)
            if "%userMessage%" == "PARROT" (goto EEParrot)

            REM If user message is empty return to writeMessageChoice8Start
            if "%userMessage%" == "" (

                CLS
                echo %fridayPromptMessage% "Field cannot be left blank".
                echo.
                echo [Press any key to continue...]
                pause >nul
                goto writeMessageChoice8Start
            )

            CLS
            echo %fridayPromptMessage% "%userMessage%"
            echo.
            echo [Press any key to return...]
            pause >nul
            goto communicationStart

            REM Dragon easter egg
            :EEDragon
                CLS
                echo                                                          $,  $,     ,
                echo                                                          "ss.$ss. .s'
                echo                                                  ,     .ss$$$$$$$$$$s,
                echo                                                  $. s$$$$$$$$$$$$$$`$$Ss
                echo                                                  "$$$$$$$$$$$$$$$$$$o$$$       ,
                echo                                                 s$$$$$$$$$$$$$$$$$$$$$$$$s,  ,s
                echo                                                s$$$$$$$$$"$$$$$$""""$$$$$$"$$$$$,
                echo                                                s$$$$$$$$$$s""$$$$ssssss"$$$$$$$$"
                echo                                               s$$$$$$$$$$'         `"""ss"$"$s""
                echo                                               s$$$$$$$$$$,              `"""""$  .s$$s
                echo                                               s$$$$$$$$$$$$s,...               `s$$'  `
                echo                                           `ssss$$$$$$$$$$$$$$$$$$$$####s.     .$$"$.   , s-
                echo                                             `""""$$$$$$$$$$$$$$$$$$$$#####$$$$$$"     $.$'
                echo                                                   "$$$$$$$$$$$$$$$$$$$$$####s""     .$$$|
                echo                                                    "$$$$$$$$$$$$$$$$$$$$$$$$##s    .$$" $
                echo                                                     $$""$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"   `
                echo                                                    $$"  "$"$$$$$$$$$$$$$$$$$$$$S""""'
                echo                                               ,   ,"     '  $$$$$$$$$$$$$$$$####s
                echo                                               $.          .s$$$$$$$$$$$$$$$$$####"
                echo                                   ,           "$s.   ..ssS$$$$$$$$$$$$$$$$$$$####"
                echo                                   $           .$$$S$$$$$$$$$$$$$$$$$$$$$$$$#####"
                echo                                   Ss     ..sS$$$$$$$$$$$$$$$$$$$$$$$$$$$######""
                echo                                    "$$sS$$$$$$$$$$$$$$$$$$$$$$$$$$$########"
                echo                             ,      s$$$$$$$$$$$$$$$$$$$$$$$$#########""'
                echo                             $    s$$$$$$$$$$$$$$$$$$$$$#######""'      s'         ,
                echo                             $$..$$$$$$$$$$$$$$$$$$######"'       ....,$$....    ,$
                echo                              "$$$$$$$$$$$$$$$######"' ,     .sS$$$$$$$$$$$$$$$$s$$
                echo                                $$$$$$$$$$$$#####"     $, .s$$$$$$$$$$$$$$$$$$$$$$$$s.
                echo                     )          $$$$$$$$$$$#####'      `$$$$$$$$$###########$$$$$$$$$$$.
                echo                    ((          $$$$$$$$$$$#####       $$$$$$$$###"       "####$$$$$$$$$$
                echo                    ) \         $$$$$$$$$$$$####.     $$$$$$###"             "###$$$$$$$$$   s'
                echo                   (   )        $$$$$$$$$$$$$####.   $$$$$###"                ####$$$$$$$$s$$'
                echo                   )  ( (       $$"$$$$$$$$$$$#####.$$$$$###'                .###$$$$$$$$$$"
                echo                   (  )  )   _,$"   $$$$$$$$$$$$######.$$##'                .###$$$$$$$$$$
                echo                   ) (  ( \.         "$$$$$$$$$$$$$#######,,,.          ..####$$$$$$$$$$$"
                echo                  (   )$ )  )        ,$$$$$$$$$$$$$$$$$$####################$$$$$$$$$$$"
                echo                  (   ($$  ( \     _sS"  `"$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$S$$,
                echo                   )  )$$$s ) )  .      .   `$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"'  `$$
                echo                    (   $$$Ss/  .$,    .$,,s$$$$$$##S$$$$$$$$$$$$$$$$$$$$$$$$S""        '
                echo                      \)_$$$$$$$$$$$$$$$$$$$$$$$##"  $$        `$$.        `$$.
                echo                          `"S$$$$$$$$$$$$$$$$$#"      $          `$          `$
                echo                              `"""""""""""""'         '           '           '

                echo.
                echo [Press any key to return...]
                pause >nul
                endlocal
                goto communicationStart

            REM Duck easter egg
            :EEDuck
                CLS
                echo.
                echo.

                echo                                                88                        88
                echo                                                88                        88
                echo                                                88                        88
                echo                                        ,adPPYb,88 88       88  ,adPPYba, 88   ,d8
                echo                                       a8"    `Y88 88       88 a8"     "" 88 ,a8"
                echo                                       8b       88 88       88 8b         8888[
                echo                                       "8a,   ,d88 "8a,   ,a88 "8a,   ,aa 88`"Yba,
                echo                                        `"8bbdP"Y8  `"YbbdP'Y8  `"Ybbd8"' 88   `Y8a
                echo                                                                           - quack :)

                echo.
                echo.
                echo [Press any key to return...]
                pause >nul
                endlocal
                goto communicationStart

            REM Parrot easter egg
            :EEParrot
                CLS
                echo %fridayPromptMessage% "Parrot is set free"
                start /im cmd.exe /k "curl parrot.live"

                echo.
                echo [Press any key to return...]
                pause >nul
                endlocal
                goto communicationStart

        REM View Folders (WIP)
        :writeMessageChoice8Start

            CLS
            setlocal
            echo {Main\%communicationMain1%\[ViewFolder]
            echo.
            echo %fridayPromptMessage% "Choose Folder.."
            echo.
            echo [Choose]
            echo 1 - Messages
            echo 2 - Alarms
            echo 3 - Documents
            echo.
            echo 4 - Back

            choice /n /c 1234
            goto userFolderChoice%errorlevel%

            REM Messages folder
            :userFolderChoice1
                CLS
                echo %fridayPromptMessage% "Displaying 'Messages' folder"
                start explorer.exe "%fridayNotesLocation%"
                timeout /t 3 >nul

                echo %fridayPromptMessage% "Returning to menu.."
                timeout/t 2 >nul
                goto communicationStart

            REM Alarms folder
            :userFolderChoice2
                CLS
                echo %fridayPromptMessage% "Displaying 'Alarms' folder"
                start explorer.exe "%fridayAlarmsFolderLocation%"
                timeout /t 3 >nul

                echo %fridayPromptMessage% "Returning to menu.."
                timeout/t 2 >nul
                goto communicationStart

            REM Open all folders
            :userFolderChoice3
                CLS
                echo %fridayPromptMessage% "Displaying all available folders"
                start explorer.exe "%fridayRootLocation%\Friday Documents"

            REM Back
            :userFolderChoice4
                goto communicationStart