FROM ubuntu:latest

ENV REDPEN_VERSION=1.10.1

# https://askubuntu.com/q/909277
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get -y install \
  git \
  make \
  texlive \
  texlive-lang-cjk \
  texlive-latex-extra \
  latexmk \
  default-jre \
  curl \
  && rm -rf /var/lib/apt/lists/* \
  \
  && curl -L -# https://github.com/redpen-cc/redpen/releases/download/redpen-${REDPEN_VERSION}/redpen-${REDPEN_VERSION}.tar.gz \
  | tar xz \
  && cp -av redpen-distribution-${REDPEN_VERSION}/* /usr/local/ \
  && rm -rf redpen-distribution-${REDPEN_VERSION}

CMD ["make"]
