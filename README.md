# Gaming-Flatpak
software group in Flatpak/AppImage

## Flatpak and Cie for gaming with fun. [ALPHA]
Gaming multi distribution with Flatpak.

## You need:

[Flatpak](https://flatpak.org/setup/)

## Installation
Grab the latest release ".tar.gz" from the right panel and decompress it.
Either double-click the script "gaming-flatpak.sh" directly, or open a terminal in the script's folder and from there :

`$ ./gaming-flatpak.sh`

## Options
```
$ ./gaming-flatpak.sh -h
Utilisation : ./gaming-flatpak.sh [options]
Installe des paquets Flatpak pour le jeu

Options :
  --gui    Force l'utilisation de fenêtres graphiques  (défaut=zenity)
  --gui=VAR  Choisissez 'zenity' ou 'kdialog' pour vos fenêtres
  --nogui    Installation en mode texte
  -h, --help  Écrit cette aide
  -v, --version  Écrit la version et sort
```

## Features
* Install flatpaks, using a special selection for gaming on GNU/Linux.
* Support as much distributions as possible, if it can install flatpak.
* Interface for Gnome (Zenity), KDE (Kdialog) and Command line (Bash)
![Gnome](img/gf-zenity.png)
![KDE](img/gf-kdialog.png)
![Cli](img/gf-cli.png)

* multi language support (currently French and mostly English)

## Sources:
- https://github.com/flathub/com.valvesoftware.Steam
- https://github.com/GloriousEggroll/proton-ge-custom
- https://github.com/DavidoTek/ProtonUp-Qt
- https://github.com/flathub/net.lutris.Lutris
- https://github.com/tchx84/Flatseal
- https://github.com/flightlessmango/MangoHud
- https://github.com/flathub/com.discordapp.Discord
- https://gitlab.com/CalcProgrammer1/OpenRGB
