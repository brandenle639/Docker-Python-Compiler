cd /tmp/
mkdir pybuilt
wget https://www.python.org/ftp/python/{Version}/Python-{Version}.tgz
tar xzf Python-{Version}.tgz
chmod +x -R Python-{Version}
cd Python-{Version}
./configure --prefix=/usr/local --enable-shared LDFLAGS="-Wl,-rpath /usr/local/lib" --enable-optimizations --with-lto --with-computed-gotos --with-system-ffi --enable-shared
make -j "$(nproc)"
./python{Version} -m test -j "$(nproc)"
make DESTDIR=/tmp/pybuilt install
rm /tmp/Python-{Version}.tgz
/usr/local/bin/python{Version} -m pip install --upgrade pip setuptools wheel
ln -s /usr/local/bin/python{Version}        /usr/local/bin/python{Version}
ln -s /usr/local/bin/python{Version}        /usr/local/bin/python
ln -s /usr/local/bin/pip{Version}           /usr/local/bin/pip{Version}
ln -s /usr/local/bin/pip{Version}           /usr/local/bin/pip
ln -s /usr/local/bin/pydoc{Version}         /usr/local/bin/pydoc
ln -s /usr/local/bin/idle{Version}          /usr/local/bin/idle
ln -s /usr/local/bin/python{Version}-config      /usr/local/bin/python-config
