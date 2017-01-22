:: Set Variables Here
set CUR_DIR=%cd%
set ATOM_DIR=%USERPROFILE%\lib\atom
set BIN_DIR=%USERPROFILE%\bin


:: Prerequisites
:: - node v4.4+ and npm
:: - python v2.7+
:: - Visual C++ Build Tools ('2015')
::
:: Reference
:: https://github.com/atom/atom/blob/master/docs/build-instructions/windows.md


:: Build atom.exe
git clone https://github.com/atom/atom.git %ATOM_DIR%
cd %ATOM_DIR%
.\script\build.cmd


:: Add batch file to bin directory
if not exist %BIN_DIR% (
    mkdir %BIN_DIR%
)

cp %CUR_DIR%\atom.bat %BIN_DIR%\atom.bat
