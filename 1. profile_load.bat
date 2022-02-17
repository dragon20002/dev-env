SET    cur_path=%cd%
SET    dir_apps=Apps
SET    dir_installs=installs
SET    dir_profile=profile
SET    dir_git=%cur_path%\%dir_apps%\Git\bin\;

@REM VS Code 설정
@REM 1. VS Code 이전 설정 적용하기
XCOPY "%cur_path%\%dir_profile%\settings.json" "C:\Users\%username%\AppData\Roaming\Code\User\"
XCOPY "%cur_path%\%dir_profile%\.vscode\" "C:\Users\%username%\.vscode" /E/H

@REM 2. 레지스트리 등록 (파일/폴더 VS Code로 열기)
%cur_path%\%dir_installs%\vsCodeOpenFolder.reg

@REM Git 설정
SETX  path "%PATH%%dir_git%"
XCOPY "%cur_path%\%dir_profile%\.gitconfig" "C:\Users\%username%\"
