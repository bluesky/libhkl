# Issue #20 notes

During the build process, the first indication is here:

```bash
#11 177.5 make[2]: Entering directory '/home/gsl'
...
#11 177.7 /bin/bash ./libtool  --tag=CC   --mode=link gcc  -g -O2  -version-info 26:0:1  -o libgsl.la -rpath /usr/lib version.lo  block/libgslblock.la blas/libgslblas.la bspline/libgslbspline.la bst/libgslbst.la complex/libgslcomplex.la cheb/libgslcheb.la dht/libgsldht.la diff/libgsldiff.la deriv/libgslderiv.la eigen/libgsleigen.la err/libgslerr.la fft/libgslfft.la filter/libgslfilter.la fit/libgslfit.la histogram/libgslhistogram.la ieee-utils/libgslieeeutils.la integration/libgslintegration.la interpolation/libgslinterpolation.la linalg/libgsllinalg.la matrix/libgslmatrix.la min/libgslmin.la monte/libgslmonte.la multifit/libgslmultifit.la multifit_nlinear/libgslmultifit_nlinear.la multilarge/libgslmultilarge.la multilarge_nlinear/libgslmultilarge_nlinear.la multimin/libgslmultimin.la multiroots/libgslmultiroots.la ntuple/libgslntuple.la ode-initval/libgslodeiv.la ode-initval2/libgslodeiv2.la permutation/libgslpermutation.la combination/libgslcombination.la multiset/libgslmultiset.la poly/libgslpoly.la qrng/libgslqrng.la randist/libgslrandist.la rng/libgslrng.la roots/libgslroots.la siman/libgslsiman.la sort/libgslsort.la specfunc/libgslspecfunc.la movstat/libgslmovstat.la rstat/libgslrstat.la statistics/libgslstatistics.la sum/libgslsum.la sys/libgslsys.la test/libgsltest.la utils/libutils.la vector/libgslvector.la cdf/libgslcdf.la wavelet/libgslwavelet.la spmatrix/libgslspmatrix.la spblas/libgslspblas.la splinalg/libgslsplinalg.la -lm 
#11 178.0 libtool: link: gcc -shared  -fPIC -DPIC  .libs/version.o  -Wl,--whole-archive block/.libs/libgslblock.a blas/.libs/libgslblas.a bspline/.libs/libgslbspline.a bst/.libs/libgslbst.a complex/.libs/libgslcomplex.a cheb/.libs/libgslcheb.a dht/.libs/libgsldht.a diff/.libs/libgsldiff.a deriv/.libs/libgslderiv.a eigen/.libs/libgsleigen.a err/.libs/libgslerr.a fft/.libs/libgslfft.a filter/.libs/libgslfilter.a fit/.libs/libgslfit.a histogram/.libs/libgslhistogram.a ieee-utils/.libs/libgslieeeutils.a integration/.libs/libgslintegration.a interpolation/.libs/libgslinterpolation.a linalg/.libs/libgsllinalg.a matrix/.libs/libgslmatrix.a min/.libs/libgslmin.a monte/.libs/libgslmonte.a multifit/.libs/libgslmultifit.a multifit_nlinear/.libs/libgslmultifit_nlinear.a multilarge/.libs/libgslmultilarge.a multilarge_nlinear/.libs/libgslmultilarge_nlinear.a multimin/.libs/libgslmultimin.a multiroots/.libs/libgslmultiroots.a ntuple/.libs/libgslntuple.a ode-initval/.libs/libgslodeiv.a ode-initval2/.libs/libgslodeiv2.a permutation/.libs/libgslpermutation.a combination/.libs/libgslcombination.a multiset/.libs/libgslmultiset.a poly/.libs/libgslpoly.a qrng/.libs/libgslqrng.a randist/.libs/libgslrandist.a rng/.libs/libgslrng.a roots/.libs/libgslroots.a siman/.libs/libgslsiman.a sort/.libs/libgslsort.a specfunc/.libs/libgslspecfunc.a movstat/.libs/libgslmovstat.a rstat/.libs/libgslrstat.a statistics/.libs/libgslstatistics.a sum/.libs/libgslsum.a sys/.libs/libgslsys.a test/.libs/libgsltest.a utils/.libs/libutils.a vector/.libs/libgslvector.a cdf/.libs/libgslcdf.a wavelet/.libs/libgslwavelet.a spmatrix/.libs/libgslspmatrix.a spblas/.libs/libgslspblas.a splinalg/.libs/libgslsplinalg.a -Wl,--no-whole-archive  -lm  -g -O2   -Wl,-soname -Wl,libgsl.so.25 -o .libs/libgsl.so.25.1.0
#11 178.2 libtool: link: (cd ".libs" && rm -f "libgsl.so.25" && ln -s "libgsl.so.25.1.0" "libgsl.so.25")
#11 178.2 libtool: link: (cd ".libs" && rm -f "libgsl.so" && ln -s "libgsl.so.25.1.0" "libgsl.so")
```

In the build VM, in `/home/gsl`:

```bash
root@797edd07a150:/home/gsl# git branch
* (HEAD detached at release-2-7)
  master
```

So far, so good.  Check for the hard-coded version:

```bash
root@797edd07a150:/home/gsl# grep GSL_VERSION gsl_version.h
#ifndef __GSL_VERSION_H__
#define __GSL_VERSION_H__
#define GSL_VERSION "2.7"
#endif /* __GSL_VERSION_H__ */
```

As expected.  Is it ever changed?

```bash
root@797edd07a150:/home/gsl# grep -R PACKAGE_VERSION . | grep = | grep 2 | sort
./autom4te.cache/output.0:PACKAGE_VERSION='2.7'
./autom4te.cache/output.1:PACKAGE_VERSION='2.7'
./blas/Makefile:PACKAGE_VERSION = 2.7
./block/Makefile:PACKAGE_VERSION = 2.7
./bspline/Makefile:PACKAGE_VERSION = 2.7
./bst/Makefile:PACKAGE_VERSION = 2.7
./cblas/Makefile:PACKAGE_VERSION = 2.7
./cdf/Makefile:PACKAGE_VERSION = 2.7
./cheb/Makefile:PACKAGE_VERSION = 2.7
./combination/Makefile:PACKAGE_VERSION = 2.7
./complex/Makefile:PACKAGE_VERSION = 2.7
./config.log:PACKAGE_VERSION='2.7'
./config.status:D["PACKAGE_VERSION"]=" \"2.7\""
./config.status:S["PACKAGE_VERSION"]="2.7"
./configure:PACKAGE_VERSION='2.7'
./const/Makefile:PACKAGE_VERSION = 2.7
./deriv/Makefile:PACKAGE_VERSION = 2.7
./dht/Makefile:PACKAGE_VERSION = 2.7
./diff/Makefile:PACKAGE_VERSION = 2.7
./doc/examples/Makefile:PACKAGE_VERSION = 2.7
./doc/Makefile:PACKAGE_VERSION = 2.7
./eigen/Makefile:PACKAGE_VERSION = 2.7
./err/Makefile:PACKAGE_VERSION = 2.7
./fft/Makefile:PACKAGE_VERSION = 2.7
./filter/Makefile:PACKAGE_VERSION = 2.7
./fit/Makefile:PACKAGE_VERSION = 2.7
./gsl/Makefile:PACKAGE_VERSION = 2.7
./histogram/Makefile:PACKAGE_VERSION = 2.7
./ieee-utils/Makefile:PACKAGE_VERSION = 2.7
./integration/Makefile:PACKAGE_VERSION = 2.7
./interpolation/Makefile:PACKAGE_VERSION = 2.7
./linalg/Makefile:PACKAGE_VERSION = 2.7
./Makefile:PACKAGE_VERSION = 2.7
./matrix/Makefile:PACKAGE_VERSION = 2.7
./min/Makefile:PACKAGE_VERSION = 2.7
./monte/Makefile:PACKAGE_VERSION = 2.7
./movstat/Makefile:PACKAGE_VERSION = 2.7
./multifit_nlinear/Makefile:PACKAGE_VERSION = 2.7
./multifit/Makefile:PACKAGE_VERSION = 2.7
./multilarge_nlinear/Makefile:PACKAGE_VERSION = 2.7
./multilarge/Makefile:PACKAGE_VERSION = 2.7
./multimin/Makefile:PACKAGE_VERSION = 2.7
./multiroots/Makefile:PACKAGE_VERSION = 2.7
./multiset/Makefile:PACKAGE_VERSION = 2.7
./ntuple/Makefile:PACKAGE_VERSION = 2.7
./ode-initval/Makefile:PACKAGE_VERSION = 2.7
./ode-initval2/Makefile:PACKAGE_VERSION = 2.7
./ode-initval2/Makefile.in:PACKAGE_VERSION = @PACKAGE_VERSION@
./permutation/Makefile:PACKAGE_VERSION = 2.7
./poly/Makefile:PACKAGE_VERSION = 2.7
./qrng/Makefile:PACKAGE_VERSION = 2.7
./randist/Makefile:PACKAGE_VERSION = 2.7
./rng/Makefile:PACKAGE_VERSION = 2.7
./roots/Makefile:PACKAGE_VERSION = 2.7
./rstat/Makefile:PACKAGE_VERSION = 2.7
./siman/Makefile:PACKAGE_VERSION = 2.7
./sort/Makefile:PACKAGE_VERSION = 2.7
./spblas/Makefile:PACKAGE_VERSION = 2.7
./specfunc/Makefile:PACKAGE_VERSION = 2.7
./splinalg/Makefile:PACKAGE_VERSION = 2.7
./spmatrix/Makefile:PACKAGE_VERSION = 2.7
./statistics/Makefile:PACKAGE_VERSION = 2.7
./sum/Makefile:PACKAGE_VERSION = 2.7
./sys/Makefile:PACKAGE_VERSION = 2.7
./test/Makefile:PACKAGE_VERSION = 2.7
./utils/Makefile:PACKAGE_VERSION = 2.7
./vector/Makefile:PACKAGE_VERSION = 2.7
./wavelet/Makefile:PACKAGE_VERSION = 2.7
```

All good.  Next, suspect the linking.

It's `libtool` that
[produces](https://github.com/bluesky/libhkl/pull/21#issuecomment-2231282244)
the GSL 2.5 dependency.  Since `libtool` is built dynamically, the problem must
be with its
[configuration](https://www.gnu.org/software/libtool/manual/html_node/Configuring.html).

When `libtool` is run, the wrong version appears in the logs:

```bash
-Wl,-soname -Wl,libgsl.so.25 -o .libs/libgsl.so.25.1.0
```

Searching:

```bash
root@797edd07a150:/home/gsl# grep soname libtool 
soname_spec="\$libname\$release\$shared_ext\$major"
archive_cmds="\$CC -shared \$pic_flag \$libobjs \$deplibs \$compiler_flags \$wl-soname \$wl\$soname -o \$lib"
            \$CC -shared \$pic_flag \$libobjs \$deplibs \$compiler_flags \$wl-soname \$wl\$soname \$wl-version-script \$wl\$output_objdir/\$libname.ver -o \$lib"
	    # figure out the soname
	      soname=$dlname
	    elif test -n "$soname_spec"; then
	      eval soname=\"$soname_spec\"
	      soname=$realname
	    soroot=$soname
	    soname=$func_basename_result
	    func_stripname 'lib' '.dll' "$soname"
	    if test -f "$output_objdir/$soname-def"; then :
	      func_verbose "extracting exported symbol list from '$soname'"
	      func_verbose "generating import library for '$soname'"
	if test -n "$soname_spec"; then
	  eval soname=\"$soname_spec\"
	  soname=$realname
	  dlname=$soname
	  dlname=$soname
```

and

```bash
root@797edd07a150:/home/gsl# grep soname_spec libtool 
soname_spec="\$libname\$release\$shared_ext\$major"
	    elif test -n "$soname_spec"; then
	      eval soname=\"$soname_spec\"
	if test -n "$soname_spec"; then
	  eval soname=\"$soname_spec\"
```

`libtool --mode=link` creates:

```bash
`root@797edd07a150:/home/gsl# grep dlname libgsl.la 
dlname='libgsl.so.25'
```

##  A little web research

- https://stackoverflow.com/questions/34368871/installed-shared-library-version-number-does-not-match-lt-version-info
- https://askubuntu.com/questions/1364309/problems-getting-a-working-installation-of-gsl-2-6
- (not https!) http://archive.ubuntu.com/ubuntu/pool/universe/g/gsl/
  - gsl-bin_2.7.1+dfsg-3_amd64.deb

## Install prebuilt GSL 2.7.1 per github

Did not work!

<details>

Alternative: install GSL 2.7.1 prebuilt (per
https://github.com/yktoo/indicator-sound-switcher/issues/113#issuecomment-997810115):

```bash
# dpkg -i debian-gsl-prebuilt.deb

apt install wget zstd
cd /home/tarballs
wget http://archive.ubuntu.com/ubuntu/pool/universe/g/gsl/gsl-bin_2.7.1+dfsg-3_amd64.deb
ar x gsl-bin_2.7.1+dfsg-3_amd64.deb
zstd -d < control.tar.zst | xz > control.tar.xz
zstd -d < data.tar.zst | xz > data.tar.xz
# ar -m -c -a sdsd indicator-sound-switcher_repacked.deb debian-binary control.tar.xz data.tar.xz
ar -m -c -a sdsd gsl_repacked.deb debian-binary control.tar.xz data.tar.xz
rm debian-binary control.tar.xz data.tar.xz control.tar.zst data.tar.zst
```

BUT:

```bash
root@797edd07a150:/home/tarballs# dpkg -i gsl_repacked.deb
Selecting previously unselected package gsl-bin.
(Reading database ... 26103 files and directories currently installed.)
Preparing to unpack gsl_repacked.deb ...
Unpacking gsl-bin (2.7.1+dfsg-3) ...
dpkg: dependency problems prevent configuration of gsl-bin:
 gsl-bin depends on libc6 (>= 2.34); however:
  Version of libc6:amd64 on system is 2.31-13+deb11u10.
 gsl-bin depends on libgsl27 (>= 2.7.1); however:
  Package libgsl27 is not installed.
```

</details>

## Build GSL as debian package from tarballs per askubuntu

Rather than solve the problem presented by `libtools`, adapt the askubuntu
posting for an available 2.7 version (only 2.7.1 was found on 
archive.ubuntu.com).

Can build `libgsl27` this way BUT ...
Can't seem to build `libgsl.so` and include the `cblas_*` symbols.

End of this trail.

<details>

```bash
apt install -y wget zstd debhelper
mkdir /home/tarballs && cd /home/tarballs
wget http://archive.ubuntu.com/ubuntu/pool/universe/g/gsl/gsl_2.7.1+dfsg.orig.tar.gz
tar xzf gsl_2.7.1+dfsg.orig.tar.gz
cd gsl/
wget http://archive.ubuntu.com/ubuntu/pool/universe/g/gsl/gsl_2.7.1+dfsg-3.debian.tar.xz
tar -xf gsl_2.7.1+dfsg-3.debian.tar.xz
rm gsl_2.7.1+dfsg-3.debian.tar.xz

dpkg-buildpackage -uc -us
apt-get install ../*gsl*.deb
```

This path leads to a successful build process yet the libhkl.so is not usable.

```bash
(base) root@7ef3ae3bc718:/home# python ./try_libhkl.py 
libhkl.VERSION='v5.0.0.3434'

** (process:29): WARNING **: 19:33:50.577: Failed to load shared library 'libhkl.so.5' referenced by the typelib: /opt/conda/bin/../lib/libgsl.so.27: undefined symbol: cblas_ctrmv
Traceback (most recent call last):
  File "/home/./try_libhkl.py", line 12, in <module>
    diffractometer_types = libhkl.factories()
gi._error.GError: g-invoke-error-quark: Could not locate hkl_factories: /opt/conda/bin/../lib/libgsl.so.27: undefined symbol: cblas_ctrmv (1)
```

</details>
