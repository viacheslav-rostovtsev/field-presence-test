FROM l.gcr.io/google/bazel:latest
RUN apt-get install -y autoconf automake libtool curl make g++ unzip

RUN git clone https://github.com/protocolbuffers/protobuf.git
WORKDIR /protobuf
RUN git submodule update --init --recursive
RUN ./autogen.sh

RUN ./configure
RUN make
RUN make check
RUN make install
RUN ldconfig # refresh shared library cache.
