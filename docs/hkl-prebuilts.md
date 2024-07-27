# Install Hkl pre-built from Debian backports

Consider installing a prebuilt binary or library package from [Debian
backports](https://packages.debian.org/stable-backports/ghkl).  For example:

    Package: ghkl (5.0.0.3462-1~bpo12+1)

Note:  Package `ghkl` does not provide `libhkl.so`.  That library
is provided by `libhkl-dev`.  Such as:

- http://http.us.debian.org/debian/pool/main/h/hkl/libhkl5_5.0.0.3462-1_amd64.deb
- http://http.us.debian.org/debian/pool/main/h/hkl/libhkl5_5.0.0.3462-1~bpo12+1_arm64.deb
- http://http.us.debian.org/debian/pool/main/h/hkl/libhkl-dev_5.0.0.3462-1_amd64.deb
- http://http.us.debian.org/debian/pool/main/h/hkl/libhkl-dev_5.0.0.3462-1~bpo12+1_amd64.deb
