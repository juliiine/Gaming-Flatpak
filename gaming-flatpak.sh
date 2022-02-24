#!/bin/bash
# Gaming Flatpak
# Install various packages for Gaming using Flatpak to be distribution agnostic
#
#Copyright (C) 2022 Yannick Defais
#This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
#This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#You should have received a copy of the GNU General Public License along with this program. If not, see https://www.gnu.org/licenses/. 
############################################################################################
# Initialize variables
GAMING_FLATPAK_VERSION=0.1

GAMING_FLATPAK_GUI=none

TRUE=0
FALSE=1

# Commands to install
declare -a COMMANDS_TO_INSTALL
declare -a LABELS_TO_COMMANDS
case ${LANG} in
  fr*)
    LABELS_TO_COMMANDS+=("Ajout du dépôt Flathub.");;
  *)
    LABELS_TO_COMMANDS+=("Adding Flathub repository.");;
esac
COMMANDS_TO_INSTALL+=("flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo")
case ${LANG} in
  fr*)
    LABELS_TO_COMMANDS+=("Ajout du dépôt Flathub-beta.");;
  *)
    LABELS_TO_COMMANDS+=("Adding Flathub-beta repository.");;
esac
COMMANDS_TO_INSTALL+=("flatpak remote-add --if-not-exists --user flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo")
case ${LANG} in
  fr*)
    LABELS_TO_COMMANDS+=("Mise à jour des dépôts Flapak.");;
  *)
    LABELS_TO_COMMANDS+=("Updating Flatpak repositories.");;
esac
COMMANDS_TO_INSTALL+=("flatpak update --assumeyes --noninteractive")
#Dépendances
case ${LANG} in
  fr*)
    LABELS_TO_COMMANDS+=("Installation des dépendances.");;
  *)
    LABELS_TO_COMMANDS+=("Dependencies installation.");;
esac
COMMANDS_TO_INSTALL+=("flatpak install --assumeyes --noninteractive flathub org.gnome.Platform/x86_64/41")
# program list
#Installation de steam
case ${LANG} in
  fr*)
    LABELS_TO_COMMANDS+=("Installation de Steam.");;
  *)
    LABELS_TO_COMMANDS+=("Steam installation.");;
esac
COMMANDS_TO_INSTALL+=("flatpak install --assumeyes --noninteractive flathub com.valvesoftware.Steam")
# Installation de ProtonGe
case ${LANG} in
  fr*)
    LABELS_TO_COMMANDS+=("Installation de ProntonGE.");;
  *)
    LABELS_TO_COMMANDS+=("ProtonGE installation.");;
esac
COMMANDS_TO_INSTALL+=("flatpak install --assumeyes --noninteractive flathub com.valvesoftware.Steam.CompatibilityTool.Proton-GE")
# Installation de PorotonUP-QT
case ${LANG} in
  fr*)
    LABELS_TO_COMMANDS+=("Installation de ProtonUP-QT.");;
  *)
    LABELS_TO_COMMANDS+=("ProtonUP-QT installation.");;
esac
COMMANDS_TO_INSTALL+=("flatpak install --assumeyes --noninteractive flathub net.davidotek.pupgui2")

# Installation des dépendances pour Lutris
case ${LANG} in
  fr*)
    LABELS_TO_COMMANDS+=("Installation des dépendances pour Lutris.");;
  *)
    LABELS_TO_COMMANDS+=("Lutris dependancies installation.");;
esac
# org.freedesktop.Platform.GL32.default/x86_64/21.08 org.freedesktop.Platform.GL.default/x86_64/21.08 already installed at this point
COMMANDS_TO_INSTALL+=("flatpak install --assumeyes --noninteractive flathub org.gnome.Platform.Compat.i386/x86_64/41")
# Installation de Lutris
case ${LANG} in
  fr*)
    LABELS_TO_COMMANDS+=("Installation de Lutris.");;
  *)
    LABELS_TO_COMMANDS+=("Lutris installation.");;
esac
COMMANDS_TO_INSTALL+=("flatpak install --user --assumeyes --noninteractive flathub-beta net.lutris.Lutris//beta")
# Installation de Flatseal
case ${LANG} in
  fr*)
    LABELS_TO_COMMANDS+=("Installation de Flatseal.");;
  *)
    LABELS_TO_COMMANDS+=("Flatseal installation.");;
esac
COMMANDS_TO_INSTALL+=("flatpak install --assumeyes --noninteractive flathub com.github.tchx84.Flatseal")
# Installation de Mangohud
case ${LANG} in
  fr*)
    LABELS_TO_COMMANDS+=("Installation de Mangohud.");;
  *)
    LABELS_TO_COMMANDS+=("Mangohud installation.");;
esac
COMMANDS_TO_INSTALL+=("flatpak install --assumeyes --noninteractive flathub org.freedesktop.Platform.VulkanLayer.MangoHud")
# Installation de Discord
case ${LANG} in
  fr*)
    LABELS_TO_COMMANDS+=("Installation de Discord.");;
  *)
    LABELS_TO_COMMANDS+=("Discord installation.");;
esac
COMMANDS_TO_INSTALL+=("flatpak install --assumeyes --noninteractive flathub com.discordapp.Discord")
# Installation de OpenRGB
case ${LANG} in
  fr*)
    LABELS_TO_COMMANDS+=("Installation de OpenRGB.");;
  *)
    LABELS_TO_COMMANDS+=("OpenRGB installation.");;
esac
COMMANDS_TO_INSTALL+=("flatpak install --assumeyes --noninteractive flathub org.openrgb.OpenRGB")
# Installation de Spotify
case ${LANG} in
  fr*)
    LABELS_TO_COMMANDS+=("Installation de Spotify.");;
  *)
    LABELS_TO_COMMANDS+=("Spotify installation.");;
esac
COMMANDS_TO_INSTALL+=("flatpak install --assumeyes --noninteractive flathub com.spotify.Client")
# Installation de OBS Studio
case ${LANG} in
  fr*)
    LABELS_TO_COMMANDS+=("Installation de OBS Studio.");;
  *)
    LABELS_TO_COMMANDS+=("OBS Studio installation.");;
esac
COMMANDS_TO_INSTALL+=("flatpak install --assumeyes --noninteractive flathub com.obsproject.Studio")
# Installation de Kdenlive
case ${LANG} in
  fr*)
    LABELS_TO_COMMANDS+=("Installation de Kdenlive.");;
  *)
    LABELS_TO_COMMANDS+=("Kdenlive installation.");;
esac
COMMANDS_TO_INSTALL+=("flatpak install --assumeyes --noninteractive flathub org.kde.kdenlive")
# Installation de GtkStressTesting
case ${LANG} in
  fr*)
    LABELS_TO_COMMANDS+=("Installation de GtkStressTesting.");;
  *)
    LABELS_TO_COMMANDS+=("GtkStressTesting installation.");;
esac
COMMANDS_TO_INSTALL+=("flatpak install --assumeyes --noninteractive flathub com.leinardi.gst")

TOTAL_COMMANDS=${#COMMANDS_TO_INSTALL[@]}

# set the password variable to empty
PASSWRD=""
################################################################################################
err_report() {
    echo "Warning: Error on line $1. Do not worry, we're dealing with it:"
}

trap 'err_report $LINENO' ERR

# Catastrophic error and terminate
gf_die()
{
    echo "$@"
    exit 1
}

Gaming-Flatpak_usage()
{
	case ${LANG} in
		fr*)
			cat <<_EOF_
Utilisation : $0 [options]
Installe des paquets Flatpak pour le jeu

Options :
	--gui		Force l'utilisation de fenêtres graphiques  (défaut=zenity)
	--gui=VAR	Choisissez 'zenity' ou 'kdialog' pour vos fenêtres
	--nogui		Installation en mode texte
	-h, --help	Écrit cette aide
	-v, --version	Écrit la version et sort
_EOF_
		;;
		*)
			cat <<_EOF_
Usage : $0 [options]
Install Flatpak packages for gaming

Options :
	--gui		Force GUI  (default=zenity)
	--gui=VAR	Choose 'zenity' or 'kdialog' for the GUI
	--nogui		Text installation
	-h, --help	Display this help
	-v, --version	Display version and exit
_EOF_
		;;
	esac
}

Gaming-Flatpak_detect_gui()
{
	if [ -n "$1" ]; then
		if [ "$1" = "kdialog" ] && test -x "$(command -v kdialog 2>/dev/null)"; then
			GAMING_FLATPAK_GUI=kdialog
		elif [ "$1" = "kdialog" ] && ! test -x "$(command -v kdialog 2>/dev/null)"; then
			echo "Fatal Error: kdialog not found."
			echo "Please install kdialog."
			echo "--help for more options."
			exit 1	
		elif [ "$1" = "zenity" ] || [ "$1" = "--gui" ] && test -x "$(command -v zenity 2>/dev/null)"; then
			GAMING_FLATPAK_GUI=zenity
		elif [ "$1" = "zenity" ] || [ "$1" = "--gui" ] && ! test -x "$(command -v zenity 2>/dev/null)"; then
			echo "Fatal Error: zenity not found."
			echo "Please install zenity."
			echo "--help for more options."
			exit 1	
		else
			echo "Fatal Error: Invalid GUI option in --gui"
			echo "Valid options are 'zenity' or 'kdialog'"
			exit 1
		fi
	elif test -x "$(command -v zenity 2>/dev/null)"; then
		GAMING_FLATPAK_GUI=zenity
	elif test -x "$(command -v kdialog 2>/dev/null)"; then
		GAMING_FLATPAK_GUI=kdialog
	else
		echo "Fatal Error: We tried our best to start a GUI, but we failed."
		echo "Please install zenity or kdialog."
		echo "Or run with --nogui."
		exit 1
	fi
}		

Gaming-Flatpak_version()
{
	echo "Gaming Flatpak script ${GAMING_FLATPAK_VERSION}"
}

Gaming-Flatpak_options()
{
	case "$1" in
		--gui*) Gaming-Flatpak_detect_gui "${1##--gui=}";;
		--nogui) GAMING_FLATPAK_GUI=none;;
		-h|--help) Gaming-Flatpak_usage ; exit 0;;
		-v|--version) Gaming-Flatpak_version ; exit 0;;
		-*) gf_die "Fatal Error: unknown option $1";;
		*) return "${FALSE}" ;;
	esac
	return "${TRUE}"
}

Can_we_use_sudo()
if ( groups ${whoami} | grep sudo &>/dev/null ); then
	return "${TRUE}"
else
	return "${FALSE}"
fi

Deal_with_errors_on_installation()
{
if [[ "$ANY_ERROR" == *"Remotes found with refs similar to"* || "$ANY_ERROR" == *"Remote ‘flathub’ found in multiple installations:"* ]]; then
	# We need to explicitly tell it is for a system wide installation!
	COMMANDS_TO_INSTALL[$i]=${COMMANDS_TO_INSTALL[$i]/flatpak install/flatpak install --system}
	# Rerun the command
	ANY_ERROR=`${COMMANDS_TO_INSTALL[$i]} 2>&1`
fi	
	
if [[ "$ANY_ERROR" == *"error: Flatpak system operation Configure not allowed for user"* || "$ANY_ERROR" == *"Flatpak system operation Deploy not allowed for user"* ]]; then
	# We need sudo or su to perform this command!
	# Do we have the password yet ?
	if [ -z "$PASSWRD" ]; then
		case ${GAMING_FLATPAK_GUI} in
			zenity)
				if Can_we_use_sudo ; then
					PASSWRD=$(zenity --password --title="sudo")
				else
					PASSWRD=$(zenity --password --title="su, mot de passe root")
				fi
				;;
			kdialog)
				if Can_we_use_sudo ; then
					PASSWRD=$(kdialog --title "sudo" --password "[sudo] Votre mot de passe : ")
				else
					PASSWRD=$(kdialog --title "su" --password "[su] Le mot de passe root : ")
				fi
				;;
			none)
				if Can_we_use_sudo ; then
					read -sp "[sudo] Votre mot de passe : " PASSWRD
				else
					read -sp "[su] Le mot de passe root : " PASSWRD
				fi
				;;
		esac	
	fi
	# Rerun the command with sudo or su
	# We are root, make sure we do not install for the root user only!
	COMMANDS_TO_INSTALL[$i]=${COMMANDS_TO_INSTALL[$i]/--user/--system}
	if Can_we_use_sudo ; then
		echo "$PASSWRD" | sudo -S ${COMMANDS_TO_INSTALL[$i]}
	else
		{ sleep 3; echo "$PASSWRD"; } | script -q -c "su -c '${COMMANDS_TO_INSTALL[$i]}'" /dev/null
	fi
fi
}
###########################################################################################
# Script start here:
if ! Gaming-Flatpak_options "$1"; then
	# If there is no options, we want a GUI
	Gaming-Flatpak_detect_gui
fi

# DEBUG
#echo "${GAMING_FLATPAK_GUI}"

#DISTRIB=awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }'
#echo "$DISTRIB"
#if [[ $DISTRIB == *ubuntu* ]] ; then
#
#fi 

# Make sure Flatpak is installed, if not open the web page to setup flatpak on the distribution
if ! test -x "$(command -v flatpak 2>/dev/null)"; then
	xdg-open https://flatpak.org/setup/
	sleep 2
	case ${LANG} in
		fr*)
		PLEASE_INSTALL_FLATPAK="Avant de continuer, veuillez installer Flatpak en suivant les instructions du site web.\n https://flatpak.org/setup/"
		;;
		*)
		PLEASE_INSTALL_FLATPAK="Before preceeding, please install fLatpak by following the instructions on the website.\n https://flatpak.org/setup/"
		;;
	esac
	case ${GAMING_FLATPAK_GUI} in
		zenity)
			zenity --warning --text="${PLEASE_INSTALL_FLATPAK}"
			;;
		kdialog)
			kdialog --sorry "${PLEASE_INSTALL_FLATPAK}"
			;;
		none)
			echo "${PLEASE_INSTALL_FLATPAK}"
			;;
	esac
fi

# we wait for the installation of flatpak to complete. 
if ! test -x "$(command -v flatpak 2>/dev/null)"; then
	while ! test -x "$(command -v flatpak 2>/dev/null)"
		do
		sleep 5
	done
	# Let's wait a bit more in case the system need some more time to finish the installation
	sleep 10
fi

case ${GAMING_FLATPAK_GUI} in
	zenity)
(
for (( i = 0; i < ${#COMMANDS_TO_INSTALL[@]}; i++ ))
do
	PERCENT=$(($i*100/${TOTAL_COMMANDS}))
	echo "$PERCENT"
	echo "# ${LABELS_TO_COMMANDS[$i]}"
	ANY_ERROR=`${COMMANDS_TO_INSTALL[$i]} 2>&1`
	Deal_with_errors_on_installation
done
# We do not want to store the password any more than necessary!
unset PASSWRD
) |
zenity --progress \
  --title="Progression de l'installation de Gaming-Flatpak..." \
  --text="Mise à jour des dépôts Flatpak" \
  --percentage=0 \
  --auto-close \
  --auto-kill

(( $? != 0 )) && zenity --error --text="Erreur dans l'installation !"

zenity --info --text="Installation complète de Gaming-Flatpak."
		;;
	kdialog)
# Let's find out which name qdbus has on this system:
if test -x "$(command -v qdbus-qt5 2>/dev/null)"; then
	QDBUS_NAME="qdbus-qt5"
elif test -x "$(command -v qdbus 2>/dev/null)"; then
	QDBUS_NAME="qdbus"
else
	echo "Fatal error: qdbus is not installed."
	echo "We cannot use the GUI."
	echo "Please install qdbus, or use --nogui."
	exit 1
fi
dbusRef=`kdialog --title "Progression de l'installation de Gaming-Flatpak..." --progressbar "Mise à jour des dépôts Flatpak" $TOTAL_COMMANDS`
for (( i = 0; i < ${#COMMANDS_TO_INSTALL[@]}; i++ ))
do
	${QDBUS_NAME} $dbusRef Set "" value $i
	${QDBUS_NAME} $dbusRef setLabelText "${LABELS_TO_COMMANDS[$i]}"
	
	ANY_ERROR=`${COMMANDS_TO_INSTALL[$i]} 2>&1`
	Deal_with_errors_on_installation
done
# We do not want to store the password any more than necessary!
unset PASSWRD
${QDBUS_NAME} $dbusRef close
kdialog --msgbox "Installation complète de Gaming-Flatpak."
		;;
	none)
for (( i = 0; i < ${#COMMANDS_TO_INSTALL[@]}; i++ ))
do
	PERCENT=$(($i*100/${TOTAL_COMMANDS}))
	echo "$PERCENT%"
	echo "${LABELS_TO_COMMANDS[$i]}"
	ANY_ERROR=`${COMMANDS_TO_INSTALL[$i]} 2>&1`
	# We want to read errors on the terminal.
	echo "$ANY_ERROR"
	Deal_with_errors_on_installation
done
# We do not want to store the password any more than necessary!
unset PASSWRD
echo "Installation complète de Gaming-Flatpak."
		;;
esac

