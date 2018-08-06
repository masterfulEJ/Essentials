# Build My Own Vim (Eunjae)

> - Used for Ubuntu 18.04 (successfully)
> - Binding with Anaconda3-5.2.0 (python 3.6.5)

### Setup Needed BuildTools for Vim

```bash
sudo apt install libncurses5-dev libgnome2-dev libgnomeui-dev \
libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev git
```

### Setup Configuration
- Binding my Anaconda3 install to Vim Configure
```bash
cd ~
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-rubyinterp=yes \
            --enable-multibyte \
            --enable-python3interp=yes \
            --with-python3-config-dir=home/eunjaejang/anaconda3/lib/python3.6/config-3.6m-x86_64-linux-gnu \
            --enable-perlinterp=yes \
            --enable-cscope \
            --prefix=/usr/local
make VIMRUNTIMEDIR=/usr/local/share/vim/vim81
```

Add if needed:
```bash
(erased)    --enable-gui=gtk2 `
```

If you want to be able to easily uninstall vim use `checkinstall`:
```bash
sudo apt install checkinstall
cd ~/vim
sudo checkinstall
```

> Say `no` to all bullsits that come after

### Uninstall with:
```bash
$ dpkg -r vim
```
### Disable Upgrade:

```bash
$ sudo apt-mark hold vim
```
