#! /bin/bash

chroot /mnt/gentoo /bin/bash <<EOF
emerge --quiet-build net-misc/dhcpcd
systemctl enable dhcpcd.service
EOF

