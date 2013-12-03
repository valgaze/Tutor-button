@echo off
::SET THE DATE VARIABLES BASED ON %date% RESULT
::----------------------------------------------------------------
set "day=%date:~-7,2%"
set "year=%date:~-4%"
set "month_num=%date:~-10,2%"
if %month_num%==01 set monthname=January
if %month_num%==02 set monthname=February
if %month_num%==03 set monthname=March
if %month_num%==04 set monthname=April
if %month_num%==05 set monthname=May
if %month_num%==06 set monthname=June
if %month_num%==07 set monthname=July
if %month_num%==08 set monthname=August
if %month_num%==09 set monthname=September
if %month_num%==10 set monthname=October
if %month_num%==11 set monthname=November
if %month_num%==12 set monthname=December
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


start chrome.exe https://www.appointment-plus.com/login.php
start chrome.exe http://www.gmail.com
"C:\Program Files\Notepad++\notepad++" C:\Users\Vic\Desktop\STUDY_HUT\Notes.txt %filename%

:end
echo (Made it to the end)




