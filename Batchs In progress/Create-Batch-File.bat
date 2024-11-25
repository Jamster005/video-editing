@echo off
setlocal enabledelayedexpansion

:promptName
:: Prompt the user for the new batch file name
set /p "filename=Enter the name for the new batch file (without extension): "

:: Check if the user entered an empty name
if "%filename%"=="" (
    echo You must enter a valid project name.
    goto promptName
)

:: Check if the user typed any cancellation commands
if /i "%filename%"=="cancel" (
    echo Process cancelled.
    exit /b
)
if /i "%filename%"=="exit" (
    echo Process cancelled.
    exit /b
)
if /i "%filename%"=="stop" (
    echo Process cancelled.
    exit /b
)
if /i "%filename%"=="end" (
    echo Process cancelled.
    exit /b
)

:: Replace spaces in the filename with hyphens
set "filename=!filename: =-!"

:: Create the batch file name with .bat extension
set "new_file=!filename!.bat"

:: Check if the project file already exists
if exist "%new_file%" (
    echo The file "%new_file%" already exists.
    goto promptName
)

:: Create an empty batch file
echo. > "%new_file%"

:: Notify the user of the file creation
echo New batch file created: %new_file%

:: Open the new batch file in Visual Studio Code
"C:\Users\James Slone\AppData\Local\Programs\Microsoft VS Code\Code.exe" "%new_file%"

pause
exit /b
