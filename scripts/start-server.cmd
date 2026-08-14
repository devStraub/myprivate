@echo off
setlocal
set "PROJECT_ROOT=%~dp0.."
if not defined FXSERVER_EXE set "FXSERVER_EXE=%PROJECT_ROOT%\artifacts\server\FXServer.exe"
if not exist "%FXSERVER_EXE%" (
  echo FXServer nao encontrado em "%FXSERVER_EXE%".
  echo Defina FXSERVER_EXE ou instale os artifacts em artifacts\server.
  exit /b 1
)
pushd "%PROJECT_ROOT%"
"%FXSERVER_EXE%" +exec server.cfg
set "EXIT_CODE=%ERRORLEVEL%"
popd
exit /b %EXIT_CODE%

