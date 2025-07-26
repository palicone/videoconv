@echo off

set THIS_FOLDER=%~dp0

CD %THIS_FOLDER%

SET PATH=^
%THIS_FOLDER%\ffmpeg\bin\;^
%PATH%
  :: Existing %PATH% at the end because it might contain %userprofile%\AppData\Local\Microsoft\WindowsApps with some executable shortcuts to the app store, e.g. python.exe

cmd /k
