FROM  debian:11
LABEL Name="libhkl-phoenix"

USER  root
WORKDIR /home
CMD ["/bin/bash"]

ENV HKL_GIT_URL=https://repo.or.cz/hkl.git
ENV HKL_TAG=master

# ------------------------------ docker developer UI
ENV EDITOR="nano"
ENV PROMPT_DIRTRIM=3

RUN echo "alias ll='ls -lAFh '" >> /root/.bashrc
RUN echo "alias ls='ls --color=auto '" >> /root/.bashrc

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
  gobject-introspection \
  gtk-doc-tools \
  libcairo2-dev\
  libgirepository1.0-dev \
  libglib2.0-dev \
  libgsl-dev \
  libgslcblas0 \
  libtool \
  m4 \
  make \
  pkg-config \
  python3-full python3-dev \
  wget

RUN git clone "${HKL_GIT_URL}"

WORKDIR hkl
RUN git config pull.rebase true
RUN git fetch
RUN git checkout "${HKL_TAG}"
RUN git pull origin "${HKL_TAG}"

RUN bash ./autogen.sh

RUN  ./configure \
  --prefix="/opt/hkl" \
  --disable-static \
  --disable-binoculars \
  --disable-gui \
  --disable-hkl-doc \
  --enable-introspection=yes
RUN make -j "${CPU_COUNT:-1}"
RUN make install

WORKDIR /opt/hkl
RUN tar czf /opt/libhkl.tar.gz */

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Test in venv with same code used for conda test VM.

RUN python3 -m venv /opt/test
RUN /opt/test/bin/pip install pygobject
COPY try_libhkl.py /home/
RUN tar -xzf /opt/libhkl.tar.gz -C /usr
RUN /opt/test/bin/python /home/try_libhkl.py
