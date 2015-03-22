#!/bin/bash
arch=$(uname -m)

case $arch in
x86_64)
	arch=amd64
	;;
i?86)
	arch=i386
	;;
armv7?)
	arch=armhf
	;;
arm64|aarch64)
	arch=arm64
	;;
ppc64el)
	;;
*)
	echo >&2 "error: unknown architecture $arch"
	exit 1
	;;
esac

export UBUNTU_ARCH=$arch
