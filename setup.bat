@echo off

IF NOT EXIST .vim MD .vim
git clone https://github.com/VundleVim/Vundle.vim.git %cd%\.vim\bundle\Vundle.vim

powershell -Command "(Get-Content .vimrc) -replace '@@GIT_DIR@@', (Get-Location) | Set-Content .vimrc"

echo source %cd%\.vimrc > %USERPROFILE%\_vimrc

gvim -c ":PluginInstall" -c ":qa"
