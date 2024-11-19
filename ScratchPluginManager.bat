@echo off
title Scratch Plugin Manager
color 0A

:: Указываем директорию для плагинов
set pluginDir=plugins

:: Проверяем, существует ли папка для плагинов
if not exist "%pluginDir%" (
    mkdir "%pluginDir%"
)

:: Главное меню
:menu
cls
echo ====================================
echo         Scratch Plugin Manager
echo ====================================
echo.
echo Команды:
echo install [packageID] - Установить плагин
echo update [packageID]  - Обновить плагин
echo remove [packageID]  - Удалить плагин
echo list                - Просмотреть установленные плагины
echo exit                - Выйти
echo ====================================
set /p command=Введите команду:

call :processCommand %command%
goto menu

:: Обработка команд
:processCommand
:: Установка плагина
if /i "%1"=="install" (
    shift
    set packageID=%1
    if "%packageID%"=="" (
        echo Укажите ID пакета для установки!
        pause
        goto :eof
    )
    echo Устанавливаем плагин %packageID%...
    git clone https://github.com/Distendo/ScratchPluginStore/%packageID%.git "%pluginDir%\%packageID%"
    if %ERRORLEVEL%==0 (
        echo Плагин %packageID% успешно установлен!
    ) else (
        echo Ошибка при установке плагина %packageID%.
    )
    pause
    goto :eof
)

:: Обновление плагина
if /i "%1"=="update" (
    shift
    set packageID=%1
    if "%packageID%"=="" (
        echo Укажите ID пакета для обновления!
        pause
        goto :eof
    )
    echo Обновляем плагин %packageID%...
    cd "%pluginDir%\%packageID%" || (
        echo Плагин %packageID% не найден!
        pause
        goto :eof
    )
    git pull
    if %ERRORLEVEL%==0 (
        echo Плагин %packageID% успешно обновлён!
    ) else (
        echo Ошибка при обновлении плагина %packageID%.
    )
    cd ..
    pause
    goto :eof
)

:: Удаление плагина
if /i "%1"=="remove" (
    shift
    set packageID=%1
    if "%packageID%"=="" (
        echo Укажите ID пакета для удаления!
        pause
        goto :eof
    )
    echo Удаляем плагин %packageID%...
    rmdir /s /q "%pluginDir%\%packageID%" || (
        echo Плагин %packageID% не найден или уже удалён!
        pause
        goto :eof
    )
    echo Плагин %packageID% успешно удалён!
    pause
    goto :eof
)

:: Просмотр списка установленных плагинов
if /i "%1"=="list" (
    cls
    echo ====================================
    echo      Установленные плагины:
    echo ====================================
    dir "%pluginDir%" /b
    echo ====================================
    pause
    goto :eof
)

:: Выход
if /i "%1"=="exit" exit

:: Неизвестная команда
echo Неизвестная команда: %1
pause
goto :eof
