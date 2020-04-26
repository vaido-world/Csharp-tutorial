@ECHO OFF

::Preseve Blank lines in For Loop https://stackoverflow.com/a/8812434
:: For loop or find.exe might corrupt the output, this program is only for teaching and expected to have inaccuracy.
SET "debug_output=%RANDOM%"


FOR /F "delims=" %%A IN ('C:\Windows\Microsoft.NET\Framework\v4.0.30319\csc.exe ""test.cs"" -r:""%~DP0WebDriver.dll"" -r:""%~DP0phantomjs.exe"" ^| find /n /v ""') DO (

  set "ln=%%A"
  setlocal enableDelayedExpansion
  set "ln=!ln:*]=!"
  echo(!ln!
  echo(!ln! >> %debug_output%.txt
  endlocal
)
TIMEOUT 15