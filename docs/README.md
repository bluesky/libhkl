# **libhkl** Notes

* [release overview](./releases/README.md)
* [project maintainers](../MAINTAINERS.md)
* [build](../builder/README.md)
* [tests](../tests/README.md)

## Overview of the Design

This repository defines two virtual machine images (via Dockerfiles).  The
`builder` VM creates `libhkl.tar.gz` from the Hkl
[source](https://repo.or.cz/hkl.git).  The `tests` VM tests that the `hklpy`
package can be used with the new `libhkl.tar.gz`.

## Install Hkl pre-built from Debian backports

Consider installing a prebuilt binary or library package from [Debian
backports](https://packages.debian.org/stable-backports/ghkl).  For example:

    Package: ghkl (5.0.0.3462-1~bpo12+1)

Note:  Package `ghkl` does not provide `libhkl.so`.  That library
is provided by `libhkl-dev`.  Such as:

- http://http.us.debian.org/debian/pool/main/h/hkl/libhkl5_5.0.0.3462-1_amd64.deb
- http://http.us.debian.org/debian/pool/main/h/hkl/libhkl5_5.0.0.3462-1~bpo12+1_arm64.deb
- http://http.us.debian.org/debian/pool/main/h/hkl/libhkl-dev_5.0.0.3462-1_amd64.deb
- http://http.us.debian.org/debian/pool/main/h/hkl/libhkl-dev_5.0.0.3462-1~bpo12+1_amd64.deb
