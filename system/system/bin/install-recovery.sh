#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:25165824:d52a5f43d2436fc81cb61fde9869423af0648ef4; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:25165824:016cc4174a5168407a7dfe6361f4e6b34224ec1a \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:25165824:d52a5f43d2436fc81cb61fde9869423af0648ef4 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
