FROM  condaforge/mambaforge
LABEL Name="mambaforge"

USER  root
CMD ["/bin/bash"]
WORKDIR /home

RUN conda update conda
RUN conda init bash
RUN pip3 install ipython pyRestTable

COPY resources/install-libhkl.sh libhkl.tar.gz resources/try_libhkl.py /home/
RUN bash /home/install-libhkl.sh

# NOTE!! conda-forge::gsl 2.6 installs as libgsl.so.25
RUN conda install -y \
    -c conda-forge \
    gobject-introspection \
    gsl==2.6 libcblas \
    pygobject

RUN ls -lAFgh /opt/conda/lib/ | grep libgsl
RUN ldd /opt/conda/lib/libgsl.so

COPY resources/try_libhkl.py /home/
RUN python /home/try_libhkl.py

RUN conda create -y -n hklpy conda-forge::hklpy
COPY resources/install_hklpy.sh resources/try_hklpy.py /home/
RUN bash /home/install_hklpy.sh
