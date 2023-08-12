!include "x64.nsh"
!include "LogicLib.nsh"

Name PythonInstaller
OutFile PythonInstaller.exe

XPStyle on
RequestExecutionLevel admin
ShowInstDetails show



Section "Install Python 2.7.6"
    InitPluginsDir
    IfFileExists C:\python27\python.exe WeAreGood WeAreBad
    WeAreGood:
        DetailPrint "Already Installed: Skipping Python..."
        Goto Finished
    WeAreBad:
      ${If} ${RunningX64}
          NSISdl::download "http://legacy.python.org/ftp/python/2.7.6/python-2.7.6.amd64.msi" $PLUGINSDIR\python.msi
      ${Else}
          NSISdl::download "http://legacy.python.org/ftp/python/2.7.6/python-2.7.6.msi" $PLUGINSDIR\python.msi
      ${EndIf}
      DetailPrint "Installing Python"
      nsExec::ExecToLog 'msiexec /i "$PLUGINSDIR\python.msi" /passive /quiet /norestart TARGETDIR=C:\Python27'
      Pop $0
      ${If} $0 != 0
          MessageBox MB_OK "Failed to install Python: $0"
      ${EndIf}
    Finished:
SectionEnd

Section "Install WxPython3.0"
    InitPluginsDir
    IfFileExists C:\Python27\Lib\site-packages\wx-3.0-msw\wx\__init__.py WeAreGood WeAreBad
    WeAreGood:
        DetailPrint "Already Installed: Skipping WxPython..."
        Goto Finished
    WeAreBad:
      ${If} ${RunningX64}
          NSISdl::download "https://sourceforge.net/projects/wxpython/files/wxPython/3.0.0.0/wxPython3.0-win64-3.0.0.0-py27.exe/download"
      ${Else}
          NSISdl::download "https://sourceforge.net/projects/wxpython/files/wxPython/3.0.0.0/wxPython3.0-win32-3.0.0.0-py27.exe/download"

Section "Install Python Packages"
    DetailPrint "Installing Python Packages"
    nsExec::ExecToLog 'C:\Python27\Scripts\pip.exe install -r requirements.txt'