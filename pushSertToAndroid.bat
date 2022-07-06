
set /p devicePort="Enter device port: "
set /p adbPath="Enter adb path: "
FOR /F "delims=" %%A IN ('dir /b *.0') DO SET sertificate=%%A

%adbPath% connect 127.0.0.1:%devicePort%
%adbPath% root 
%adbPath% remount
%adbPath% push %sertificate% /sdcard/

%adbPath% shell mv /sdcard/%sertificate% /system/etc/security/cacerts/
%adbPath% shell chmod 644 /system/etc/security/cacerts/%sertificate%

