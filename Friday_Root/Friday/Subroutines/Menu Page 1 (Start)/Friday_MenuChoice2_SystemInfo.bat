:Start
    REM Turn off console log
    @echo off

    REM Clear console
    CLS

    REM Set window name to "Friday"
    title=Friday - System Info

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

    REM Set format disclaimer
    set "formatDisclaimer=Layout and or formatting may vary Machine to Machine due to the many different names on hardware"

:Main
    @echo off
    CLS
    setlocal enabledelayedexpansion


    REM Print menu options.
    echo =----------------------------------------------------~ { Friday } ~----------------------------------------------------=
    echo {Page1\SystemInfo\[Choose]
    echo.
    echo.
    echo                           Current Page               Show Information                  Status
    echo                          +------------+         +-----------------------+           +----------+
    echo                               1/9
    echo                                                     1 - All                             DONE
    echo                                                     2 - GPU                             DONE
    echo                                                     3 - CPU                             DONE
    echo.
    echo                                                     4 - Back                            DONE
    echo.
    echo                                                     5 - RAM                             DONE
    echo                                                     6 - Monitor                         DONE
    echo                                                     7 - MotherBoard                     DONE
    echo                                                     8 - Storage                         DONE
    echo.

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

    endlocal
    choice /n /c 12345678
    goto menuChoice%errorlevel%

REM Show Information - ALL
:menuChoice1
        setlocal
        CLS
        echo %formatDisclaimer%
        echo.

        echo +-----------------------------------------------------^| GPU Info ^|-----------------------------------------------------+
        REM GPU Information
        REM (Name, Driver version, Driver date, Refresh rate, Resolution)
        echo Loading...
        echo.
        for /f "delims=" %%i in ('powershell -command "Get-CimInstance -ClassName Win32_VideoController | Select-Object -ExpandProperty Name"') do set "gpuName=%%i"
        set "croppedGpuName=%gpuName%"

        powershell -command "Get-CimInstance -ClassName Win32_VideoController | Select-Object @{Name='  Name  '; Expression={('%croppedGpuName%').ToString().PadRight(27)}}, @{Name='  Driver Version  '; Expression={($_.DriverVersion -f '{0,^20}').ToString().PadRight(22)}}, @{Name='  Driver Date  '; Expression={($_.DriverDate.ToString('yyyy-MM-dd') -f '{0,^15}')}} | Format-Table -AutoSize"

        echo.
        echo +-----------------------------------------------------^| CPU Info ^|-----------------------------------------------------+
        REM CPU Information
        REM (Name, Driver version, Driver date, Refresh rate, Resolution)
        echo Loading..
        echo.

        REM Get the full CPU name & crop the last 5 characters
        for /f "delims=" %%i in ('powershell -command "Get-CimInstance -ClassName Win32_Processor | Select-Object -ExpandProperty Name"') do set "cpuName=%%i"
        set "croppedCpuName=%cpuName:~0,-10%"

        REM Use PowerShell to output CPU: Name, Nr# Cores, Nr# Threads, ClockSpeed, and Status in a table format
        powershell -command "Get-CimInstance -ClassName Win32_Processor | Select-Object @{Name='  Name  '; Expression={('%croppedCpuName%').ToString().PadRight(39)}}, @{Name='  Cores  '; Expression={'{0:N0}' -f ($_.NumberOfCores).ToString().PadRight(13)}}, @{Name='  Threads  '; Expression={'{0:N0}' -f ($_.NumberOfLogicalProcessors).ToString().PadRight(15)}}, @{Name='  ClockSpeed (GHz)  '; Expression={'{0:N2}' -f ($_.MaxClockSpeed / 1000).ToString().PadRight(24)}} , @{Name='  Status  '; Expression={($_.Status).ToString().PadRight(15)}} | Format-Table -AutoSize"

        echo.
        echo +-----------------------------------------------------^| RAM Info ^|-----------------------------------------------------+
        REM RAM Information
        REM (Name, Manufacturer, Capacity, Speed, Memory Type)
        echo Loading..
        echo.
        powershell -command "Get-CimInstance -ClassName Win32_PhysicalMemory | Select-Object @{Name='  Manufacturer  '; Expression={($_.Manufacturer).ToString().PadRight(20)}}, @{Name='  Capacity (GB)  '; Expression={'{0:N2}' -f ($_.Capacity / 1GB).ToString().PadRight(21)}}, @{Name='  Speed (MHz)  '; Expression={'{0:N0}' -f ($_.Speed).ToString().PadRight(19)}}, @{Name='  Memory Type(s)  '; Expression={if ($_.MemoryType -eq 0) {'Not supported'} elseif ($_.MemoryType -eq 11) {'DDR4'} elseif ($_.MemoryType -eq 12) {'DDR5'} else {'Unknown'}}}, @{Name='  Status  '; Expression={if ($_.Speed -ge 2133) {'OK'} else {'Low Speed'}}} | Format-Table -AutoSize"

        echo.
        echo +---------------------------------------------------^| Monitor Info ^|---------------------------------------------------+
        REM Monitor Information
        REM (Monitor Name, Manufacturer, Resolution, Refresh Rate, Status)
        echo Loading..
        echo.

        REM First table: Monitor Info (Monitor Name, Manufacturer, Resolution)
        powershell -command "Add-Type -AssemblyName 'System.Windows.Forms'; $screens = [System.Windows.Forms.Screen]::AllScreens; $monitors = Get-WmiObject -Class Win32_PnPEntity | Where-Object { $_.PNPClass -eq 'Monitor' }; $screens | ForEach-Object { $screen = $_; $monitor = $monitors | Where-Object { $_.DeviceID -like '*DISPLAY*' } | Select-Object -First 1; $monitorName = if ($monitor.FriendlyName) { $monitor.FriendlyName } elseif ($monitor.Name -and $monitor.Name -notlike '*DISPLAY*') { $monitor.Name } elseif ($monitor.DeviceID -and $monitor.DeviceID -notlike '*DISPLAY*') { $monitor.DeviceID } else { 'Unknown' }; $monitorManufacturer = (Get-WmiObject -Class Win32_PnPEntity | Where-Object { $_.DeviceID -eq $monitor.PNPDeviceID }).Manufacturer; $monitorResolution = \"$($screen.Bounds.Width) x $($screen.Bounds.Height)\"; [PSCustomObject]@{ '  Name  ' = ($monitorName.ToString()).PadRight(25); '  Manufacturer  ' = ($monitorManufacturer.ToString()).PadRight(20); '  Resolution  ' = ($monitorResolution.ToString()).PadRight(20) } } | Format-Table -AutoSize -Property '  Name  ', '  Manufacturer  ', '  Resolution  '"

        REM Second table: Video Controller Info (Refresh Rate, Status)
        powershell -command "$videoControllers = Get-WmiObject -Class Win32_VideoController; $monitors = Get-WmiObject -Class Win32_PnPEntity | Where-Object { $_.PNPClass -eq 'Monitor' }; $videoControllers | ForEach-Object { $videoController = $_; $monitors | Where-Object { $_.DeviceID -like '*DISPLAY*' } | ForEach-Object { $monitor = $_; $monitorName = if ($monitor.FriendlyName) { $monitor.FriendlyName } elseif ($monitor.Name -and $monitor.Name -notlike '*DISPLAY*') { $monitor.Name } elseif ($monitor.DeviceID -and $monitor.DeviceID -notlike '*DISPLAY*') { $monitor.DeviceID } else { 'Unknown' }; $currentRefreshRate = $videoController.CurrentRefreshRate; $status = $videoController.Status; if (-not $currentRefreshRate) { $currentRefreshRate = if ($videoController.VideoModeDescription -match '\d+x\d+\s*(\d+)\s*Hz') { $matches[1] } else { 'N/A' }; } [PSCustomObject]@{ '  Refresh Rate  ' = ($currentRefreshRate.ToString()).PadRight(20); '  Status  ' = ($status.ToString()).PadRight(20) } } } | Format-Table -Property @{Label='  Refresh Rate  ';Expression={$_.'  Refresh Rate  '.PadRight(20)}}"

        echo.
        echo +------------------------------------------------^| MotherBoard Info ^|-------------------------------------------------+
        REM Motherboard Information
        REM (Manufacturer, Model, Version)
        echo Loading..
        echo.
        powershell -command "Get-CimInstance -ClassName Win32_BaseBoard | Select-Object @{Name='  Manufacturer  '; Expression={($_.Manufacturer).ToString().PadRight(20)}}, @{Name='  Model  '; Expression={($_.Product).ToString().PadRight(13)}}, @{Name='  Version  '; Expression={($_.Version)}} | Format-Table -AutoSize"

        echo.
        echo +---------------------------------------------------^| Storage Info ^|---------------------------------------------------+
        REM Storage Information
        REM (DeviceID, Name, Size, Type)
        echo Loading..
        echo.
        powershell -command "Get-CimInstance -ClassName Win32_DiskDrive | Select-Object @{Name='  DeviceID  ';Expression={($_.DeviceID -replace '\\\\.\\PHYSICALDRIVE','DRIVE').ToString().PadRight(16)}}, @{Name='  Name  ';Expression={($_.Model.Substring(0, $_.Model.Length - 10).ToString().PadRight(24))}}, @{Name='  Size (GB)  ';Expression={([math]::round($_.Size / 1GB, 2)).ToString().PadRight(17)}}, @{Name='  Type  ';Expression={$_.MediaType.ToString().PadRight(25)}}, @{Name='  Status  ';Expression={$_.Status}} | Format-Table -AutoSize"

        echo [Press any key to continue...]
        pause >nul
        endlocal
        goto Main

REM Show Information - GPU
:menuChoice2
        setlocal
        CLS
        echo %formatDisclaimer%
        echo.

        echo +-----------------------------------------------------^| GPU Info ^|-----------------------------------------------------+
        REM GPU Information
        REM (Name, Driver version, Driver date, Refresh rate, Resolution)
        echo Loading...
        echo.
        for /f "delims=" %%i in ('powershell -command "Get-CimInstance -ClassName Win32_VideoController | Select-Object -ExpandProperty Name"') do set "gpuName=%%i"
        set "croppedGpuName=%gpuName%"

        powershell -command "Get-CimInstance -ClassName Win32_VideoController | Select-Object @{Name='  Name  '; Expression={('%croppedGpuName%').ToString().PadRight(27)}}, @{Name='  Driver Version  '; Expression={($_.DriverVersion -f '{0,^20}').ToString().PadRight(22)}}, @{Name='  Driver Date  '; Expression={($_.DriverDate.ToString('yyyy-MM-dd') -f '{0,^15}').ToString().PadRight(19)}}, @{Name='  Status  '; Expression={($_.Status).ToString().PadRight(20)}} | Format-Table -AutoSize"

        echo [Press any key to continue...]
        pause >nul
        endlocal
        goto Main

REM Show Information - CPU
:menuChoice3
        setlocal
        CLS
        echo %formatDisclaimer%
        echo.

        echo +-----------------------------------------------------^| CPU Info ^|-----------------------------------------------------+
        REM CPU Information
        REM (Name, Driver version, Driver date, Refresh rate, Resolution)
        echo Loading..
        echo.

        REM Get the full CPU name & crop the last 5 characters
        for /f "delims=" %%i in ('powershell -command "Get-CimInstance -ClassName Win32_Processor | Select-Object -ExpandProperty Name"') do set "cpuName=%%i"
        set "croppedCpuName=%cpuName:~0,-10%"

        REM Use PowerShell to output CPU: Name, Nr# Cores, Nr# Threads, ClockSpeed, and Status in a table format
        powershell -command "Get-CimInstance -ClassName Win32_Processor | Select-Object @{Name='  Name  '; Expression={('%croppedCpuName%').ToString().PadRight(39)}}, @{Name='  Cores  '; Expression={'{0:N0}' -f ($_.NumberOfCores).ToString().PadRight(13)}}, @{Name='  Threads  '; Expression={'{0:N0}' -f ($_.NumberOfLogicalProcessors).ToString().PadRight(15)}}, @{Name='  ClockSpeed (GHz)  '; Expression={'{0:N2}' -f ($_.MaxClockSpeed / 1000).ToString().PadRight(24)}} , @{Name='  Status  '; Expression={($_.Status).ToString().PadRight(15)}} | Format-Table -AutoSize"

        echo [Press any key to continue...]
        pause >nul
        endlocal
        goto Main

REM Show Information - Back
:menuChoice4
        CLS
        echo %fridayPromptMessage% Returning to Main
        timeout /t 2 >nul
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

        REM parachute
        goto Main

REM Show Information - RAM
:menuChoice5
        setlocal
        CLS
        echo %formatDisclaimer%
        echo.

        echo +-----------------------------------------------------^| RAM Info ^|-----------------------------------------------------+
        REM RAM Information
        REM (Name, Manufacturer, Capacity, Speed, Memory Type)
        echo Loading..
        echo.
        powershell -command "Get-CimInstance -ClassName Win32_PhysicalMemory | Select-Object @{Name='  Manufacturer  '; Expression={($_.Manufacturer).ToString().PadRight(20)}}, @{Name='  Capacity (GB)  '; Expression={'{0:N2}' -f ($_.Capacity / 1GB).ToString().PadRight(21)}}, @{Name='  Speed (MHz)  '; Expression={'{0:N0}' -f ($_.Speed).ToString().PadRight(19)}}, @{Name='  Memory Type(s)  '; Expression={if ($_.MemoryType -eq 0) {'Not supported'} elseif ($_.MemoryType -eq 11) {'DDR4'} elseif ($_.MemoryType -eq 12) {'DDR5'} else {'Unknown'}}}, @{Name='  Status  '; Expression={if ($_.Speed -ge 2133) {'OK'} else {'Low Speed'}}} | Format-Table -AutoSize"

        echo [Press any key to continue...]
        pause >nul
        endlocal
        goto Main

REM Show Information - Monitor
:menuChoice6
        setlocal
        CLS
        echo %formatDisclaimer%
        echo.

        echo +---------------------------------------------------^| Monitor Info ^|---------------------------------------------------+
        REM Monitor Information
        REM (Monitor Name, Manufacturer, Resolution, Refresh Rate, Status)
        echo Loading..
        echo.

        powershell -command "Add-Type -AssemblyName 'System.Windows.Forms'; $screens = [System.Windows.Forms.Screen]::AllScreens; $monitors = Get-WmiObject -Class Win32_PnPEntity | Where-Object { $_.PNPClass -eq 'Monitor' }; $screens | ForEach-Object { $screen = $_; $monitor = $monitors | Where-Object { $_.DeviceID -like '*DISPLAY*' } | Select-Object -First 1; $monitorName = if ($monitor.FriendlyName) { $monitor.FriendlyName } elseif ($monitor.Name -and $monitor.Name -notlike '*DISPLAY*') { $monitor.Name } elseif ($monitor.DeviceID -and $monitor.DeviceID -notlike '*DISPLAY*') { $monitor.DeviceID } else { 'Unknown' }; $monitorManufacturer = (Get-WmiObject -Class Win32_PnPEntity | Where-Object { $_.DeviceID -eq $monitor.PNPDeviceID }).Manufacturer; $monitorResolution = \"$($screen.Bounds.Width) x $($screen.Bounds.Height)\"; $monitorStatus = if ($monitor.Status -eq 'OK') { 'Active' } else { 'Inactive' }; [PSCustomObject]@{ '  Name  ' = ($monitorName.ToString()).PadRight(25); '  Manufacturer  ' = ($monitorManufacturer.ToString()).PadRight(20); '  Resolution  ' = ($monitorResolution.ToString()).PadRight(20); '  Status  ' = ($monitorStatus.ToString()).PadRight(20) } } | Format-Table -AutoSize -Property '  Name  ', '  Manufacturer  ', '  Resolution  ', '  Status  '"
        goto monitorInfoEnd

        rem REM First table: Monitor Info (Monitor Name, Manufacturer, Resolution)
        rem powershell -command "Add-Type -AssemblyName 'System.Windows.Forms'; $screens = [System.Windows.Forms.Screen]::AllScreens; $monitors = Get-WmiObject -Class Win32_PnPEntity | Where-Object { $_.PNPClass -eq 'Monitor' }; $screens | ForEach-Object { $screen = $_; $monitor = $monitors | Where-Object { $_.DeviceID -like '*DISPLAY*' } | Select-Object -First 1; $monitorName = if ($monitor.FriendlyName) { $monitor.FriendlyName } elseif ($monitor.Name -and $monitor.Name -notlike '*DISPLAY*') { $monitor.Name } elseif ($monitor.DeviceID -and $monitor.DeviceID -notlike '*DISPLAY*') { $monitor.DeviceID } else { 'Unknown' }; $monitorManufacturer = (Get-WmiObject -Class Win32_PnPEntity | Where-Object { $_.DeviceID -eq $monitor.PNPDeviceID }).Manufacturer; $monitorResolution = \"$($screen.Bounds.Width) x $($screen.Bounds.Height)\"; [PSCustomObject]@{ '  Name  ' = ($monitorName.ToString()).PadRight(25); '  Manufacturer  ' = ($monitorManufacturer.ToString()).PadRight(20); '  Resolution  ' = ($monitorResolution.ToString()).PadRight(20) } } | Format-Table -AutoSize -Property '  Name  ', '  Manufacturer  ', '  Resolution  '"
        rem
        rem REM Second table: Video Controller Info (Refresh Rate, Status)
        rem powershell -command "$videoControllers = Get-WmiObject -Class Win32_VideoController; $monitors = Get-WmiObject -Class Win32_PnPEntity | Where-Object { $_.PNPClass -eq 'Monitor' }; $videoControllers | ForEach-Object { $videoController = $_; $monitors | Where-Object { $_.DeviceID -like '*DISPLAY*' } | ForEach-Object { $monitor = $_; $monitorName = if ($monitor.FriendlyName) { $monitor.FriendlyName } elseif ($monitor.Name -and $monitor.Name -notlike '*DISPLAY*') { $monitor.Name } elseif ($monitor.DeviceID -and $monitor.DeviceID -notlike '*DISPLAY*') { $monitor.DeviceID } else { 'Unknown' }; $currentRefreshRate = $videoController.CurrentRefreshRate; $status = $videoController.Status; if (-not $currentRefreshRate) { $currentRefreshRate = if ($videoController.VideoModeDescription -match '\d+x\d+\s*(\d+)\s*Hz') { $matches[1] } else { 'N/A' }; } [PSCustomObject]@{ '  Refresh Rate  ' = ($currentRefreshRate.ToString()).PadRight(20); '  Status  ' = ($status.ToString()).PadRight(20) } } } | Format-Table -Property @{Label='  Refresh Rate  ';Expression={$_.'  Refresh Rate  '.PadRight(20)}}, @{Label='  Status  ';Expression={$_.'  Status  '.PadRight(20)}}"

        :monitorInfoEnd
        echo [Press any key to continue...]
        pause >nul
        endlocal
        goto Main

REM Show Information - MotherBoard
:menuChoice7
        setlocal
        CLS
        echo %formatDisclaimer%
        echo.

        echo +------------------------------------------------^| MotherBoard Info ^|-------------------------------------------------+
        REM Motherboard Information
        REM (Manufacturer, Model, Version)
        echo Loading..
        echo.
        powershell -command "Get-CimInstance -ClassName Win32_BaseBoard | Select-Object @{Name='  Manufacturer  '; Expression={($_.Manufacturer).ToString().PadRight(20)}}, @{Name='  Model  '; Expression={($_.Product).ToString().PadRight(13)}}, @{Name='  Version  '; Expression={($_.Version)}} | Format-Table -AutoSize"

        echo [Press any key to continue...]
        pause >nul
        goto Main

REM Show Information - Storage
:menuChoice8
        setlocal
        CLS
        echo %formatDisclaimer%
        echo.

        echo +---------------------------------------------------^| Storage Info ^|---------------------------------------------------+
        REM Storage Information
        REM (DeviceID, Name, Size, Type)
        echo Loading..
        echo.
        powershell -command "Get-CimInstance -ClassName Win32_DiskDrive | Select-Object @{Name='  DeviceID  ';Expression={($_.DeviceID -replace '\\\\.\\PHYSICALDRIVE','DRIVE').ToString().PadRight(16)}}, @{Name='  Name  ';Expression={($_.Model.Substring(0, $_.Model.Length - 10).ToString().PadRight(24))}}, @{Name='  Size (GB)  ';Expression={([math]::round($_.Size / 1GB, 2)).ToString().PadRight(17)}}, @{Name='  Type  ';Expression={$_.MediaType.ToString().PadRight(25)}}, @{Name='  Status  ';Expression={$_.Status}} | Format-Table -AutoSize"

        echo [Press any key to continue...]
        pause >nul
        goto Main

