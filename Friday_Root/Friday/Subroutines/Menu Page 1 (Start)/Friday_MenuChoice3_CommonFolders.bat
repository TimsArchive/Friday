REM Start of the program ------------------------------------------------------------------------------------------------------------------------------------------------------------
:Start
    REM Turn off console log
    @echo off

    REM Clear console
    CLS

    REM Set window name to "Friday"
    title=Friday - Common Folders

    REM If echo is on; Display: "([Hour]:[Minute]) %fridayPromptMessage% " as the prompt
    prompt %time:~0,5% Friday:
    set fridayPromptMessage=%time:~0,5% Friday:

    REM Prompt User
    echo %fridayPromptMessage% "Loading.."

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
            set "fridaySubroutinesLocation=%fridayRootLocation%\Friday\Friday Subroutines"

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

:Main
    @echo off
    CLS
    setlocal enabledelayedexpansion

    REM Print menu options.
    echo =----------------------------------------------------~ { Friday } ~----------------------------------------------------=
    echo {Page1\Common_Folders\[Choose]
    echo.
    echo                          Current Page                   Actions                       Status
    echo                         +------------+         +-----------------------+           +----------+
    echo                              1/9
    echo                                                    1}  Appdata                         ~DONE
    echo                                                    2}  Temp Folders                    ~DONE
    echo                                                    3}  Windows Folders                 ~DONE
    echo.
    echo                                                    4}  Back                            ~DONE
    echo.
    echo                                                    5}  Placeholder                     (TBD)
    echo                                                    6}  Placeholder                     (TBD)
    echo                                                    7}  Placeholder                     (TBD)
    echo                                                    8}  Placeholder                     (TBD)
    echo                                                    9}  Placeholder                     (TBD)

    REM Loop to place the cursor bottom left
    :cursorBottomLeft
    for /L %%i in (1,1,8) do (

        REM If variable "i" is <= the specified number (8), print echo.
        if %%i leq 8 (

            echo.
        )
    )
    echo                                          X/X = Number of menu options completed
    echo                    TBD = To Be Decided ^| TBC = To Be created ^| WIP = Work In Progress (aka [XX] complete)
    echo =------------------------------------------------------~ ======= ~----------------------------------------------------=

    choice /n /c 123456789
    endlocal
    goto menuChoice%errorlevel%

    REM Appdata
    :menuChoice1
        CLS
        setlocal enabledelayedexpansion

        :appdataStart
            CLS
            echo {Page1\Common_Folders\Appdata\[Choose]
            echo.

            echo Choose Action
            echo 1} Appdata
            echo 2} Appdata (Roaming)
            echo 3} Both
            echo.
            echo 4} Back

            choice /n /c 1234
            goto appdataUserChoice%errorlevel%

            REM Appdata
            :appdataUserChoice1
                CLS
                start "" "%userprofile%\appdata"
                goto Main

            REM %Appdata%
            :appdataUserChoice2
                CLS
                start "" %appdata%
                goto Main

            REM Both (Appdata & %Appdata%)
            :appdataUserChoice3
                CLS
                start "" "%userprofile%\appdata"
                start "" %appdata%
                goto Main

            REM Back to Page 1 Menu
            :appdataUserChoice4
                goto Main

        endlocal

        goto Main

    REM Temp Folders
    :menuChoice2
        CLS
        setlocal enabledelayedexpansion

        :tempFoldersStart
            CLS
            echo {Page1\Common_Folders\Temp_Folders\[Choose]
            echo.

            echo %fridayPromptMessage% "The file found in these folders can.."
            echo               "..be safely deleted to free up space on your PC"
            echo.
            echo Choose Action
            echo 1} Temp - Windows
            echo 2} Temp - Local
            echo 3} Prefetch
            echo.
            echo 4} Back
            echo.
            echo 5} All

            choice /n /c 12345
            goto appdataUserChoice%errorlevel%

            REM Appdata
            :appdataUserChoice1
                CLS
                start "" temp
                goto Main

            REM %Appdata%
            :appdataUserChoice2
                start "" %temp%
                goto Main

            :appdataUserChoice3


            REM Back to Page 1 Menu
            :appdataUserChoice4
                goto Main

            REM Both (Appdata & %Appdata%)
            :appdataUserChoice5
                start "" temp
                start "" %temp%
                start "" Prefetch
                goto Main

        endlocal

        goto Main

    REM Windows Start Folder
    :menuChoice3
        CLS
        setlocal enabledelayedexpansion

        :tempFoldersStart
            CLS
            echo {Page1\Common_Folders\Windows_Folders\[Choose]
            echo.
            echo Choose Action
            echo 1} Startup
            echo 2} All Apps
            echo 3} Steam "Common"
            echo.
            echo 4} Back
            echo.
            echo 5} All

            choice /n /c 12345
            goto appdataUserChoice%errorlevel%

            REM Shell Startup
            :appdataUserChoice1
                CLS
                start "" shell:startup
                goto Main

            REM Shell All Applications
            :appdataUserChoice2
                start "" shell:appsfolder
                goto Main

            REM Steam Common
            :appdataUserChoice3
                CLS
                start "" "C:\Program Files (x86)\Steam\steamapps\common"
                goto Main

            REM Back to Page 1 Menu
            :appdataUserChoice4
                goto Main

            REM All (Startup, All Apps, Steam Common)
            :appdataUserChoice5
                start "" shell:startup
                start "" shell:appsfolder
                start "" "C:\Program Files (x86)\Steam\steamapps\common"
                goto Main

        endlocal

        goto Main

    REM Return to Start Page (Page 1 - Start)
    :menuChoice4
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

        REM Safety net
        CLS
        echo Couldn not ^find "Friday.bat"
        echo [Press any key to continue...]
        goto Main

    :menuChoice5
        CLS
        echo menuChoice5
        pause
        goto Main

    :menuChoice6
        CLS
        echo menuChoice6
        pause
        goto Main

    :menuChoice7
        CLS
        echo menuChoice7
        pause
        goto Main

    :menuChoice8
        CLS
        echo menuChoice8
        pause
        goto Main

    :menuChoice9
        CLS
        echo menuChoice9
        pause
        goto Main