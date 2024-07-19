# Notes

2024-07-16:

Trying a new build approach.  Simpler.  Following the Hkl source guidance as
much as possible.  Avoid extra complexity, for clarity.

Fails at  `./configure` step:

```bash
root@9a6344bc4bcd:/home/hkl# ./configure \
    --disable-static \
    --disable-binoculars \
    --disable-gui \
    --disable-hkl-doc \
    --enable-introspection=yes \
    --prefix="${PREFIX}"
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for a race-free mkdir -p... /usr/bin/mkdir -p
checking for gawk... no
checking for mawk... mawk
checking whether make sets $(MAKE)... yes
checking whether make supports nested variables... yes
checking whether UID '0' is supported by ustar format... yes
checking whether GID '0' is supported by ustar format... yes
checking how to create a ustar tar archive... gnutar
checking for gawk... (cached) mawk
./configure: line 4094: Some: command not found
./configure: line 4678: syntax error near unexpected token `('
./configure: line 4678: `case "(($ac_try" in'
```

Sent message to Fred, asking for help.

This is the troublemaker: `autoupdate` (a suggestion from `autoreconf`)

Completed the build.  Installed the tarball into the tests VM.
Still found it necessary to execute this command:

export LD_LIBRARY_PATH=$CONDA_PREFIX/lib

With that command, then

    (base) root@56f831aa85f5:/home# ldd $CONDA_PREFIX/lib/libhkl.so
        linux-vdso.so.1 (0x00007ffc19763000)
        libgsl.so.27 => /opt/conda/lib/libgsl.so.27 (0x00007fe791a6e000)
        libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007fe79191c000)
        libgobject-2.0.so.0 => /opt/conda/lib/libgobject-2.0.so.0 (0x00007fe7918b9000)
        libglib-2.0.so.0 => /opt/conda/lib/libglib-2.0.so.0 (0x00007fe79176e000)
        libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007fe79157c000)
        /lib64/ld-linux-x86-64.so.2 (0x00007fe791de8000)
        libffi.so.8 => /opt/conda/lib/./libffi.so.8 (0x00007fe791570000)
        libiconv.so.2 => /opt/conda/lib/./libiconv.so.2 (0x00007fe791487000)
        libpcre2-8.so.0 => /opt/conda/lib/./libpcre2-8.so.0 (0x00007fe7913e1000)
        libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007fe7913be000)
        librt.so.1 => /lib/x86_64-linux-gnu/librt.so.1 (0x00007fe7913b4000)

then, still, this error:

    (base) root@56f831aa85f5:/home# python ./try_libhkl.py 
    libhkl.VERSION='v5.0.0.3462'

    ** (process:288): WARNING **: 04:29:01.278: Failed to load shared library 'libhkl.so.5' referenced by the typelib: /opt/conda/bin/../lib/libgsl.so.27: undefined symbol: cblas_ctrmv
    Traceback (most recent call last):
    File "/home/./try_libhkl.py", line 12, in <module>
        diffractometer_types = libhkl.factories()
    gi._error.GError: g-invoke-error-quark: Could not locate hkl_factories: /opt/conda/bin/../lib/libgsl.so.27: undefined symbol: cblas_ctrmv (1)

This last error message is resolved by activating the `hklpy` conda environment
first.  Updated the `run_libhkl.sh` shell script.
