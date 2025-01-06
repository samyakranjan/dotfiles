@echo off

REM IF NOT EXIST .vim MD .vim
REM git clone https://github.com/VundleVim/Vundle.vim.git %cd%\.vim\bundle\Vundle.vim

powershell -Command "(Get-Content .vimrc) -replace '@@GIT_DIR@@', (Get-Location) | Set-Content .vimrc"

REM echo source %cd%\.vimrc > %USERPROFILE%\_vimrc
