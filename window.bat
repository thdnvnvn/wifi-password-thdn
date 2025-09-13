@echo off
echo ================================
echo   Wi-Fi Password Viewer 
echo ================================
echo.

:: Lấy danh sách tất cả Wi-Fi đã lưu
for /f "tokens=2 delims=:" %%A in ('netsh wlan show profiles ^| findstr "All User Profile"') do (
    set "wifi=%%A"
    setlocal enabledelayedexpansion
    set "wifi=!wifi:~1!"  :: Xóa khoảng trắng đầu
    echo ----------------------------
    echo Wi-Fi: !wifi!
    netsh wlan show profile name="!wifi!" key=clear | findstr "Key Content"
    endlocal
    echo.
)

pause