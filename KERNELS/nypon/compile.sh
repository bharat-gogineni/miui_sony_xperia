rm boot.img
# make ramdisk image
cd ramdisk
find . | cpio --quiet -H newc -o | gzip > ../ramdisk.img
cd ..

# make kernel
./mkbootimg --cmdline 'cachepolicy=writealloc noinitrd init=init board_id=1 logo.nologo root=/dev/ram0 rw rootwait mem=96M@0 mem_mtrace=15M@96M mem_mshared=1M@111M mem_modem=16M@112M mem=32M@128M mem_issw=1M@160M hwmem=167M@161M mem=696M@328M vmalloc=384M console=ttyAMA2,115200n8 androidboot.console=ttyAMA2 androidboot.hardware=st-ericsson' --kernel zImage --ramdisk ramdisk.img --base 0x0 --output boot.img

