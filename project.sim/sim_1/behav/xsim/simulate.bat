@echo off
REM ****************************************************************************
REM Vivado (TM) v2020.2 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Tue Jun 15 15:10:50 +0300 2021
REM SW Build 3064766 on Wed Nov 18 09:12:45 MST 2020
REM
REM Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
REM simulate design
echo "xsim Data_Path_tb_behav -key {Behavioral:sim_1:Functional:Data_Path_tb} -tclbatch Data_Path_tb.tcl -view C:/Users/yasar/project/Data_Path_tb_behav1.wcfg -log simulate.log"
call xsim  Data_Path_tb_behav -key {Behavioral:sim_1:Functional:Data_Path_tb} -tclbatch Data_Path_tb.tcl -view C:/Users/yasar/project/Data_Path_tb_behav1.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
