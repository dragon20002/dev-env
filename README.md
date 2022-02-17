# dev-env 설정

## `installs/vsCodeOpenFolder.reg`

모든 `D:\\dev-env\\Apps\\VSCode-win32-x64\\Code.exe`를 현재 VSCode EXE 파일 경로로 변경

Ex) `D:\\dev-env\\Apps\\VSCode-win32-x64\\Code.exe` → `C:\\VSCode-win32-x64\\Code.exe`

    ```bat
    Windows Registry Editor Version 5.00

    ; 1. Open files

    [HKEY_CLASSES_ROOT\*\shell\Open with VS Code]
    @="Edit with VS Code"
    "Icon"="C:\\VSCode-win32-x64\\Code.exe,0"
    [HKEY_CLASSES_ROOT\*\shell\Open with VS Code\command]
    @="\"C:\\VSCode-win32-x64\\Code.exe\" \"%1\""

    ; 2. This will make it appear when you right click ON a folder
    ;    The "Icon" line can be removed if you don't want the icon to appear

    [HKEY_CLASSES_ROOT\Directory\shell\vscode]
    @="Open Folder as VS Code Project"
    "Icon"="C:\\VSCode-win32-x64\\Code.exe,0"
    [HKEY_CLASSES_ROOT\Directory\shell\vscode\command]
    @="\"C:\\VSCode-win32-x64\\Code.exe\" \"%1\""

    ; 3. This will make it appear when you right click INSIDE a folder
    ;    The "Icon" line can be removed if you don't want the icon to appear

    [HKEY_CLASSES_ROOT\Directory\Background\shell\vscode]
    @="Open Folder as VS Code Project"
    "Icon"="C:\\VSCode-win32-x64\\Code.exe,0"
    [HKEY_CLASSES_ROOT\Directory\Background\shell\vscode\command]
    @="\"C:\\VSCode-win32-x64\\Code.exe\" \"%V\""
    ```

## `1. profile_load.bat`

Git 경로 설정

```bat
@REM SET    dir_git=%cur_path%\%dir_apps%\Git\bin\;
SET    dir_git=C:\Git\bin\;
```

## 디렉터리 별 사용처

| 이름     | 용도                                                       |
| -------- | ---------------------------------------------------------- |
| Apps     | Git, VSode 등 설치 경로                                    |
| installs | 설치파일에 필요한 파일 보관. Ex) 레지스트리(.reg), .zip 등 |
| profile  | 프로그램의 설정파일들을 저장                               |

## 사용법

- `1. profile_load.bat`

  이전에 저장했던 상태를 로드

- `2. profile_save.bat`

  현재 상태를 저장
