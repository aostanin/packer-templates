#! /bin/bash

chroot /mnt/gentoo /bin/bash <<EOF
/usr/bin/dbus-daemon --system
/usr/lib/systemd/systemd-localed &
/usr/lib/systemd/systemd-timedated &
/usr/lib/systemd/systemd-hostnamed &

echo "${GENTOO_LOCALE} ${GENTOO_LOCALE/*./}" > /etc/locale.gen
locale-gen
eselect locale set ${GENTOO_LOCALE}

localectl set-locale LANG=${GENTOO_LOCALE}
hostnamectl set-hostname ${GENTOO_HOSTNAME}
localectl set-keymap ${GENTOO_KEYMAP}
EOF

