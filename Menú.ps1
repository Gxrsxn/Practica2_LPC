# Practica2_LPC
#Script 1, Entorno: PowerShell
#Este Script es un menú el cual da opciones al usuario para configurar su Firewall
#Es necesario que al momento de hacer uso de este script se cree un módulo el cual contenra las funciones usadas y un manifiesto para poder correr las funciones en PS

function menú{
  param(
    [string]$Title = "Bienvenido al menú"
  )
  cls
  Write-Host "==========Title=========="
  Write-Host "1: Ver status del perfil."
  Write-Host "2: Cambiar el status del perfil."
  Write-Host "3: Ver Perfil de Red Actual."
  Write-Host "4: Cambiar Perfil de Red Actual."
  Write-Host "5: Ver Reglas de Bloqueo."
  Write-Host "6: Agregar Reglas de Bloqueo."
  Write-Host "Q: Presione 'Q' para salir."
}

function Ver-StatusPerfil{ 
	param([Parameter(Mandatory)] [ValidateSet("Public","Private")] [string] $perfil) 
	$status = Get-NetFirewallProfile -Name $perfil 
	Write-Host "Perfil:" $perfil 
	if($status.enabled){ 
		Write-Host "Status: Activado" 
	} else{ 
		Write-Host "Status: Desactivado" 
	} 
}

function Cambiar-StatusPerfil{
	param([Parameter(Mandatory)] [ValidateSet("Public","Private")] [string] $perfil) 
	$status = Get-NetFirewallProfile -Name $perfil 
	Write-Host "Perfil:" $perfil 
	if($status.enabled){ 
		Write-Host "Status actual: Activado" 
		$opc = Read-Host -Promt "Deseas desactivarlo? [Y] Si [N] No" 
		if ($opc -eq "Y"){ 
			Set-NetFirewallProfile -Name $perfil -Enabled False 
		} 
	} else{ 
		Write-Host "Status: Desactivado" 
		$opc = Read-Host -Promt "Deseas activarlo? [Y] Si [N] No" 
		if ($opc -eq "Y"){ 
			Write-Host "Activando perfil" 
			Set-NetFirewallProfile -Name $perfil -Enabled True 
		} 
	} 
	Ver-StatusPerfil -perfil $perfil 
}

function Ver-PerfilRedActual{ 
	$perfilRed = Get-NetConnectionProfile 
	Write-Host "Nombre de red:" $perfilRed.Name 
	Write-Host "Perfil de red:" $perfilRed.NetworkCategory 
}

function Cambiar-PerfilRedActual{ 
	$perfilRed = Get-NetConnectionProfile 
	if($perfilRed.NetworkCategory -eq "Public"){ 
		Write-Host "El perfil actual es público" 
		$opc = Read-Host -Prompt "Quieres cambiar a privado? [Y] Si [N] No" 
		if($opc -eq "Y"){ 
			Set-NetConnectionProfile -Name $perfilRed.Name -NetworkCategory Private 
			Write-Host "Perfil cambiado" 
		} 
	} else{ 
		Write-Host "El perfil actual es privado" 
		$opc = Read-Host -Prompt "Quieres cambiar a público? [Y] Si [N] No" 
		if($opc -eq "Y"){ 
			Set-NetConnectionProfile -Name $perfilRed.Name -NetworkCategory Public
			Write-Host "Perfil cambiado" 
		} 
	} 
	Ver-PerfilRedActual 
}

function Ver-ReglasBloqueo{ 
	if(Get-NetFirewallRule -Action Block -Enabled True -ErrorAction SilentlyContinue){ 
		Get-NetFirewallRule -Action Block -Enabled True 
	} else{ 
		Write-Host "No hay reglas definidas aún" 
	} 
}

function Agregar-ReglasBloqueo{ 
	$puerto = Read-Host -Prompt "Cuál puerto quieres bloquear?" 
	New-NetFirewallRule -DisplayName "Puerto-Entrada-$puerto" -Profile "Public" -Direction Inbound -Action Block -Protocol TCP -LocalPort $puerto 
}

#Estas funciones son las que deben ir en el módulo creado en PS
#Aquí comienza el script como tal

do{
  menú
  $input = Read-Host "Selecciona una opción"
  switch($input)
  {
    '1' {
      'Ha seleccionado la opcion #1'
      Ver-StatusPerfil
    } 
    '2' {
      'Ha seleccionado la opcion #2'
      Cambiar-StatusPerfil
    } 
    '3' {
      'Ha seleccionado la opcion #3'
      Ver-PerfilRedActual
    } 
    '4' {
      'Ha seleccionado la opcion #4'
      Cambiar-PerfilRedActual
    } 
    '5' {
      'Ha seleccionado la opcion #5'
      Ver-ReglasBloqueo
    } 
    '6' {
      'Ha seleccionado la opcion #6'
      Agregar-ReglasBloqueo
    }
    'Q' {
      return
    }
  }
  Pause
}
until($input -eq 'Q')

#Script 2, Entorno: Bash
#El siguiente script es un menú que le mostrará al usuario 5 opciones, lo que realice se puede dejar para que aquel que quiera asignar ciertas funciones pueda hacerlo libremente

#!/bin/bash

echo "Ejemplo de Menu de Opciones."

while true; do
    read -p "Seleccione una opcion de 1 a 5 ?" op
    case $op in
        [1]* ) logInfo "Opción Seleccionada 1 !"; break;;
        [2]* ) logInfo "Opción Seleccionada 2 !"; break;;
        [3]* ) logInfo "Opción Seleccionada 3 !"; break;;
        [4]* ) logInfo "Opción Seleccionada 4 !"; break;;
        [5]* ) logInfo "Opción Seleccionada 5 !"; break;;        
        * ) logWarn "Seleccione una Opción de 1 a 5.";;
    esac
done

echo "Fin del Menú"
