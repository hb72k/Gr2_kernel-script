#!/bin/bash

echo =========================

echo *KERNEL COMPILER BY GR2* 

echo =========================
sleep 1s 

cd msm8916

make ARCH=arm cm_hwY635_defconfig

echo ===================================
echo Compilando Kernel con Linario 
echo ===================================

make -j5 ARCH=arm CROSS_COMPILE=~/arm-cortex_a7-linux-gnueabihf-linaro_4.9/bin/arm-cortex_a7-linux-gnueabihf-

echo ===================================

echo Compilacion terminada, Felicidades!

echo ===================================

sleep 10s
