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

    REM Prompt User
    echo %fridayPromptMessage% "Loading.."

    REM Variable for current version of Friday
        set fridayVersion=v0.3596

    REM Declare Friday folder location
        set "fridayRootFolder=Friday_Root"
        set "documentsPath=%USERPROFILE%\Documents"
        set "fridayRootLocation=%documentsPath%\%fridayRootFolder%"
        set "fridayMain=%fridayRootFolder%\Friday.bat"

    REM Declare Friday "Mainroutines"
        REM Location
        set "fridayMainroutinesLocation=%fridayRootLocation%\Friday\Friday Mainroutines"

        REM Main MenuChoice1 [Communication]
        set "fridayMainMenuChoice1=%fridayMainroutinesLocation%\Friday_MenuChoice1_Communication.bat"

        REM Main MenuChoice2 [System Info]
        set "fridayMainMenuChoice2=%fridayMainroutinesLocation%\Friday_MenuChoice2_SystemInfo.bat"

        REM Main MenuChoice3 [Repeat This] (WIP)
        set "fridayMainMenuChoice2=%fridayMainroutinesLocation%\Friday_MenuChoice3_RepeatThis.bat"

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
        REM Messages
        set "fridayMessagesFolder=Friday Messages"
        set "fridayMessagesLocation=%fridayRootLocation%\%fridayMessagesFolder%"

        REM Alarms
        set "fridayAlarmsFolder=Friday Alarms"
        set "fridayAlarmsFolderLocation=%fridayRootLocation%\%fridayAlarmsFolder%"

        REM Reflect
        set "fridayReflectFolder=Friday Reflect"
        set "fridayReflectFolderLocation=%fridayRootLocation%\%fridayReflectFolder%"

        REM Games
        set "fridayGamesFolder=Friday Games"
        set "fridayGamesFolderLocation=%fridayRootLocation%\%fridayGamesFolder%"


    REM Array of Directories
    set folderCheck[1]=%fridayRootLocation%
    set folderCheck[2]=%fridayMessagesLocation%
    set folderCheck[3]=%fridayAlarmsFolderLocation%
    set folderCheck[4]=%fridayReflectFolderLocation%
    set folderCheck[5]=%fridayGamesFolderLocation%

    setlocal enabledelayedexpansion

    REM Loop through the array and check if each folder exists
    for /L %%i in (1, 1, 5) do (
        REM Get the folder path from the array
        set folderPath=!folderCheck[%%i]!

        REM Check if the folder exists
        if not exist "!folderPath!" (

            echo Folder !folderPath! does not exist. Creating...
            mkdir "!folderPath!"

        ) else (

            echo Folder !folderPath! already exists.

        )
    )

    :continueMain
    endlocal
    goto Main


REM Menu Choice9 [TestSite] ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:Main
    goto testSiteStart
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

    :testSiteStart
    @echo off
    CLS
    Color 0E
        setlocal

            echo {Main\TestSite\[Tests]
            echo.
            echo.
            echo                                                     Test(s)                 Status
            echo                                            +-----------------------+   +---------------+
            echo                                (Example):    1 - Folder Management.        [Sample]
            echo                                              2 - Empty.                      N/A
            echo                                              3 - Empty.                      N/A
            echo.
            echo                                              4 - Back.
            echo.
            echo                                              5 - Empty.                      N/A
            echo                                              6 - Empty.                      N/A
            echo                                              7 - Empty.                      N/A
            echo                                              8 - Empty.                      N/A
            echo                                              9 - Empty.                      N/A
            echo.
            echo.
            echo.
            echo.
            echo                                        This space can be used to test your own scripts.
            echo                 You can do this by editing the file called "TestSite.bat" (Friday_Root\Friday\Subroutines\Menu Page 3).

            REM Prompt choice from user.
            choice /n /c 123456789

        REM Go to section specified by user.
        endlocal
            goto Test%errorlevel%Start

    REM -- TEMP FOLDER & FILE TEST --
    :Test1Start
        CLS
        setlocal enabledelayedexpansion

        :TestTempFolderFile
            CLS
            echo {Main\TestSite\Test_1\[Enter]
            echo.

            echo This is a sample of how a test could look like.
            echo This particular test will create a temporary folder on the desktop with a .txt file inside.
            echo Which contains a line of sample text.
            echo.
            echo Continue?
            echo 1 - Yes
            echo 2 - No

            choice /n /c 12
            goto Test%errorlevel%Confirmation

            :Test2Confirmation
            CLS
            echo Returning to menu..
            timeout /t 2 >nul
            goto TestSiteStart


            :Test1Confirmation

            REM Define the folder name and file name
            set folderName=FridayTempFolder
            set fileName=FridayTempFile.txt

            REM Create the new folder on the Desktop
            mkdir "%USERPROFILE%\Desktop\%folderName%"

            REM Write text to the new file in the created folder
            echo "This is some sample text for the new textfile in the FridayTempFile." > "%USERPROFILE%\Desktop\%folderName%\%fileName%"

            REM Notify the user
            echo %fridayPromptMessage% "Desktop Temp Folder- and file created successfully!"
            goto TestDelTempFolderStart


        :TestDelTempFolderStart
            CLS
            echo {Main\TestSite\Test_1\Enter\[Delete]
            echo.

            echo %fridayPromptMessage% "Delete folder 'FridayTempFolder'?"
            echo.
            echo Choose:
            echo 1 - Yes.
            echo 2 - No.
            echo.

            choice /n /c 12
            goto DelTempFolderResult%errorlevel%

            :DelTempFolderResult1
                CLS

                echo %fridayPromptMessage% "Are you sure you want to delete this folder?"
                echo.
                echo Choose:
                echo 1 - Yes.
                echo 2 - No.

                choice /n /c 12
                goto DelTempFolderConfirmiation%errorlevel%

                :DelTempFolderConfirmiation1
                    CLS
                    rd /q /s "%USERPROFILE%\Desktop\%folderName%"
                    echo %fridayPromptMessage% "Folder 'FridayTempFolder' deleted successfully."
                    pause
                    goto TestSiteStart

                :DelTempFolderConfirmiation2
                    CLS
                    echo %fridayPromptMessage% "Folder deletion aborted."
                    pause
                    goto TestDelTempFolderStart

            :DelTempFolderResult2
                CLS
                echo %fridayPromptMessage% "Folder deletion aborted."
                echo %fridayPromptMessage% "Moving to test menu."
                timeout /t 2 >nul
                goto testSiteStart

    REM Empty test.
    :Test2Start
        CLS
        setlocal enabledelayedexpansion
        echo {Main\TestSite\Test_2\[Potential_Test]
        echo.

        echo.
        echo Choice 2, Test 2
        echo Test is empty.

        echo [Press any key to return...]
        pause >nul
        endlocal
        goto testSiteStart

    REM Empty test.
    :Test3Start
        CLS
        setlocal enabledelayedexpansion
        echo {Main\TestSite\Test_3\[Potential_Test]
        echo.

        echo.
        echo Choice 3, Test 3
        echo Test is empty.

        echo [Press any key to return...]
        pause >nul
        endlocal
        goto testSiteStart

    REM Back to Menu.
    :Test4Start
        color 07
        CLS
        setlocal enabledelayedexpansion

        REM Search directory
        set "searchDir=%fridaySubroutinesLocation%\Menu Page 3"

        REM Target file
        set "fileName=Friday_Page3_Menu.bat"

        REM Recursively find the targeted file and call it.
        for /f "delims=" %%f in ('dir "%searchDir%\%fileName%" /s /b 2^>nul') do (

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
        goto Test4Start

    REM Empty test.
    :Test5Start
        CLS
        setlocal enabledelayedexpansion
        echo {Main\TestSite\Test_5\[Potential_Test]
        echo.

        echo.
        echo Choice 5, Test 5
        echo Test is empty.

        echo [Press any key to return...]
        pause >nul
        endlocal
        goto testSiteStart

    REM Empty test.
    :Test6Start
        CLS
        setlocal enabledelayedexpansion
        echo {Main\TestSite\Test_6\[Potential_Test
        echo.

        echo.
        echo Choice 6, Test 6
        echo Test is empty.

        echo [Press any key to return...]
        pause >nul
        endlocal
        goto testSiteStart

    REM Empty test.
    :Test7Start
        CLS
        setlocal enabledelayedexpansion
        echo {Main\TestSite\Test_7\[Potential_Test]
        echo.

        echo.
        echo Choice 7, Test 7
        echo Test is empty.

        echo [Press any key to return...]
        pause >nul
        endlocal
        goto testSiteStart

    REM Empty test.
    :Test8Start
        CLS
        setlocal enabledelayedexpansion
        echo {Main\TestSite\Test_8\[Potential_Test]
        echo.

        echo.
        echo Choice 8, Test 8
        echo Test is empty.

        echo [Press any key to return...]
        pause >nul
        endlocal
        goto testSiteStart

    REM Empty test.
    :Test9Start
        CLS
        setlocal enabledelayedexpansion
        echo {Main\TestSite\Test_9\[Potential_Test]
        echo.

        echo.
        echo Choice 9, Test 9
        echo Test is empty.

        echo [Press any key to return...]
        pause >nul
        endlocal
        goto testSiteStart

    REM TestSite parachute.
    endlocal
    echo.
    echo ERROR: "TestSite" parachute triggered.
    echo The very end of "testsite" reached.
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
