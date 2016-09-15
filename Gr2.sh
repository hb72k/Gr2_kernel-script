#!/bin/bash

#Variable
USUARIO=' '
KERNEL=' '

#Inicio
echo "========================="
echo *KERNEL COMPILER BY GR2* 
echo "========================="

#VERIFICANDO
echo "***Verificando Linario...***"
LIN=~/arm-cortex_a7-linux-gnueabihf-linaro_4.9
if [ ! -d "$LIN" ]; then
git clone https://github.com/Christopher83/arm-cortex_a7-linux-gnueabihf-linaro_4.9.git
echo "***Se usará Linario existente***"
fi

#SOURCE
echo '***Desea Descargar su source?'
echo "***Diga si o no:"
read VAR
if [ "$VAR" = si ]; then
echo "***Escribiste -si-***" 
echo '***Ingrese la dirección de su source:***'
read SOURCE
echo '***Nombre del branch***'
read branch
git clone $SOURCE -b $branch
elif [ "$VAR" = no ]; then
echo "Escribiste -no-"
echo 'se continuara con la compilación'
elif [ "$VAR" = "" ]; then
echo "Opcion por defecto -No-" 
else
echo "Opcion por defecto -No-"
fi
sleep 1s

#Cuestion
echo 'Especifique la config del DEVICE'
echo 'ejemplo: cm_hwY635_defconfig '
read DEVICE
echo '¿Cual es su nick?'
read USUARIO 
echo 'nombre del kernel: ' 
read KERNEL 
sleep 1s 
cd kernel
echo 'Desea borrar la compilación anterior?'
echo "Diga si o no:"
read COMP
if [ "$COMP" = si ]; then
echo 'Borrando compilaciones Anteriores'
make clean 
elif [ "$COMP" = no ]; then
echo "Escribiste -no-"
echo 'se continuara con la compilación'
fi

make ARCH=arm $DEVICE

echo ===================================
echo Compilando Kernel con Linario 
echo ===================================

#AsignandoNombre
export KBUILD_BUILD_USER= $USUARIO
export KBUILD_BUILD_HOST= $KERNEL

make -j5 ARCH=arm CROSS_COMPILE=~/arm-cortex_a7-linux-gnueabihf-linaro_4.9/bin/arm-cortex_a7-linux-gnueabihf-

echo ===================================

echo Compilacion terminada, Felicidades!

echo ===================================

sleep 10s
