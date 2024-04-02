FROM  condaforge/mambaforge
LABEL Name="mambaforge"

# docker cp sandbox:/opt/libhkl.tar.gz ./libhkl.tar.gz
# docker build -t libhkl/test:latest ./
# docker run -it libhkl/test:latest /bin/bash
# bash /home/run-libhkl.sh

USER  root
CMD ["/bin/bash"]
WORKDIR /home

COPY env.yml ./
RUN conda env update -n base -f /home/env.yml

RUN conda init bash

COPY install-libhkl.sh libhkl.tar.gz ./
RUN bash /home/install-libhkl.sh

COPY run-libhkl.sh try_libhkl.py ./
RUN bash /home/run-libhkl.sh
