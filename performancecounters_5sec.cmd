@echo off
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"

set "datestamp=%YYYY%%MM%%DD%" & set "timestamp=%HH%%Min%%Sec%"
set "fullstamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"
set logs=.\
set "blgstamp=%logs%%computername%_%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%.blg"


if "%1"=="" set config=performancecounters.cfg
if not "%1"=="" set config=%1

echo Performance log in %blgstamp% 
echo Typeperf started with %config%

typeperf -cf %config% -f BIN -o %blgstamp% -si 00:00:05
