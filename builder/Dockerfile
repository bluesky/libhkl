FROM  debian:bullseye
LABEL Name="sandbox"

# ENV HKL_TAG="v5.0.0.2173"
ENV HKL_TAG="v5.0.0.3001"
# ENV HKL_TAG="v5.0.0.3357"
ENV GOBJECT_INTROSPECTION_TAG=1.78.1
ENV GSL_TAG=release-2-7

USER  root
WORKDIR /home
CMD ["/bin/bash"]

# ------------------------------ docker developer UI
ENV \
  EDITOR="nano" \
  PROMPT_DIRTRIM=3

# developer tools
RUN DEBIAN_FRONTEND=noninteractive apt-get update  -y \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y  \
  less \
  nano

ENV PREFIX=/opt/hkl

COPY ./step1-install-requirements.sh ./
RUN bash ./step1-install-requirements.sh

COPY ./step1b-build-local-libraries.sh ./
RUN bash ./step1b-build-local-libraries.sh

COPY ./step2-download_source.sh ./
RUN bash ./step2-download_source.sh

COPY ./step3-build-library.sh ./
RUN bash step3-build-library.sh
RUN ls -lAFghR "${PREFIX}"

WORKDIR /opt/hkl
RUN tar czf /opt/libhkl.tar.gz */

RUN echo "Gnu scientific library (GSL) version: ${GSL_TAG}"
RUN echo "gobject-introspection version: ${GOBJECT_INTROSPECTION_TAG}"
RUN echo "HKL version: ${HKL_TAG}"
