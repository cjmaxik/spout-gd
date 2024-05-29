@echo off
setlocal enabledelayedexpansion

REM Get the script directory
for %%i in (%0) do set SCRIPT_DIR=%%~dpi

echo Building Spout
cd "%SCRIPT_DIR%Spout2"
cmake -DSKIP_INSTALL_ALL=OFF -DSKIP_INSTALL_HEADERS=OFF -DSKIP_INSTALL_LIBRARIES=OFF -DSPOUT_BUILD_LIBRARY=ON --fresh .
cmake --build . --clean-first
cd "%SCRIPT_DIR%"

echo Building godot-cpp
cd "%SCRIPT_DIR%godot-cpp"
python -m SCons
cd "%SCRIPT_DIR%"

echo Building spout-gd
python -m SCons
python -m SCons target=template_release