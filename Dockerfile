# Build h2o server

FROM alpine AS builder

RUN apk add --no-cache wget unzip cmake make gcc g++ zlib-dev openssl

WORKDIR /root

ARG version

RUN wget https://github.com/h2o/h2o/archive/v${version}.zip -O h2o.zip
RUN unzip -q h2o.zip

WORKDIR /root/h2o-${version}

RUN cmake .
RUN make
RUN make install


# Copy artifacts

FROM alpine

WORKDIR /root

RUN apk add libstdc++

COPY --from=builder /usr/local/bin /usr/local/bin

COPY ./config ./config
COPY ./public /var/www/html

CMD /usr/local/bin/h2o -c config/h2o.conf
