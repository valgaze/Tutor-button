@echo off
:: HERE WE SET THE DATE VARIABLES based on the global %date% result
::----------------------------------------------------------------
set "day=%date:~-7,2%"
set "year=%date:~-4%"
set "monthnum=%date:~-10,2%"
set "monthname=November"
set "filename=%day%_%monthname%_%year%.txt"
::----------------------------------------------------------------

if exist %filename% GOTO fileexists
GOTO makefile

:fileexists
echo.
echo ****************************
echo.					
echo  ALERT: Log file from %monthname% %day% already exists.
echo  Proceed to build environment
echo.							
echo ****************************
   set /p answer=Type "confirm" to overwrite, anything else to cancel: 
   if /i %answer% EQU confirm GOTO overwrite
   if /i %answer% NEQ confirm GOTO cancel
 
 

:overwrite
::echo You typed confirm, we will now make a new file!
GOTO makefile

:cancel
::echo You said no, so we'll do nothing
GOTO end


:makefile
set start=0
set end=6
@echo off >%day%_%monthname%_%year%.txt

:loop
if %start%==%end% goto stop 
::START LOOP DATA
echo studentname >>%day%_%monthname%_%year%.txt
echo. >>%day%_%monthname%_%year%.txt
echo MO: >> %day%_%monthname%_%year%.txt
echo. >>%day%_%monthname%_%year%.txt
echo {desk} >> %day%_%monthname%_%year%.txt
echo. >>%day%_%monthname%_%year%.txt
echo Defcon: >> %day%_%monthname%_%year%.txt
echo. >>%day%_%monthname%_%year%.txt
echo ----------------- >> %day%_%monthname%_%year%.txt
echo. >> %day%_%monthname%_%year%.txt
::END LOOP DATA
set /a start=%start%+1 
goto loop 
:stop 


start chrome.exe http://tinyurl.com/studyhoot
start chrome.exe http://www.gmail.com
"C:\Program Files\Notepad++\notepad++" C:\Users\Vic\Desktop\STUDY_HUT\Notes.txt %filename%


REM cscript "C:\Users\Vic\Desktop\STUDY_HUT\tiler.vbs"

:end
echo (Made it to the end)




