@echo off
title Scratch Plugin Store
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
echo ============================
echo    Scratch Plugin Store
echo ============================
echo.
echo Команды:
echo install (packageID) - Установить плагин
echo create (packageID) - Создать новый репозиторий плагина
echo update - Обновить плагины
echo exit - Выйти
echo ============================
set /p choice=Введите команду:

:: Обработка введенной команды
if /i "%choice%"=="exit" exit
if /i "%choice%"=="update" goto updatePlugins
if /i "%choice%"=="install" goto installPlugin
if /i "%choice%"=="create" goto createPlugin
goto menu

:: Установка плагина
:installPlugin
cls
set /p packageID=Введите ID плагина для установки:
echo Устанавливаем плагин %packageID%...
:: В этом примере используется GitHub для поиска плагинов. Замените URL на свой реальный репозиторий.
git clone https://github.com/Distendo/ScratchPluginStore/%packageID%.git "%pluginDir%\%packageID%"
echo Плагин %packageID% установлен!
pause
goto menu

:: Создание плагина
:createPlugin
cls
set /p packageID=Введите ID для создания нового плагина:
echo Создаем новый плагин с ID %packageID%...

:: Создаем структуру для плагина (папка с базовыми файлами)
mkdir "%pluginDir%\%packageID%"
cd "%pluginDir%\%packageID%"
echo {
echo "name": "%packageID%",
echo "version": "1.0.0",
echo "description": "Your plugin description",
echo "blocks": []
echo } > package.json

:: Добавляем базовый JS файл
echo class %packageID% { > %packageID%.js
echo     constructor() { >> %packageID%.js
echo         console.log("Plugin %packageID% initialized!"); >> %packageID%.js
echo     } >> %packageID%.js
echo } >> %packageID%.js

echo Плагин с ID %packageID% был успешно создан!
pause
goto menu

:: Обновление плагинов
:updatePlugins
cls
echo Обновляем все плагины...
cd "%pluginDir%"
for /d %%D in (*) do (
    cd "%%D"
    echo Обновление плагина %%D...
    git pull
    cd ..
)
echo Все плагины обновлены!
pause
goto menu
