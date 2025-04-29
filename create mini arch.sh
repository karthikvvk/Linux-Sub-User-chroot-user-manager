#!/bin/bash

# Step 1: Check if arch-install-scripts is installed, install if missing
if ! pacman -Qe | grep -q "^arch-install-scripts"; then
    echo "[INFO] Installing arch-install-scripts..."
    sudo pacman -Sy --noconfirm arch-install-scripts
else
    echo "[INFO] Packages Already Exists"
fi


# Step 2: Read name for chroot from user
read -rp "Enter name for chroot arch (e.g., miniarch): " CHROOT_NAME

# Step 3: Set CHROOT_DIR and ensure it reflects the correct name
export CHROOT_DIR="$HOME/$CHROOT_NAME"
echo "export CHROOT_DIR=\"$CHROOT_DIR\"" >> ~/.bashrc

# Step 4: Create directory if it doesn't exist
if [ ! -d "$CHROOT_DIR" ]; then
    mkdir -p "$CHROOT_DIR"
else
    echo "[INFO] Root Already Exists"
fi

# Step 5: Proceed with original untouched commands
sudo pacstrap -c "$CHROOT_DIR/" base linux linux-firmware vim git sudo nano ntfs-3g
sudo cp /etc/resolv.conf "$CHROOT_DIR/etc/resolv.conf"
sudo mount /dev/sda2 "$CHROOT_DIR"

sudo mount --bind /dev              "$CHROOT_DIR/dev"
sudo mount --bind /dev/pts          "$CHROOT_DIR/dev/pts"
sudo mount --bind /proc             "$CHROOT_DIR/proc"
sudo mount --bind /sys              "$CHROOT_DIR/sys"
sudo mount --bind /run              "$CHROOT_DIR/run"


echo "useradd -m miniuser"
echo "passwd miniuser"
echo "usermod -aG wheel miniuser"



sudo chroot "$CHROOT_DIR/" /bin/bash
#sudo arch-chroot $CHROOT_DIR

