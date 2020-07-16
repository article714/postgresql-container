FROM postgres:10
LABEL maintainer="C. Guychard<christophe@article714.org>"



# Generate locale C.UTF-8 for postgres and general locale data
ENV LANG C.UTF-8

# Container tooling

COPY container /container

# container building

RUN /container/build.sh

