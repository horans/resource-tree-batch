:: resourse tree v4
@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
:: config
SET loc=c:\Users\horan\Documents\res\
SET zip=c:\Program Files\7-Zip\7z.exe
:: loop
FOR /D %%s IN (*) DO (
  :: get name
  SET res=%%s
  ECHO Resource Tree: !res!
  :: delete old
  DEL res-!res!-*.txt >nul 2>nul
  DEL %loc%res-!res!-*.txt >nul 2>nul
  :: create new
  TREE %~d0\!res! > res-!res!-%DATE:~2,2%%DATE:~5,2%%DATE:~8,2%.txt 2>nul
  COPY res-!res!-*.txt %loc% >nul 2>nul
  :: compress
  "%zip%" a %loc%res-list.7z res-!res!-*.txt >nul 2>nul
)
