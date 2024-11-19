# Scratch Plugin Store Manager

**Scratch Plugin Store Manager** — это утилита для управления плагинами Scratch с использованием простого командного интерфейса в `.bat` файле. Этот проект позволяет вам устанавливать, создавать и обновлять плагины для Scratch с помощью команд.

## Установка

1. **Предварительные требования:**
   - Убедитесь, что на вашем компьютере установлен **Git**.
   - Если Git не установлен, вы можете скачать его с официального сайта: [Git Downloads](https://git-scm.com/downloads).

2. **Скачивание проекта:**
   - Клонируйте репозиторий с помощью команды:
     ```
     git clone https://github.com/ваш_репозиторий/ScratchPluginStore
     ```
   - Или скачайте архив с репозиторием и распакуйте его на вашем компьютере.

3. **Запуск утилиты:**
   - Перейдите в папку с проектом.
   - Дважды щелкните на файл `ScratchPluginManager.bat`, чтобы запустить утилиту.

## Основные команды

### 1. Установка плагина
**Описание:**  
Устанавливает плагин с заданным `packageID` из репозитория **ScratchPluginStore** на GitHub.

**Пример использования:**
Плагин с ID `examplePlugin` будет установлен в папку `plugins`.

### 2. Создание нового плагина

**Описание:**  
Создает новый плагин с заданным `packageID`. Эта команда создаст структуру плагина в папке `plugins`, включая базовый файл `package.json` и файл JavaScript.

**Пример использования:**
Будет создан новый плагин с ID `myNewPlugin`.

### 3. Обновление всех плагинов
**Описание:**  
Обновляет все установленные плагины. Использует команду `git pull` для получения последних изменений с репозитория.

## 4. Выход
**Описание:**  
Завершает выполнение скрипта.

## Структура плагина

После создания плагина с помощью команды `create`, будет создана структура плагина с двумя основными файлами:

- **`package.json`** — файл, содержащий описание плагина, его версию и другие метаданные.
- **`packageID.js`** — основной файл JavaScript плагина.

**Пример содержимого `package.json`:**
```json
{
  "name": "myPlugin",
  "version": "1.0.0",
  "description": "A custom Scratch plugin",
  "blocks": []
}
```
Команды : install (packageID), create (packageID), update , exit

Made by Distendo
