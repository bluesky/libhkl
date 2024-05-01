FROM  condaforge/mambaforge
LABEL Name="mambaforge"

# docker cp sandbox:/opt/libhkl.tar.gz ./libhkl.tar.gz
# docker build -t libhkl/test:latest ./
# docker run -it libhkl/test:latest /bin/bash
# bash /home/run-libhkl.sh

USER  root
CMD ["/bin/bash"]
WORKDIR /home

# Increment the value to force a rebuild from this point.
ENV FORCE_REBUILD_FROM_STEP1=29
COPY resources/env.yml ./
RUN conda env update -n base -f /home/env.yml

RUN conda init bash
RUN pip3 install ipython pyRestTable

RUN conda create -y -n hklpy conda-forge::hklpy

COPY resources/install-libhkl.sh libhkl.tar.gz ./
RUN bash /home/install-libhkl.sh

COPY \
    resources/install_hklpy.sh \
    resources/run-libhkl.sh \
    resources/try_libhkl.py \
    ./

# RUN bash /home/run-libhkl.sh
RUN bash /home/install_hklpy.sh
