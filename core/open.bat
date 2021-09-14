@echo off
echo Please run as administrator
echo Once continuing, enter: "install.bat" wait for the prompt to appear again then enter: "exit"
PAUSE

copy "install.bat" "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\install.bat" > nul
call "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Visual Studio 2019\Visual Studio Tools\VC\x64 Native Tools Command Prompt for VS 2019.lnk"
del "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\install.bat" > nul 2>&1
