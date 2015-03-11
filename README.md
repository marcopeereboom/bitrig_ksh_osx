# bitrig_ksh_osx
Bitrig's ksh for OSX.

If you aren't a bash fan and prefer a nice clean shell this is for you!

# Installation
Make sure you have the OSX command line tools installed.
Then type:
```
make
sudo make install
```

All files will end up in /usr/local.

To make this shell now be the default when starting Terminal open up it's
preferences and change "Shells open with:" to the "Command (complete path):"
option and type the following:
```
/usr/local/bin/ksh
```

Make sure to add
```
/usr/local/bin/ksh
```
to /etc/shells as well.

Enjoy!

# License
ksh is in the public domain.  There are some bits and pieces that were added to
osx.h that were lifted from Bitrig/OpenBSD that are ISC licensed.  See
individual files for details.
