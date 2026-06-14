# Alloy-DE

A lightweight desktop environment for Alloy-OS, built with C++ and Qt6 QML.

## Prerequisites

- **Qt 6.8+** (Quick and Qml modules)
- **CMake 3.16+**
- **MSVC 2022** (Visual Studio Build Tools)

## Build

```powershell
cmake -B build -DCMAKE_PREFIX_PATH="C:\Users\Fkm\Qt\6.8.3\msvc2022_64" -DCMAKE_BUILD_TYPE=Release
cmake --build build --config Release
```

## Run

```powershell
.\build\Release\AlloyDE.exe
```

## Controls

| Key | Action |
|---|---|
| `Meta` (Windows key) | Toggle app launcher |
| `Escape` | Close app launcher |
| House icon button | Toggle app launcher |
| X button | Quit the DE |

## Project structure

```
AlloyDE/          QML module (UI components)
src/main.cpp      C++ entry point
resources.qrc     Qt resource file
CMakeLists.txt    Build configuration
```
