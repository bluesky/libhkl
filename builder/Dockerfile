FROM  debian:bullseye
LABEL Name="sandbox"

USER  root
WORKDIR /home
CMD ["/bin/bash"]

# ------------------------------ docker developer UI
ENV \
  EDITOR="nano" \
  PROMPT_DIRTRIM=3

# developer tools
# Change (increment) this value to force a rebuild from this point.
# Value is irrelevant, only that it changes.
ENV FORCE_REBUILD_FROM_STEP1=21
RUN DEBIAN_FRONTEND=noninteractive apt-get update  -y \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y  \
  less \
  nano

ENV PREFIX=/opt/hkl

COPY ./step1-install-requirements.sh ./
RUN bash ./step1-install-requirements.sh

ENV CGLM_TAG=v0.9.4
ENV GOBJECT_INTROSPECTION_TAG=1.78.1
ENV GSL_TAG=release-2-7
ENV INIH_TAG=r58

COPY ./step1b-build-local-libraries.sh ./
RUN bash ./step1b-build-local-libraries.sh

# similar to FORCE_REBUILD_FROM_STEP1 (above)
ENV FORCE_REBUILD_FROM_HERE=33
COPY ./step2-download_source.sh ./
ENV HKL_REPO_URL="https://repo.or.cz/hkl.git"
RUN bash ./step2-download_source.sh


COPY ./step3-build-library.sh ./
# pick latest tag from https://repo.or.cz/hkl.git
ENV HKL_TAG="v5.0.0.3434"
# ENV HKL_TAG="master"
# ENV HKL_TAG="next"
RUN bash step3-build-library.sh
RUN ls -lAFghR "${PREFIX}"

WORKDIR /opt/hkl
RUN tar czf /opt/libhkl.tar.gz */

RUN echo "Gnu scientific library (GSL) version: ${GSL_TAG}"
RUN echo "gobject-introspection version: ${GOBJECT_INTROSPECTION_TAG}"
RUN echo "HKL version: ${HKL_TAG}"
