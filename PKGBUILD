# Maintainer: 
# Contributor: 

pkgname=Gaming-Flatpak
pkgver=0.2
pkgrel=1
pkgdesc="Easy installation of gaming tools using Flatpak."
arch=('x86_64')
url="https://github.com/sevmek/$pkgname"
license=('GPL3')
depends=('flatpak' 'bash')
optdepends=('zenity' 'kdialog')
provides=("$pkgname")
source=("https://github.com/sevmek/Gaming-Flatpak/archive/refs/tags/v0.2-alpha.tar.gz")

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/gaming-flatpak.sh" "$pkgdir/usr/bin/gaming-flatpak"
  install -Dm644 "$srcdir/$pkgname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
