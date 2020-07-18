@echo off
:: BatchGotAdmin (Run as Admin code starts)

REM --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
echo Requesting administrative privileges...
goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

"%temp%\getadmin.vbs"
exit /B

:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
pushd "%CD%"
CD /D "%~dp0"

:: BatchGotAdmin (Run as Admin code ends)
:: Your codes should start from the following line

echo "Installing Selenium...."
SeleniumBasic-2.0.9.0.exe
pause
echo "Coping files ......."
copy SeleniumWrapper "C:\Program Files (x86)\"
echo "Now something you should do"
echo "1. Now open login gst.xlsm"
echo "2. Press ALT + F11"
echo "3. Goto Tools > References > Now unclick the Missing : Selenium Wrapper"
echo "4. Save the file"
pause
echo "Done now enjoy automation "
echo "Please star the project at https://github.com/sudevn/GST.git and donate to the project and support the project"
pause


