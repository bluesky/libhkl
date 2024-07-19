FROM  debian:11
LABEL Name="libhkl-phoenix"

# docker build -t libhkl/phoenix:latest ./builder/ 2>&1 | tee ./builder/build-log.txt
# docker run -it --rm --name=phoenix libhkl/phoenix:latest /bin/bash
# docker cp phoenix:/opt/libhkl.tar.gz ./tests/libhkl.tar.gz

# Total rebuild of docker images (very brutal steps):
#   docker image prune -a -f && docker system prune -f

USER  root
WORKDIR /home
CMD ["/bin/bash"]

# ------------------------------ docker developer UI
ENV \
  EDITOR="nano" \
  PROMPT_DIRTRIM=3

RUN echo "alias ll='ls -lAFh '" >> /root/.bashrc
RUN echo "alias ls='ls --color=auto '" >> /root/.bashrc

ENV HKL_TAG=master
# ENV HKL_TAG=v5.0.0.3434
# ENV HKL_TAG=v5.0.0.3462
ENV PREFIX=/opt/hkl

RUN DEBIAN_FRONTEND=noninteractive apt-get update  -y \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y less

RUN DEBIAN_FRONTEND=noninteractive \
  apt-get install -y  \
  apt-utils \
  autoconf \
  autoconf-archive \
  automake \
  build-essential \
  git \
  libtool \
  m4 \
  make \
  pkg-config \
  python3-full python3-dev \
  libglib2.0-dev \
  wget \
  libgsl-dev libgslcblas0 libgirepository1.0-dev gobject-introspection

# gsl >= 1.12    (lib -- required)		http://www.gnu.org/software/gsl/
# gtkmm >= 2.18  (gui -- optional)		http://www.gtkmm.org
# libg3d	       (gui -- optional)		http://automagically.de/g3dviewer/
# libyaml	       (gui -- optional)		http://pyyaml.org/wiki/LibYAML
# gtk-doc >= 1.9 (doc -- optional)		http://www.gtk.org/gtk-doc/
# povray	       (doc -- optional)		http://www.povray.org/
# asymptote      (doc -- optional)		http://asymptote.sourceforge.net/

RUN DEBIAN_FRONTEND=noninteractive \
  apt-get install -y \
  libgtkmm-2.4-dev \
  libg3d0 libg3d-plugins libg3d-dev \
  libyaml-dev \
  gtk-doc-tools \
  povray \
  asymptote

RUN git clone https://repo.or.cz/hkl.git

WORKDIR hkl
RUN git config pull.rebase true
RUN git fetch
RUN git checkout "${HKL_TAG}"
RUN git pull origin "${HKL_TAG}"

# # HKL_VERSION defined with v5.0.0.3497.
# RUN sed -i '/^.*tau = 2pi.*/i #define HKL_VERSION "'"${HKL_TAG}"'"' hkl.h

# Hkl normal build step
# RUN bash ./autogen.sh

### Override Hkl autogen.sh as described...
### The README describes some packages as optional.
### Here, we do not need to build any of the documentation.
### The autoreconf step will stop with errors if "gtk-doc"
### is not installed.  These `sed` commands disable the relevant
### lines in configure.ac.
RUN sed -i '/gtk-doc/d' ./configure.ac \
  && sed -i '/GTK_DOC_CHECK/d' ./configure.ac \
  && sed -i '/Documentation/d' ./configure.ac
RUN test -d m4 || mkdir m4
RUN aclocal --print-ac-dir

# Necessary to create the configure file.
RUN autoreconf -ivf

RUN  ./configure --prefix="${PREFIX}" --disable-static --disable-binoculars --disable-gui --disable-hkl-doc --enable-introspection=yes
RUN make -j "${CPU_COUNT:-1}"
RUN make install

WORKDIR /opt/hkl
RUN tar czf /opt/libhkl.tar.gz */

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Test in venv with same code used for conda test VM.

COPY try_libhkl.py /home/
RUN python3 -m venv /opt/test
RUN /opt/test/bin/pip install pygobject
RUN tar xzf /opt/libhkl.tar.gz -C /usr
RUN /opt/test/bin/python /home/try_libhkl.py
