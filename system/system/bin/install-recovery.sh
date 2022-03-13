#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/13540000.dwmmc0/by-name/RECOVERY:29243408:9d1fff5b9bda029e760686675cd25ed76deb2511; then
  applypatch --bonus /system/etc/recovery-resource.dat \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/13540000.dwmmc0/by-name/BOOT:23007248:e3f6ca71a465d89c991040b9f572f44682e4734a \
          --target EMMC:/dev/block/platform/13540000.dwmmc0/by-name/RECOVERY:29243408:9d1fff5b9bda029e760686675cd25ed76deb2511 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
