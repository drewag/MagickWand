# Swift MagickWand

[![Swift](https://img.shields.io/badge/swift-3.0-orange.svg?style=flat)](https://swift.org)
[![imagemagick](https://img.shields.io/badge/ImageMagick-6.9.x-orange.svg?style=flat)](https://www.imagemagick.org/script/index.php)
[![MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](/LICENSE)
[![Build Status](https://travis-ci.org/naithar/MagickWand.svg?branch=master)](https://travis-ci.org/naithar/MagickWand)
[![codebeat badge](https://codebeat.co/badges/fad61ebd-809c-4a22-995d-5633e314f119)](https://codebeat.co/projects/github-com-naithar-magickwand)
[![Code Climate](https://codeclimate.com/github/naithar/MagickWand/badges/gpa.svg)](https://codeclimate.com/github/naithar/MagickWand)
[![codecov](https://codecov.io/gh/naithar/MagickWand/branch/master/graph/badge.svg)](https://codecov.io/gh/naithar/MagickWand)
![platforms](https://img.shields.io/badge/platform-macOS%20Linux-green.svg?style=flat)
![SPM](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange.svg?style=flat)

This package supports 6.9.x version of ImageMagick.


## Intallation

### Mac OSX

##### Without Ghostscript (PDF) support

```
brew install imagemagick@6
```

##### With Ghostscript (PDF) support

```
brew install -i imagemagick@6 --with-ghostscript
./configure --disable-osx-universal-binary --prefix=/usr/local/Cellar/imagemagick@6/6.9.8-3 --disable-dependency-tracking --disable-silent-rules --enable-shared --enable-static --with-modules --disable-opencl --disable-openmp --without-webp --without-openjp2 --without-fftw --without-pango --without-x --with-freetype=yes --with-gslib=yes
make
make install
exit
```

### Linux

##### Without Ghostscript (PDF) support

```
sudo apt-get -y build-dep imagemagick
curl -OL https://www.imagemagick.org/download/releases/ImageMagick-6.9.6-8.tar.xz
tar xf ImageMagick-6.9.6-8.tar.xz
cd ImageMagick-6.9.6-8
./configure --prefix=/usr/local --disable-static --with-modules --without-perl --without-magick-plus-plus --with-quantum-depth=8 --disable-openmp --with-gs-font-dir=/usr/local/share/ghostscript/fonts
make
sudo make install
```

##### With Ghostscript (PDF) support

```
sudo apt-get -y build-dep imagemagick
sudo apt-get install libgs-dev gs-esp
curl -OL https://www.imagemagick.org/download/releases/ImageMagick-6.9.6-8.tar.xz
tar xf ImageMagick-6.9.6-8.tar.xz
cd ImageMagick-6.9.6-8
./configure --prefix=/usr/local --disable-static --with-modules --without-perl --without-magick-plus-plus --with-quantum-depth=8 --disable-openmp --with-gs-font-dir=/usr/local/share/ghostscript/fonts --with-gslib=yes
make
sudo make install
```

### Add Package

Add this package to `dependencies` in your `Package.swift` file.

```
.Package(url: "https://github.com/naithar/MagickWand.git", majorVersion: 0)
```

## Building and Testing

### Mac OSX

```
swift build -Xswiftc -I/usr/local/opt/imagemagick@6/include/ImageMagick-6 -Xlinker -L/usr/local/opt/imagemagick@6/lib -Xcc -DMAGICKCORE_HDRI_ENABLE=0 -Xcc -DMAGICKCORE_QUANTUM_DEPTH=16

swift test -Xswiftc -I/usr/local/opt/imagemagick@6/include/ImageMagick-6 -Xlinker -L/usr/local/opt/imagemagick@6/lib -Xcc -DMAGICKCORE_HDRI_ENABLE=0 -Xcc -DMAGICKCORE_QUANTUM_DEPTH=16
```

### Linux

```
swift build -Xswiftc -I/usr/local/include/ImageMagick-6/ -Xlinker -L/usr/local/lib/ -Xcc -DMAGICKCORE_HDRI_ENABLE=0 -Xcc -DMAGICKCORE_QUANTUM_DEPTH=8

swift test  -Xswiftc -I/usr/local/include/ImageMagick-6/ -Xlinker -L/usr/local/lib/ -Xcc -DMAGICKCORE_HDRI_ENABLE=0 -Xcc -DMAGICKCORE_QUANTUM_DEPTH=8
```

## XCode Setup

Generate XCode project using:
```
swift package -Xswiftc -I/usr/local/opt/imagemagick@6/include/ImageMagick-6 -Xlinker -L/usr/local/opt/imagemagick@6/lib -Xcc -DMAGICKCORE_HDRI_ENABLE=0 -Xcc -DMAGICKCORE_QUANTUM_DEPTH=16 generate-xcodeproj
```
This will add required flags to the project settings.

If required add values manually to `Build Settings`:
- `-I/usr/local/opt/imagemagick@6/include/ImageMagick-6` value to `Other Swift Flags`.
- `-L/usr/local/opt/imagemagick@6/lib` value to `Other Linker Flags`.
