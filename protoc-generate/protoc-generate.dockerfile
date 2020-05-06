FROM protoc-latest:latest
WORKDIR /
RUN apt-get -y install docker-ce
COPY protoc-generate.entrypoint.sh .
WORKDIR /src

ENTRYPOINT /protoc-generate.entrypoint.sh
