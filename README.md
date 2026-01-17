# 自定义OpenWrt编译器

使用GitHub Actions在线编译器，快捷方便，编译时间看个人选择的软件所决定

---

## 使用方法

首先，这个仓库适用于会本地编译生成`.config`文件的人，如果你不会，还是先去学学一下吧

本仓库使用的是**ImmortalWrt**源，想要使用其它源请在`.github/workflows/OpenWrt.yml`文件中修改`克隆源码`部分，然后自行修改底下的修改feeds.conf.default软件包部分

然后上传本地生成的`.config`文件到仓库根目录为`config`文件，然后启动Actions即可

---

### **注意！** 免费用户的Actions Runner空间为73G，请注意你的编译时所需的大小

### 参考用量

- 编译前

```
Run df -hT
Filesystem     Type   Size  Used Avail Use% Mounted on
/dev/root      ext4    73G   33G   40G  46% /
tmpfs          tmpfs  7.9G  172K  7.9G   1% /dev/shm
tmpfs          tmpfs  3.2G  1.1M  3.2G   1% /run
tmpfs          tmpfs  5.0M     0  5.0M   0% /run/lock
/dev/sda15     vfat   105M  6.1M   99M   6% /boot/efi
/dev/sdb1      ext4    74G  4.1G   66G   6% /mnt
tmpfs          tmpfs  1.6G   12K  1.6G   1% /run/user/1001
tmpfs          tmpfs  7.9G     0  7.9G   0% /run/qemu
```

- 编译后（添加一些插件）

```
Run df -hT
Filesystem     Type   Size  Used Avail Use% Mounted on
/dev/root      ext4    73G   59G   14G  81% /
tmpfs          tmpfs  7.9G  172K  7.9G   1% /dev/shm
tmpfs          tmpfs  3.2G  1.1M  3.2G   1% /run
tmpfs          tmpfs  5.0M     0  5.0M   0% /run/lock
/dev/sda15     vfat   105M  6.1M   99M   6% /boot/efi
/dev/sdb1      ext4    74G  4.1G   66G   6% /mnt
tmpfs          tmpfs  1.6G   12K  1.6G   1% /run/user/1001
tmpfs          tmpfs  7.9G     0  7.9G   0% /run/qemu
```
