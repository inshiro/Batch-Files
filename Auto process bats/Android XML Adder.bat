@ECHO off
SETLOCAL ENABLEEXTENSIONS
PUSHD %CD%\
SET e=ECHO
SET e-=ECHO.
SET p=PAUSE
SET f=final.xml
SET i=SET input=
SET i-=SET /P input=
CD %~dp0
REM Settings --------
if exist %f% goto start
%e% ^<?xml version="1.0" encoding="utf-8"?^>>>%f%
%e% ^<resources^>>>%f%
:start
CLS
%e-%
%e%  x - Exit
%e-%
SET input=
SET /P input= Start? [Y/n]: 
if '%input%'==''  (goto start)
if %input%==Y    (goto startt)
if %input%==y    (goto startt)
if %input%==N    (goto exit)
if %input%==n    (goto exit)
if %input%==X    (goto exit)
if %input%==x    (goto exit)
:startt
%e%    ^<drawable name="menu_add_new_note"^>@drawable/menu_add_new_note^</drawable^>>>%f%
%e%    ^<drawable name="menu_alert"^>@drawable/menu_alert^</drawable^>>>%f%
%e%    ^<drawable name="menu_change_font_size"^>@drawable/menu_change_font_size^</drawable^>>>%f%
%e%    ^<drawable name="menu_check_list"^>@drawable/menu_check_list^</drawable^>>>%f%
%e%    ^<drawable name="menu_delete"^>@drawable/menu_delete^</drawable^>>>%f%
%e%    ^<drawable name="menu_edit_mode"^>@drawable/menu_edit_mode^</drawable^>>>%f%
%e%    ^<drawable name="menu_export_text"^>@drawable/menu_export_text^</drawable^>>>%f%
%e%    ^<drawable name="alert_dark_frame"^>@drawable/menu_send_to_desktop^</drawable^>>>%f%
%e%    ^<drawable name="alert_dark_frame"^>@drawable/menu_sync^</drawable^>>>%f%
%e%    ^<drawable name="alert_dark_frame"^>@drawable/note_edit_color_selector_panel^</drawable^>>>%f%
%e%    ^<drawable name="alert_dark_frame"^>@drawable/notification^</drawable^>>>%f%
%e%    ^<drawable name="alert_dark_frame"^>@drawable/search_result^</drawable^>>>%f%
%e%    ^<drawable name="alert_dark_frame"^>@drawable/selected^</drawable^>>>%f%
%e%    ^<drawable name="alert_dark_frame"^>@drawable/title_alert^</drawable^>>>%f%
%e%    ^<drawable name="alert_dark_frame"^>@drawable/title_bar_bg^</drawable^>>>%f%
%e%    ^<drawable name="alert_dark_frame"^>@drawable/widget_x_blue^</drawable^>>>%f%
%e%    ^<drawable name="alert_dark_frame"^>@drawable/widget_x_green^</drawable^>>>%f%
%e%    ^<drawable name="alert_dark_frame"^>@drawable/widget_x_red^</drawable^>>>%f%
%e%    ^<drawable name="alert_dark_frame"^>@drawable/widget_x_white^</drawable^>>>%f%
%e%    ^<drawable name="alert_dark_frame"^>@drawable/widget_x_yellow^</drawable^>>>%f%
%e%    ^<drawable name="alert_dark_frame"^>@drawable/widget_x_blue^</drawable^>>>%f%
%e%    ^<drawable name="alert_dark_frame"^>@drawable/widget_x_green^</drawable^>>>%f%
%e%    ^<drawable name="alert_dark_frame"^>@drawable/widget_x_red^</drawable^>>>%f%
%e%    ^<drawable name="alert_dark_frame"^>@drawable/widget_x_white^</drawable^>>>%f%
%e%    ^<drawable name="alert_dark_frame"^>@drawable/widget_x_yellow^</drawable^>>>%f%
GOTO start
:exit
CLS
ECHO.