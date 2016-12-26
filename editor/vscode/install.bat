:: Set Variables Here
set CUR_DIR=%cd%
set VSCODE_DIR=%USERPROFILE%\lib\vscode
set BIN_DIR=%USERPROFILE%\bin


:: Prerequisites (node, python, typescript)
:: Refer to the following url for more assistance
:: https://github.com/Microsoft/vscode/wiki/How-to-Contribute#build-and-run-from-source
::
:: install node + npm here
:: install python v2.7 and set PYTHON env var to the python executable
:: install a C/C++ compiler tool chain (ex. Visual Studio v2013+)
npm install -g typescript


:: Install VSCode in ~\lib\vscode
git clone https://github.com/Microsoft/vscode %VSCODE_DIR%
cd %VSCODE_DIR%
.\scripts\npm.bat install


:: Add batch file to bin directory
if not exist %BIN_DIR% (
    mkdir %BIN_DIR%
)

cp %CUR_DIR%\vscode.bat %BIN_DIR%\vscode.bat
