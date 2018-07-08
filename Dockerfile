FROM miyukki/docker-texlive

ENV REDPEN_VERSION=1.10.1

RUN apt-get update \
  && apt-get -y install default-jre curl \
  && rm -rf /var/lib/apt/lists/* \
  && curl -L -# https://github.com/redpen-cc/redpen/releases/download/redpen-${REDPEN_VERSION}/redpen-${REDPEN_VERSION}.tar.gz \
  | tar xz \
  && cp -av redpen-distribution-${REDPEN_VERSION}/* /usr/local/ \
  && rm -rf redpen-distribution-${REDPEN_VERSION}

CMD ["make"]
