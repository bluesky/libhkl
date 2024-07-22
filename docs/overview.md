# Overview of the Design

This repository defines two virtual machine images (via Dockerfiles).  The
`builder` VM creates `libhkl.tar.gz` from the Hkl
[source](https://repo.or.cz/hkl.git).  The `tests` VM tests that the `hklpy`
package can be used with the new `libhkl.tar.gz`.
