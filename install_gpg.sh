# LIB versions
GNUPG_VER=2.2.16
LIBGPG_ERROR_VER=1.40
LIBGCRYPT_VER=1.8.4
LIBKSBA_VER=1.6.0
LIBASSUAN_VER=2.5.3
NTBTLS_VER=0.1.2
NPTH_VER=1.6
PINENTRY_VER=1.1.0
GPGME_VER=1.13.0
GPA_VER=0.10.0


mkdir -p /var/src/gnupg2 || echo "Unable to create directory in /var/src"
cd /var/src/gnupg2 || exit 1


echo "Printing list of all keys in user keyring in case of issues following install..."
gpg --list-keys


echo "Retrieving GnuPG release signing keys from Ubuntu keyserver..."
gpg --keyserver keyserver.ubuntu.com --recv-keys 249B39D24F25E3B6 04376F3EE0856959 2071B08A33BD3F06 8A861B1C7EFD60D9

#Build and install libgpg-error
echo "Building and installing libgpg-error..."
wget -c https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-${LIBGPG_ERROR_VER}.tar.bz2
wget -c https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-${LIBGPG_ERROR_VER}.tar.bz2.sig
gpg --verify libgpg-error-${LIBGPG_ERROR_VER}.tar.bz2.sig 
tar xjvof libgpg-error-${LIBGPG_ERROR_VER}.tar.bz2

cd libgpg-error-${LIBGPG_ERROR_VER} || exit 1
autoreconf -fi 2>/dev/null
./configure
make -s
make check
make install
cd ..

# Build and install libgcrypt
echo "Building and installing libgcrypt..."
wget -c https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-${LIBGCRYPT_VER}.tar.bz2
wget -c https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-${LIBGCRYPT_VER}.tar.bz2.sig
gpg --verify libgcrypt-${LIBGCRYPT_VER}.tar.bz2.sig
tar xjof libgcrypt-${LIBGCRYPT_VER}.tar.bz2
cd libgcrypt-${LIBGCRYPT_VER} || exit 1
autoreconf -fi 2>/dev/null
./configure --enable-m-guard --with-capabilities
make -s
make check
make install
cd ..

# Build and install libksba
echo "Building and installing libksba..."
wget -c https://gnupg.org/ftp/gcrypt/libksba/libksba-${LIBKSBA_VER}.tar.bz2
wget -c https://gnupg.org/ftp/gcrypt/libksba/libksba-${LIBKSBA_VER}.tar.bz2.sig
gpg --verify libksba-${LIBKSBA_VER}.tar.bz2.sig
tar xjof libksba-${LIBKSBA_VER}.tar.bz2
cd libksba-${LIBKSBA_VER} || exit 1
autoreconf -fi 2>/dev/null
./configure
make -s
make check
make install
cd ..

# Build and install libassuan
echo "Building and installing libassuan..."
wget -c https://gnupg.org/ftp/gcrypt/libassuan/libassuan-${LIBASSUAN_VER}.tar.bz2
wget -c https://gnupg.org/ftp/gcrypt/libassuan/libassuan-${LIBASSUAN_VER}.tar.bz2.sig
gpg --verify libassuan-${LIBASSUAN_VER}.tar.bz2.sig
tar xjof libassuan-${LIBASSUAN_VER}.tar.bz2
cd libassuan-${LIBASSUAN_VER} || exit 1
autoreconf -fi 2>/dev/null
./configure
make -s
make check
make install
cd ..

# Build and install ntbTLS
echo "Building and installing ntbtls..."
wget -c https://gnupg.org/ftp/gcrypt/ntbtls/ntbtls-${NTBTLS_VER}.tar.bz2
wget -c https://gnupg.org/ftp/gcrypt/ntbtls/ntbtls-${NTBTLS_VER}.tar.bz2.sig
gpg --verify ntbtls-${NTBTLS_VER}.tar.bz2.sig
tar xjof ntbtls-${NTBTLS_VER}.tar.bz2
cd ntbtls-${NTBTLS_VER} || exit 1
autoreconf -fi 2>/dev/null
./configure
make -s
make install
cd ..

# Build and install nPth
echo "Building and installing npth..."
wget -c https://gnupg.org/ftp/gcrypt/npth/npth-${NPTH_VER}.tar.bz2
wget -c https://gnupg.org/ftp/gcrypt/npth/npth-${NPTH_VER}.tar.bz2.sig
gpg --verify npth-${NPTH_VER}.tar.bz2.sig
tar xjof npth-${NPTH_VER}.tar.bz2
cd npth-${NPTH_VER} || exit 1
autoreconf -fi 2>/dev/null
./configure
make -s
make check
make install
cd ..

# Build and install Pinentry
echo "Building and installing pinentry..."
wget -c https://gnupg.org/ftp/gcrypt/pinentry/pinentry-${PINENTRY_VER}.tar.bz2
wget -c https://gnupg.org/ftp/gcrypt/pinentry/pinentry-${PINENTRY_VER}.tar.bz2.sig
gpg --verify pinentry-${PINENTRY_VER}.tar.bz2.sig
tar xjof pinentry-${PINENTRY_VER}.tar.bz2
cd pinentry-${PINENTRY_VER} || exit 1
autoreconf -fi 2>/dev/null
./configure --enable-libsecret --enable-pinentry-tty --enable-pinentry-qt --enable-pinentry-gnome3
make -s
make install
cd ..

# Build and install GPGME
echo "Building and installing gpgme..."
wget -c https://gnupg.org/ftp/gcrypt/gpgme/gpgme-${GPGME_VER}.tar.bz2
wget -c https://gnupg.org/ftp/gcrypt/gpgme/gpgme-${GPGME_VER}.tar.bz2.sig
gpg --verify gpgme-${GPGME_VER}.tar.bz2.sig
tar xjof gpgme-${GPGME_VER}.tar.bz2
cd gpgme-${GPGME_VER} || exit 1
autoreconf -fi 2>/dev/null
./configure
make -s
make check
make install
cd ..

# Build and install GPA
echo "Building and installing gpa..."
wget -c https://gnupg.org/ftp/gcrypt/gpa/gpa-${GPA_VER}.tar.bz2
wget -c https://gnupg.org/ftp/gcrypt/gpa/gpa-${GPA_VER}.tar.bz2.sig
gpg --verify gpa-${GPA_VER}.tar.bz2.sig
tar xjof gpa-${GPA_VER}.tar.bz2
cd gpa-${GPA_VER} || exit 1
autoreconf -fi 2>/dev/null
./configure
make -s
make install
cd ..

# linking the libs
echo "/usr/local/lib" >>  /etc/ld.so.conf
# reload config
ldconfig -v

echo "Building and installing GnuPG version ${GNUPG_VER}"
wget -c https://gnupg.org/ftp/gcrypt/gnupg/gnupg-${GNUPG_VER}.tar.bz2
wget -c https://gnupg.org/ftp/gcrypt/gnupg/gnupg-${GNUPG_VER}.tar.bz2.sig
gpg --verify gnupg-${GNUPG_VER}.tar.bz2.sig
tar xjof gnupg-${GNUPG_VER}.tar.bz2
cd gnupg-${GNUPG_VER} || exit 1
echo "Creating dest folder for binaries"
mkdir dest
autoreconf -fi 2>/dev/null
./configure --sysconfdir=/etc --localstatedir=/var \
--enable-g13 --enable-symcryptrun --enable-large-secmem --with-capabilities --prefix=/var/src/gnupg2/gnupg-${GNUPG_VER}/dest
make -s
make check
make install
