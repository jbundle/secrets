set USER_FILTER=%1%
if "%USER_FILTER%" == "" (
  set USER_FILTER=%USERNAME%
)

set SECRETS_FILE_PATH=%2%
if "%SECRETS_FILE_PATH%" == "" (
  set SECRETS_FILE_PATH=%USERPROFILE%\workspace\secrets
)

set SECRETS_DIR=C:\run\secrets\%USER_FILTER%
cd %SECRETS_DIR%

echo USER_FILTER %USER_FILTER%
echo SECRETS_FILE_PATH %SECRETS_FILE_PATH%
echo SECRETS_DIR %SECRETS_DIR%

echo %SECRETS_DIR% to %SECRETS_FILE_PATH%\%USER_FILTER%.tar.gz.enc

move $SECRETS_FILE_PATH/$USER_FILTER.tar.gz.enc %SECRETS_FILE_PATH%\..\backup\%USER_FILTER%-%(date +"%m_%d_%Y")%

tar czf ..\%USER_FILTER%.tar.gz .
openssl enc -aes-256-cbc -md md5 -e -in ..\%USER_FILTER%.tar.gz -out %SECRETS_FILE_PATH%\%USER_FILTER%.tar.gz.enc
