@ECHO off
::SET THE DATE VARIABLES BASED ON %date% RESULT
::----------------------------------------------------------------
SET "day=%date:~-7,2%"
SET "year=%date:~-4%"
SET "month_num=%date:~-10,2%"
IF %month_num%==01 SET monthname=January
IF %month_num%==02 SET monthname=February
IF %month_num%==03 SET monthname=March
IF %month_num%==04 SET monthname=April
IF %month_num%==05 SET monthname=May
IF %month_num%==06 SET monthname=June
IF %month_num%==07 SET monthname=July
IF %month_num%==08 SET monthname=August
IF %month_num%==09 SET monthname=September
IF %month_num%==10 SET monthname=October
IF %month_num%==11 SET monthname=November
IF %month_num%==12 SET monthname=December
SET "filename=%day%_%monthname%_%year%.txt"
::----------------------------------------------------------------

IF exist %filename% GOTO fileexists
GOTO makefile

:fileexists
ECHO.
ECHO ****************************
ECHO.					
ECHO  ALERT: Log file from %monthname% %day% already exists.
ECHO  Proceed to build environment
ECHO.							
ECHO ****************************
   SET /p answer=Type "confirm" to overwrite, anything else to cancel: 
   IF /i %answer% EQU confirm GOTO overwrite
   IF /i %answer% NEQ confirm GOTO cancel

:overwrite
GOTO makefile

:cancel
GOTO end

:makefile
SET START=0
SET end=6
@ECHO off >%day%_%monthname%_%year%.txt

:loop
IF %START%==%end% GOTO stop 
::START LOOP DATA
ECHO studentname >>%day%_%monthname%_%year%.txt
ECHO. >>%day%_%monthname%_%year%.txt
ECHO MO: >> %day%_%monthname%_%year%.txt
ECHO. >>%day%_%monthname%_%year%.txt
ECHO {desk} >> %day%_%monthname%_%year%.txt
ECHO. >>%day%_%monthname%_%year%.txt
ECHO Defcon: >> %day%_%monthname%_%year%.txt
ECHO. >>%day%_%monthname%_%year%.txt
ECHO ----------------- >> %day%_%monthname%_%year%.txt
ECHO. >> %day%_%monthname%_%year%.txt
::END LOOP DATA
SET /a START=%START%+1 
GOTO loop
:stop
START chrome.exe https://www.appointment-plus.com/login.php
START chrome.exe http://www.gmail.com
"C:\Program Files\Notepad++\notepad++" C:\Users\Vic\Desktop\STUDY_HUT\Notes.txt %filename%

:end
ECHO (Made it to the end)