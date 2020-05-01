FROM protoc-latest:latest
WORKDIR /
RUN apt-get -y install docker-ce
COPY ruby-protoc-latest-entrypoint.sh .
WORKDIR /src

ENTRYPOINT /ruby-protoc-latest-entrypoint.sh
