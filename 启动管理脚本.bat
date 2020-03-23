@echo off
chcp 936
cls
title csgo服务端管理 启动脚本作者JHPatchouli
@echo. -----------------------------------------------------------------
@echo.                          服务端管理脚本                                                            
@echo.      
@echo.      管理脚本作者JHPatchouli  https://github.com/JHPatchouli
@echo.                    
@echo.               如果下载无速度请挂加速器或者科学    
@echo.            
@echo.                  千万不要管理员启动！！！！！
@echo. -----------------------------------------------------------------
:checkdl
@echo. 已下载服务端过输入Y
@echo. 如果还未下载请输入N
set/p check1=请输入:
if "%check1%"=="Y" (
	goto cls
) else if "%check1%"=="y" (
	goto cls
) else if "%check1%"=="N" (
	goto download
) else if "%check1%"=="n" (
	goto download
) else (
	echo 请检查输入
	goto checkdl
)
:download
@echo.开始下载
steamcmd.exe +runscript fdownload.txt
chcp 936
cls
goto start
:cls
cls
:ljsz
@echo.                       路径设置
@echo. 请确保路径没有错误，否则后面的设置将不会生效
set/p lj=路径:
cd %lj%
dir /a srcds.exe
cls
echo 检查文件
if "%ERRORLEVEL%"=="0" (
	goto start
) else if "%ERRORLEVEL%"=="1" (
	cd /d %lj%
)
dir /a srcds.exe
cls
echo 检查文件
if "%ERRORLEVEL%"=="0" (
	goto start
	cls
) else if "%ERRORLEVEL%"=="1" (
	cls
	echo 请检查输入的路径是否正确
	goto ljsz
)
:start
@echo                              菜单
@echo 令牌申请网页 https://steamcommunity.com/dev/managegameservers
@echo 0、首次启用需要设置令牌，如你已经拥有server.cfg配置请忽略
@echo.
@echo 1、直接启动(GUI)    PS:图像界面
@echo.              
@echo 2、直接启动(DOS)    PS:cmd界面
@echo.
@echo 3、打开网页
set/p start=请输入:
if "%start%"=="0" (
	goto KEY
) else if "%start%"=="1" (
	goto tk
) else if "%start%"=="2" (
	goto tk
) else if "%start%"=="3" (
	explorer "https://steamcommunity.com/dev/managegameservers"
	goto start
) else (
	echo 请检查输入
	goto start
)
:KEY
cd %lj%\csgo\cfg
set/p key=令牌:
echo sv_setsteamaccount "%key%" >> server.cfg
cd %lj%
cls
echo 确保输入令牌正确后可继续
goto start
:tk
@echo                         选择tickrate
@echo PS: Tickrate就是服务器每秒钟接收并运算的次数
@echo 64或者128
set/p tk=请输入:
if "%start%"=="1" (
	goto GUIST
) else if "%start%"=="2" (
	goto CMDST
) else (
	echo 请联系作者QQ2859676251
	echo 或者邮箱mrhaohk@mrhao.xyz
:gm3
set/p gm3=参数:
set gm1=-game csgo -console
set gm=%gm1% %gm2% -tickrate %tk%
goto startserver
:gm2
set/p gm2=参数:
set gm1=-game csgo
set gm=%gm1% %gm2% -tickrate %tk%
goto startserver
:GUIST
@echo 0、最普通的启动
@echo 1、经典-娱乐模式
@echo 2、经典-比赛模式
@echo 3、军械库-军备竞赛模式
@echo 4、军械库-破坏模式
@echo 5、自定义，请确保输入正确否则无法启动(不要带game csgo console tickrate参数)
set/p game=请输入:
if "%game%"=="0" (
	set gm=-game csgo -usercon +map de_dust -tickrate
) else if "%game%"=="1" (
	set gm=-game csgo -usercon +game_type 0 +game_mode 0 +mapgroup mg_bomb +map de_dust -tickrate %tk%"
) else if "%game%"=="2" (
	set gm=-game csgo -game csgo -usercon +game_type 0 +game_mode 1 +mapgroup mg_bomb +map de_dust -tickrate %tk%"
) else if "%game%"=="3" (
	set gm=-game csgo -game csgo -usercon +game_type 1 +game_mode 0 +mapgroup mg_armsrace +map de_dust -tickrate %tk%"
) else if "%game%"=="4" (
	set gm=-game csgo -usercon +game_type 1 +game_mode 1 +mapgroup mg_demolition +map de_dust -tickrate %tk%"
) else if "%game%"=="5" (
	goto gm2
) else (
	echo 请检查输入
	goto start
)
goto startserver
:CMDST
@echo 0、最普通的启动
@echo 1、经典-娱乐模式
@echo 2、经典-比赛模式
@echo 3、军械库-军备竞赛模式
@echo 4、军械库-破坏模式
@echo 5、自定义，请确保输入正确否则无法启动(不要带game csgo console tickrate参数)
set/p game=请输入:
if "%game%"=="0" (
	set gm=-game csgo -console -usercon +map de_dust -tickrate
) else if "%game%"=="1" (
	set gm=-game csgo -console -usercon +game_type 0 +game_mode 0 +mapgroup mg_bomb +map de_dust -tickrate %tk%"
) else if "%game%"=="2" (
	set gm=-game csgo -console -game csgo -usercon +game_type 0 +game_mode 1 +mapgroup mg_bomb +map de_dust -tickrate %tk%"
) else if "%game%"=="3" (
	set gm=-game csgo -console -game csgo -usercon +game_type 1 +game_mode 0 +mapgroup mg_armsrace +map de_dust -tickrate %tk%"
) else if "%game%"=="4" (
	set gm=-game csgo -console -usercon +game_type 1 +game_mode 1 +mapgroup mg_demolition +map de_dust -tickrate %tk%"
) else if "%game%"=="5" (
	goto gm3
) else (
	echo 请检查输入
	goto start
)
goto startserver
:startserver
cls
echo %gm%
echo 启动中.
echo 启动中..
echo 启动中...
srcds.exe %gm%
:exit
echo 任意键退出
pause