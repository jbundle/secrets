set USER_FILTER=%1%
if "%USER_FILTER%" == "" (
  set USER_FILTER=%USERNAME%
)

set SECRETS_FILE_PATH=%2%
if "%SECRETS_FILE_PATH%" == "" (
  set SECRETS_FILE_PATH=%USERPROFILE%\workspace\secrets
)

set SECRETS_DIR=C:\run\secrets\%USER_FILTER%

echo USER_FILTER %USER_FILTER%
echo SECRETS_FILE_PATH %SECRETS_FILE_PATH%
echo SECRETS_DIR %SECRETS_DIR%

md %SECRETS_DIR%
REM chown %USER_FILTER% %SECRETS_DIR%
REM chgrp %USER_FILTER% %SECRETS_DIR%
cd %SECRETS_DIR%

echo %SECRETS_FILE_PATH%\%USER_FILTER%.tar.gz.enc to %SECRETS_DIR%

openssl enc -aes-256-cbc -d -md md5 -in %SECRETS_FILE_PATH%\%USER_FILTER%.tar.gz.enc -out ..\%USER_FILTER%.tar.gz
tar xzf ..\%USER_FILTER%.tar.gz
