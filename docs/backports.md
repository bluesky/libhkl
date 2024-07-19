# Install Hkl pre-built from Debian backports

Consider installing a prebuilt from [Debian
backports](https://packages.debian.org/stable-backports/ghkl).

    Package: ghkl (5.0.0.3462-1~bpo12+1)

but no libhkl.so

- http://http.us.debian.org/debian/pool/main/h/hkl/libhkl5_5.0.0.3462-1_amd64.deb
- http://http.us.debian.org/debian/pool/main/h/hkl/libhkl5_5.0.0.3462-1~bpo12+1_arm64.deb
- http://http.us.debian.org/debian/pool/main/h/hkl/libhkl-dev_5.0.0.3462-1_amd64.deb
- http://http.us.debian.org/debian/pool/main/h/hkl/libhkl-dev_5.0.0.3462-1~bpo12+1_amd64.deb

On to something here.  Tried: `dpkg -i libhkl*.deb`.
Needs more pre-requisites:

```bash
 libhkl-dev depends on gir1.2-hkl-5.0 (= 5.0.0.3462-1); however:
  Package gir1.2-hkl-5.0 is not installed.
 libhkl5:amd64 depends on libc6 (>= 2.38); however:
  Version of libc6:amd64 on system is 2.36-9+deb12u7.
 libhkl5:amd64 depends on libglib2.0-0t64 (>= 2.79.0); however:
  Package libglib2.0-0t64 is not installed.
```
