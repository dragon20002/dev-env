SET    cur_path=%cd%
SET    dir_profile=profile
SET    user_path=C:\Users\%username%

SET    dir_src=%user_path%
SET    dir_dest=%cur_path%\%dir_profile%

@REM VS Code 설정
@REM 1. VS Code 설정 저장

XCOPY "%dir_src%\AppData\Roaming\Code\User\settings.json" "%dir_dest%\"
XCOPY "%dir_src%\.vscode\" "%dir_dest%\.vscode\" /E/H

@REM Git 설정
@REM 1. Git 설정 저장
XCOPY "%dir_src%\.gitconfig" "%dir_dest%\"
