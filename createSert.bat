@echo off
set /p NAMESERT="Enter sertificate name: "
FOR /F "delims=" %%A IN ('dir /b %NAMESERT%*') DO SET fullNameSert=%%A
openssl x509 -inform DER -in %fullNameSert% -out cacert.pem

SET COMMAND=openssl x509 -inform PEM -subject_hash_old -in cacert.pem
FOR /F "delims=" %%A IN ('%COMMAND%') DO (
    SET HASH_SERT=%%A
    GOTO :break
)

:break
REN cacert.pem %HASH_SERT%.0

echo Sertificate %HASH_SERT%.0 was created
pause