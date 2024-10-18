
;NSIS Modern User Interface
;Welcome/Finish Page Example Script
;Written by Joost Verburg

;--------------------------------
;Include Modern UI

!define MUI_ICON "logo.ico"
  !include "MUI2.nsh"

;--------------------------------
;General

  !include "x64.nsh"
  !include "LogicLib.nsh"
  !include "nsDialogs.nsh"

  ;Name and file
  Name "VeaPLC"
  OutFile "VeaPLCSetup.exe"

  ;Default installation folder
  InstallDir "$PROFILE\VeaPLC"

  ;Get installation folder from registry if available
  InstallDirRegKey HKCU "Software\VeaPLC" ""

  ;Request application privileges for Windows Vista
  RequestExecutionLevel admin
  ;Details shown in the installer
  ; ShowInstDetails show
  

;--------------------------------
;Interface Settings

  !define MUI_ABORTWARNING

;--------------------------------
;Pages

  !insertmacro MUI_PAGE_WELCOME
  !insertmacro MUI_PAGE_LICENSE "LICENSE.txt"
  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_STARTMENU "VeaPLC" $INSTDIR
  ; !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES
  ; Define finish page checkbox
  !define MUI_FINISHPAGE_SHOWREADME
  !define MUI_FINISHPAGE_SHOWREADME_TEXT "Create Desktop Shortcut"
  !define MUI_FINISHPAGE_SHOWREADME_FUNCTION CreateDesktopShortCut
  !define MUI_FINISHPAGE_SHOWREADME_NOTCHECKED
 
  !define MUI_FINISHPAGE_LINK "vea.it"
  !define MUI_FINISHPAGE_LINK_LOCATION "http://vea.it"
  
  !insertmacro MUI_PAGE_FINISH
  

  !insertmacro MUI_UNPAGE_WELCOME
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES
  !insertmacro MUI_UNPAGE_FINISH

;--------------------------------
;Languages

  !insertmacro MUI_LANGUAGE "English"

;--------------------------------
;Installer Sections

Section "VeaPLC" SecDummy

  SetOutPath "$PROFILE\VeaPLC"

  ;ADD YOUR OWN FILES HERE...
    Call "Include Temp File"
    Call "Include Temp Folder"
    Call "Include Application files"
    Call "Install Python 2.7.6"
    Call "Install WxPython3.0"
    Call "Install Python Packages"
    Call "Driver Install"
    Call "Add environmet variables"

  ;Store installation folder
  WriteRegStr HKCU "Software\VeaPLC" "" $PROFILE\VeaPLC

  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\VeaPLC" \
                 "DisplayName" "VeaPLC"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\VeaPLC" \
                  "DisplayIcon" "$PROFILE\VeaPLC\editor\images\logo.ico"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\VeaPLC" \
                  "UninstallString" "$\"$PROFILE\VeaPLC\Uninstall.exe$\""
  
  ;Create uninstaller
  WriteUninstaller "$PROFILE\VeaPLC\Uninstall.exe"
  
  CreateDirectory "$SMPROGRAMS\VeaPLC"
  CreateShortCut "$SMPROGRAMS\VeaPLC\VeaPLC.lnk" "$PROFILE\VeaPLC\VeaPLC.bat" "" "$PROFILE\VeaPLC\VeaPLC.bat" 0

SectionEnd

Function "CreateDesktopShortCut"
    CreateShortCut "$DESKTOP\VeaPLC.lnk" "$PROFILE\VeaPLC\VeaPLC.bat"  "$PROFILE\VeaPLC\VeaPLC.bat" "$PROFILE\VeaPLC\editor\images\logo.ico" 0 
FunctionEnd

;--------------------------------
;Descriptions

  ;Language strings
  LangString DESC_SecDummy ${LANG_ENGLISH} "Vea PLC programmer in LADDER."

  ;Assign language strings to sections
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
    !insertmacro MUI_DESCRIPTION_TEXT ${SecDummy} $(DESC_SecDummy)
  !insertmacro MUI_FUNCTION_DESCRIPTION_END

;--------------------------------
;Uninstaller Section

Section "Uninstall"
  Delete "$SMPROGRAMS\VeaPLC\VeaPLC.lnk" 
  RMDir "$SMPROGRAMS\VeaPLC"
  Delete "$DESKTOP\VeaPLC.lnk"
  Delete "$SMPROGRAMS\VeaPLC\VeaPLC.lnk"
  ; Delete "$PROFILE\VeaPLC\${PRODUCT_NAME}.lnk"
  RMDir "$SMPROGRAMS\VeaPLC"
  Delete "$PROFILE\VeaPLC\*.*"
  Delete "$PROFILE\VeaPLC\Uninstall.exe"
  SetOutPath "$PROGRAMFILES"
  RMDir /r /REBOOTOK "$PROFILE\VeaPLC"
  
  DeleteRegKey /ifempty HKCU "Software\VeaPLC"
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\VeaPLC"
  ; Set to HKLM
  EnVar::SetHKLM
  ; Delete the values from PATH variable
  EnVar::DeleteValue "PATH" "$PROFILE\VeaPLC\lib\GnuWin32\bin"
  Pop $0
  DetailPrint "EnVar::DeleteValue returned=|$0|"
  EnVar::DeleteValue "PATH" "$PROFILE\VeaPLC\lib\MingW64\bin"
  Pop $0
  DetailPrint "EnVar::DeleteValue returned=|$0|"
  EnVar::DeleteValue "PATH" "$PROFILE\VeaPLC\editor\arduino\bin"
  Pop $0
  DetailPrint "EnVar::DeleteValue returned=|$0|"
  Pop $0
  DetailPrint "EnVar::DeleteValue returned=|$0|"

SectionEnd


Function "Remove environment variables"
  ; Set to HKLM
  EnVar::SetHKLM
  ; Delete the values from PATH variable
  EnVar::DeleteValue "PATH" "$PROFILE\VeaPLC\lib\GnuWin32\bin"
  Pop $0
  DetailPrint "EnVar::DeleteValue returned=|$0|"
  EnVar::DeleteValue "PATH" "$PROFILE\VeaPLC\lib\MingW64\bin"
  Pop $0
  DetailPrint "EnVar::DeleteValue returned=|$0|"
  EnVar::DeleteValue "PATH" "$PROFILE\VeaPLC\editor\arduino\bin"
  Pop $0
  DetailPrint "EnVar::DeleteValue returned=|$0|"
  Pop $0
  DetailPrint "EnVar::DeleteValue returned=|$0|"
FunctionEnd



Function "Include Temp File"
    InitPluginsDir
    SetOutPath "$PLUGINSDIR"
    File "python-2.7.18.amd64.msi"
    File "python-2.7.6.msi"
    File "wxPython3.0-win32-3.0.0.0-py27.exe"
    File "wxPython3.0-win64-3.0.0.0-py27.exe"
    File "requirements.txt"
FunctionEnd


Function "Include Temp Folder"
    InitPluginsDir
    SetOutPath "$PLUGINSDIR\Driver"
    File /r "Driver\*.*"
FunctionEnd

Function "Include Application files"
    SetOutPath "$PROFILE\VeaPLC"
    File /r "..\APP\*.*"
FunctionEnd

Function "Install Python 2.7.6"
    InitPluginsDir
    IfFileExists C:\python27\python.exe WeAreGood WeAreBad
    WeAreGood:
        DetailPrint "Already Installed: Skipping Python..."
        Goto Finished
    WeAreBad:
      DetailPrint "Installing Python"

      nsExec::ExecToLog 'msiexec /i "$PLUGINSDIR\python-2.7.18.amd64.msi" /passive /quiet /norestart TARGETDIR=C:\Python27'
      
      
      Pop $0
      ${If} $0 != 0
          MessageBox MB_OK "Failed to install Python: $0"
      ${EndIf}
    Finished:
FunctionEnd

Function "Install WxPython3.0"
    InitPluginsDir
    IfFileExists C:\Python27\Lib\site-packages\wx-3.0-msw\wx\__init__.py WeAreGood WeAreBad
    WeAreGood:
        DetailPrint "Already Installed: Skipping WxPython..."
        Goto Finished
    WeAreBad:
      DetailPrint "Installing WxPython"
      ${If} ${RunningX64}
          nsExec::Exec "$PLUGINSDIR\wxPython3.0-win64-3.0.0.0-py27.exe"
      ${Else}
            nsExec::Exec "$PLUGINSDIR\wxPython3.0-win32-3.0.0.0-py27.exe"
      ${EndIf}
      
      Pop $0
        ${If} $0 != 0
            MessageBox MB_OK "Failed to install WxPython: $0"
        ${EndIf}
    Finished:
FunctionEnd



Function "Install Python Packages"
    InitPluginsDir
    DetailPrint "Installing Python Packages"
    nsExec::ExecToLog 'C:\Python27\Scripts\pip.exe install -r $PLUGINSDIR\requirements.txt'
    Pop $0
    ${If} $0 != 0
        MessageBox MB_OK "Failed to install Python Packages: $0"
    ${EndIf}
FunctionEnd

Function "Driver Install"
    InitPluginsDir
    DetailPrint "Installing Driver"
    ExecShell "runas"  '"cmd.exe" "command /c pnputil -i -a $PLUGINSDIR\Driver\silabser.inf"'
    Pop $0
    ${If} $0 != 0
        MessageBox MB_OK "Failed to install Driver: $0"
    ${EndIf}
FunctionEnd



Function "Add environmet variables"
    DetailPrint "Adding environment variables"

    call "Remove environment variables"
    ; Set to HKLM
    EnVar::SetHKLM
    ; Append a value
    EnVar::AddValue "PATH" "$PROFILE\VeaPLC\lib\GnuWin32\bin;$PROFILE\VeaPLC\lib\MingW64\bin;$PROFILE\VeaPLC\editor\arduino\bin;C:\Python27;C:\Python27\Scripts"
    Pop $0
    DetailPrint "EnVar::AddValue returned=|$0|"

FunctionEnd