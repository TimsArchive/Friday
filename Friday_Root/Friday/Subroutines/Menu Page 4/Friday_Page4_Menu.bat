REM Start of the program ------------------------------------------------------------------------------------------------------------------------------------------------------------
:Start
    REM Turn off console log
    @echo off

    REM Clear console
    CLS

    REM Set window name to "Friday"
    title=Friday - Page 4

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
    echo {Page4\[Choose]
    echo.
    echo                          Current Page                    Pages                        Status
    echo                         +------------+         +-----------------------+           +----------+
    echo                              4/9
    echo                                                    1}  Main (Page 1)                   ~DONE
    echo                                                    2}  Placeholder                     (TBD)
    echo                                                    3}  Placeholder                     (TBD)
    echo.
    echo                                                    4}  Placeholder                     (TBD)
    echo.
    echo                                                    5}  Placeholder                     (TBD)

    echo                                                    6}  Placeholder                     (TBD)
    echo                                                    7}  Placeholder                     (TBD)
    echo                                                    8}  Placeholder                     (TBD)
    echo                                                    9}  Placeholder                     (TBD)

    REM Loop to place the cursor bottom left
    :cursorBottomLeft
    for /L %%i in (1,1,9) do (

        REM If variable "i" is <= the specified number (8), print echo.
        if %%i leq 9 (

            echo.
        )
    )
    echo                                          X/X = Number of menu options completed
    echo                    TBD = To Be Decided ^| TBC = To Be created ^| WIP = Work In Progress (aka [XX] complete)
    echo =------------------------------------------------------~ ======= ~----------------------------------------------------=

    choice /n /c 123456789
    endlocal
    goto menuChoice%errorlevel%

    :menuChoice1
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
            echo parachute triggered, moving to menu..
            goto Main

    :menuChoice2
        CLS
        echo menuChoice2
        pause
        goto Main

    :menuChoice3
        CLS
        echo menuChoice3
        pause
        goto Main

    :menuChoice4
        CLS
        echo menuChoice4
        pause
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