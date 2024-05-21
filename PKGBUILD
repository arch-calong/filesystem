# Maintainer: Philip Müller <philm@manjaro.org>
# Maintainer: Bernhard Landauer <bernhard@manjaro.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Sébastien Luttringer
# Contributor: Tom Gundersen <teg@jklm.no>

pkgname=filesystem
pkgver=2024.04.07
pkgrel=1
pkgdesc='Base Manjaro Linux files'
arch=('any')
license=('GPL-3.0-or-later')
url='https://manjaro.org'
depends=('iana-etc')
backup=(
  'etc/crypttab'
  'etc/fstab'
  'etc/group'
  'etc/gshadow'
  'etc/host.conf'
  'etc/hosts'
  'etc/issue'
  'etc/ld.so.conf'
  'etc/nsswitch.conf'
  'etc/passwd'
  'etc/profile'
  'etc/resolv.conf'
  'etc/securetty'
  'etc/shadow'
  'etc/shells'
  'etc/subgid'
  'etc/subuid'
  'etc/hostname'
  'etc/modules-load.d/modules.conf'
)
source=(
  'crypttab'
  'env-generator'
  'fstab'
  'group'
  'gshadow'
  'host.conf'
  'hosts'
  'issue'
  'ld.so.conf'
  'locale.sh'
  'nsswitch.conf'
  'os-release'
  'passwd'
  'profile'
  'resolv.conf'
  'securetty'
  'shadow'
  'shells'
  'sysctl'
  'sysusers'
  'tmpfiles'
  'subgid'
  'subuid'
  'manjaro-release'
  'manjaro-logo.png'
  'manjaro-logo-text-dark.png'
  'home-local-bin.sh'
  'hostname'
  'modules.conf'
)
sha256sums=('e03bede3d258d680548696623d5979c6edf03272e801a813c81ba5a5c64f4f82'
            'ed0cb4f1db4021f8c3b5ce78fdf91d2c0624708f58f36c9cf867f4d93c3bc6da'
            'e54626e74ed8fee4173b62a545ab1c3a3a069e4217a0ee8fc398d9933e9c1696'
            '244f0718ee2a9d6862ae59d6c18c1dd1568651eada91a704574fa527fbac2b3a'
            '90d879374f77bac47f132164c1e7fc4892e994ff1d1ac376efa0c1c26ea37273'
            '4d7b647169063dfedbff5e1e22cee77bd1a4183dbcfd5e802e68939da4bbf733'
            'd9cd8a77d9e0aa5e90d7f4ed74c8745c17b525e720e28e4c44364150003c35f9'
            'aa59e888f2f4b6f565ae7f4057b987bfde07890a2ccde438abee2b93a93d96c0'
            'dad04a370e488aa85fb0a813a5c83cf6fd981ce01883fc59685447b092de84b5'
            '153d848ed51f2774e5a1578ea08e0c8586ecc63f7562697e035b84247edb2f82'
            '7c4596dafc51407fd87d571b4b0c6b54f13cbe47a33a45a3ec865ed37d42391a'
            'e3d00400c05ba305eee712cd618781e835632095185d26ea10fc2f30648a1721'
            '3eb104a1e8ff591da1d181b67c7db8d66b3e14579e3f9f06731b38c8ba830e12'
            '8f08231922fe185d3132f9aedded5cd688fb7c482a6f6f272402ded82fa4849a'
            '5557d8e601b17a80d1ea7de78a9869be69637cb6a02fbfe334e22fdf64e61d4c'
            'd88be2b45b43605ff31dd83d6a138069b6c2e92bc8989b7b9ab9eba8da5f8c7b'
            '6e13705ac4d6f69cdba118c6b70c722346fd3c45224133e6bbfe28aca719563c'
            '8ba0b52fe44cde8e6889f7bf8b27cd4a347694f20b25e3454814cadd3f921ef6'
            '6a9c9af2abd0cb29a6d68750067440105f0dca222edff015715ce9627fbe06c9'
            '30b97e8f5965744138f7a394e04454db6d509fb89e0a9b615bcd9037df3d6f2a'
            '3d8b9400ab811d1fbce405ea3f7712f0d8db7cd9491454c930c3a1023d4ef857'
            'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
            'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
            'fe1105d30f7bffbe9b4a09bfc807c61d6ca1efac35bc7a593ae2747cb6822f58'
            '014e8a09f88a73b1e5985dcb16a44004e341f5bba90043fa3d7fd7e3a56120cf'
            '31032e888cc8402907e2ef24f95959b9fa0f3547bb076b9fe4700aab79556739'
            'b3a0fe98c0859192fb0fe03a9033ca5c5c8b48e9d23466a355b7c95bd5601051'
            '295a881e674d14ee0c0e77f25236a8fd99a9453e5c33f635f55d2e8c6959c7ea'
            'a8a1cd5c81b11498d43ba0e0b5de53de6f154a395d54171f44d2874b4f659053')

package() {
  local group link mode source_file user
  declare -A directories
  declare -A files
  declare -A symlinks

  # associative array with directories and their assigned mode, user and group
  # all paths are relative to the root directory /
  directories=(
    ["boot"]="755:0:0"
    ["dev"]="755:0:0"
    ["etc"]="755:0:0"
    ["etc/ld.so.conf.d"]="755:0:0"
    ["etc/profile.d"]="755:0:0"
    ["etc/skel"]="755:0:0"
    ["home"]="755:0:0"
    ["mnt"]="755:0:0"
    ["opt"]="755:0:0"
    ["proc"]="555:0:0"
    ["root"]="0750:0:0"
    ["run"]="755:0:0"
    ["srv/http"]="755:0:0"
    ["srv/ftp"]="555:0:11"  # vsftpd won't run with write perms on /srv/ftp
    ["sys"]="555:0:0"
    ["tmp"]="1777:0:0"
    ["usr"]="755:0:0"
    ["usr/bin"]="755:0:0"
    ["usr/include"]="755:0:0"
    ["usr/lib"]="755:0:0"
    ["usr/lib/ld.so.conf.d"]="755:0:0"
    ["usr/local/bin"]="755:0:0"
    ["usr/local/etc"]="755:0:0"
    ["usr/local/games"]="755:0:0"
    ["usr/local/include"]="755:0:0"
    ["usr/local/lib"]="755:0:0"
    ["usr/local/man"]="755:0:0"
    ["usr/local/sbin"]="755:0:0"
    ["usr/local/share"]="755:0:0"
    ["usr/local/src"]="755:0:0"
    ["usr/share/factory/etc"]="755:0:0"
    ["usr/share/man/man1"]="755:0:0"
    ["usr/share/man/man2"]="755:0:0"
    ["usr/share/man/man3"]="755:0:0"
    ["usr/share/man/man4"]="755:0:0"
    ["usr/share/man/man5"]="755:0:0"
    ["usr/share/man/man6"]="755:0:0"
    ["usr/share/man/man7"]="755:0:0"
    ["usr/share/man/man8"]="755:0:0"
    ["usr/share/misc"]="755:0:0"
    ["usr/share/pixmaps"]="755:0:0"
    ["usr/src"]="755:0:0"
    ["var"]="755:0:0"
    ["var/cache"]="755:0:0"
    ["var/empty"]="755:0:0"
    ["var/games"]="775:0:50"  # allow setgid games (gid 50) to write scores
    ["var/lib/misc"]="755:0:0"
    ["var/local"]="755:0:0"
    ["var/log/old"]="755:0:0"
    ["var/opt"]="755:0:0"
    ["var/spool/mail"]="1777:0:0"
    ["var/tmp"]="1777:0:0"
  )

  # associative array with symlink names and their respective targets
  # all paths are relative to the root directory /
  symlinks=(
    ["bin"]="usr/bin"
    ["etc/mtab"]="../proc/self/mounts"
    ["lib"]="usr/lib"
    ["sbin"]="usr/bin"
    ["usr/local/share/man"]="../man"
    ["usr/sbin"]="bin"
    ["var/lock"]="../run/lock"
    ["var/mail"]="spool/mail"
    ["var/run"]="../run"
  )
  [[ $CARCH = 'x86_64' ]] && {
    symlinks["lib64"]="usr/lib"
    symlinks["usr/lib64"]="lib"
  }

  # associative array of target files, their source file, file mode, user and group ownership
  files=(
    ["etc/manjaro-release"]="manjaro-release:644:0:0"
    ["etc/modules-load.d/modules.conf"]="modules.conf:644:0:0"
    ["etc/profile.d/home-local-bin.sh"]="home-local-bin.sh:644:0:0"
    ["etc/crypttab"]="crypttab:600:0:0"
    ["etc/fstab"]="fstab:644:0:0"
    ["etc/group"]="group:644:0:0"
    ["etc/gshadow"]="gshadow:600:0:0"
    ["etc/hostname"]="hostname:644:0:0"
    ["etc/host.conf"]="host.conf:644:0:0"
    ["etc/hosts"]="hosts:644:0:0"
    ["etc/issue"]="issue:644:0:0"
    ["etc/ld.so.conf"]="ld.so.conf:644:0:0"
    ["etc/nsswitch.conf"]="nsswitch.conf:644:0:0"
    ["etc/passwd"]="passwd:644:0:0"
    ["etc/profile"]="profile:644:0:0"
    ["etc/profile.d/locale.sh"]="locale.sh:644:0:0"
    ["etc/resolv.conf"]="resolv.conf:644:0:0"
    ["etc/securetty"]="securetty:644:0:0"
    ["etc/shells"]="shells:644:0:0"
    ["etc/shadow"]="shadow:600:0:0"
    ["etc/subgid"]="subgid:644:0:0"
    ["etc/subuid"]="subuid:644:0:0"
    ["usr/lib/os-release"]="os-release:644:0:0"
    ["usr/lib/sysctl.d/10-manjaro.conf"]="sysctl:644:0:0"
    ["usr/lib/sysusers.d/manjaro.conf"]="sysusers:644:0:0"
    ["usr/lib/tmpfiles.d/manjaro.conf"]="tmpfiles:644:0:0"
    ["usr/lib/systemd/system-environment-generators/10-manjaro"]="env-generator:755:0:0"
    ["usr/share/factory/etc/manjaro-release"]="manjaro-release:644:0:0"
    ["usr/share/factory/etc/modules-load.d/modules.conf"]="modules.conf:644:0:0"
    ["usr/share/factory/etc/profile.d/home-local-bin.sh"]="home-local-bin.sh:644:0:0"
    ["usr/share/factory/etc/crypttab"]="crypttab:600:0:0"
    ["usr/share/factory/etc/fstab"]="fstab:644:0:0"
    ["usr/share/factory/etc/group"]="group:644:0:0"
    ["usr/share/factory/etc/gshadow"]="gshadow:600:0:0"
    ["usr/share/factory/etc/hostname"]="hostname:644:0:0"
    ["usr/share/factory/etc/host.conf"]="host.conf:644:0:0"
    ["usr/share/factory/etc/hosts"]="hosts:644:0:0"
    ["usr/share/factory/etc/issue"]="issue:644:0:0"
    ["usr/share/factory/etc/ld.so.conf"]="ld.so.conf:644:0:0"
    ["usr/share/factory/etc/nsswitch.conf"]="nsswitch.conf:644:0:0"
    ["usr/share/factory/etc/passwd"]="passwd:644:0:0"
    ["usr/share/factory/etc/profile"]="profile:644:0:0"
    ["usr/share/factory/etc/profile.d/locale.sh"]="locale.sh:644:0:0"
    ["usr/share/factory/etc/resolv.conf"]="resolv.conf:644:0:0"
    ["usr/share/factory/etc/securetty"]="securetty:644:0:0"
    ["usr/share/factory/etc/shadow"]="shadow:600:0:0"
    ["usr/share/factory/etc/shells"]="shells:644:0:0"
    ["usr/share/factory/etc/subgid"]="subgid:644:0:0"
    ["usr/share/factory/etc/subuid"]="subuid:644:0:0"
    ["usr/share/pixmaps/manjaro-logo.png"]="manjaro-logo.png:644:0:0"
    ["usr/share/pixmaps/manjaro-logo-text-dark.png"]="manjaro-logo-text-dark.png:644:0:0"
  )

  cd "$pkgdir"

  for dir in "${!directories[@]}"; do
    mode="$(cut -f 1 -d ':' <<< "${directories[$dir]}")"
    user="$(cut -f 2 -d ':' <<< "${directories[$dir]}")"
    group="$(cut -f 3 -d ':' <<< "${directories[$dir]}")"

    install -vdm "$mode" -o "$user" -g "$group" "$dir"
  done

  for link in "${!symlinks[@]}"; do
    ln -sv "${symlinks[$link]}" "$link"
  done

  for target_file in "${!files[@]}"; do
    source_file="$(cut -f 1 -d ':' <<< "${files[$target_file]}")"
    mode="$(cut -f 2 -d ':' <<< "${files[$target_file]}")"
    user="$(cut -f 3 -d ':' <<< "${files[$target_file]}")"
    group="$(cut -f 4 -d ':' <<< "${files[$target_file]}")"

    install -vDm "$mode" -o "$user" -g "$group" "$srcdir/$source_file" "$target_file"
  done

  # Symlink manjaro-release > arch-release
  ln -s /usr/share/factory/etc/manjaro-release "$pkgdir"/usr/share/factory/etc/arch-release
  ln -s /etc/manjaro-release "$pkgdir"/etc/arch-release
}

# vim:set ts=2 sw=2 et:

