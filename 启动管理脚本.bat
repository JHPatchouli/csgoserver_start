@echo off
chcp 936
cls
title csgo����˹��� �����ű�����JHPatchouli
@echo. -----------------------------------------------------------------
@echo.                          ����˹���ű�                                                            
@echo.      
@echo.      ����ű�����JHPatchouli  https://github.com/JHPatchouli
@echo.                    
@echo.               ����������ٶ���Ҽ��������߿�ѧ    
@echo.            
@echo.                  ǧ��Ҫ����Ա��������������
@echo. -----------------------------------------------------------------
:checkdl
@echo. �����ط���˹�����Y
@echo. �����δ����������N
set/p check1=������:
if "%check1%"=="Y" (
	goto cls
) else if "%check1%"=="y" (
	goto cls
) else if "%check1%"=="N" (
	goto download
) else if "%check1%"=="n" (
	goto download
) else (
	echo ��������
	goto checkdl
)
:download
@echo.��ʼ����
steamcmd.exe +runscript fdownload.txt
chcp 936
cls
goto start
:cls
cls
:ljsz
@echo.                       ·������
@echo. ��ȷ��·��û�д��󣬷����������ý�������Ч
set/p lj=·��:
cd %lj%
dir /a srcds.exe
cls
echo ����ļ�
if "%ERRORLEVEL%"=="0" (
	goto start
) else if "%ERRORLEVEL%"=="1" (
	cd /d %lj%
)
dir /a srcds.exe
cls
echo ����ļ�
if "%ERRORLEVEL%"=="0" (
	goto start
	cls
) else if "%ERRORLEVEL%"=="1" (
	cls
	echo ���������·���Ƿ���ȷ
	goto ljsz
)
:start
@echo                              �˵�
@echo ����������ҳ https://steamcommunity.com/dev/managegameservers
@echo 0���״�������Ҫ�������ƣ������Ѿ�ӵ��server.cfg���������
@echo.
@echo 1��ֱ������(GUI)    PS:ͼ�����
@echo.              
@echo 2��ֱ������(DOS)    PS:cmd����
@echo.
@echo 3������ҳ
set/p start=������:
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
	echo ��������
	goto start
)
:KEY
cd %lj%\csgo\cfg
set/p key=����:
echo sv_setsteamaccount "%key%" >> server.cfg
cd %lj%
cls
echo ȷ������������ȷ��ɼ���
goto start
:tk
@echo                         ѡ��tickrate
@echo PS: Tickrate���Ƿ�����ÿ���ӽ��ղ�����Ĵ���
@echo 64����128
set/p tk=������:
if "%start%"=="1" (
	goto GUIST
) else if "%start%"=="2" (
	goto CMDST
) else (
	echo ����ϵ����QQ2859676251
	echo ��������mrhaohk@mrhao.xyz
:gm3
set/p gm3=����:
set gm1=-game csgo -console
set gm=%gm1% %gm2% -tickrate %tk%
goto startserver
:gm2
set/p gm2=����:
set gm1=-game csgo
set gm=%gm1% %gm2% -tickrate %tk%
goto startserver
:GUIST
@echo 0������ͨ������
@echo 1������-����ģʽ
@echo 2������-����ģʽ
@echo 3����е��-��������ģʽ
@echo 4����е��-�ƻ�ģʽ
@echo 5���Զ��壬��ȷ��������ȷ�����޷�����(��Ҫ��game csgo console tickrate����)
set/p game=������:
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
	echo ��������
	goto start
)
goto startserver
:CMDST
@echo 0������ͨ������
@echo 1������-����ģʽ
@echo 2������-����ģʽ
@echo 3����е��-��������ģʽ
@echo 4����е��-�ƻ�ģʽ
@echo 5���Զ��壬��ȷ��������ȷ�����޷�����(��Ҫ��game csgo console tickrate����)
set/p game=������:
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
	echo ��������
	goto start
)
goto startserver
:startserver
cls
echo %gm%
echo ������.
echo ������..
echo ������...
srcds.exe %gm%
:exit
echo ������˳�
pause