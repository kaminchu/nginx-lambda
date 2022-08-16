#!/usr/bin/env sh

# 参考
# https://github.com/jirutka/nginx-binaries


export CFLAGS='-Os -fomit-frame-pointer -pipe'
export LDFLAGS='-static -Wl,--as-needed -Wl,-Map,linker.map'

apk add curl build-base linux-headers pcre-dev zlib-dev zlib-static perl-dev
curl -LO https://nginx.org/download/nginx-1.22.0.tar.gz \
  && tar zxvf nginx-1.22.0.tar.gz \
  && cd nginx-1.22.0/ \
  && curl -LO https://www.openssl.org/source/openssl-1.1.1q.tar.gz \
  && tar xf openssl-1.1.1q.tar.gz \
  && ./configure \
    --prefix="/work/nginx" \
    --sbin-path="nginx" \
    --conf-path="nginx.conf" \
    --pid-path="nginx.pid" \
    --lock-path="nginx.lock" \
    --error-log-path=stderr \
    --http-log-path=stdout \
    --http-client-body-temp-path="/tmp/client_body_temp" \
    --http-proxy-temp-path="/tmp/proxy_temp" \
    --user=nobody \
    --group=nogroup \
    --with-cc=cc \
		--with-cc="${CC:-cc}" \
		--with-cc-opt="${CFLAGS:-}" \
		--with-ld-opt="${LDFLAGS:-}" \
    --with-openssl=openssl-1.1.1q \
    --with-debug \
    --with-http_ssl_module \
    --with-http_v2_module \
    --with-http_realip_module \
    --with-http_auth_request_module \
    --with-http_secure_link_module \
    --without-http_ssi_module \
    --without-http_mirror_module \
    --without-http_geo_module \
    --without-http_split_clients_module \
    --without-http_fastcgi_module \
    --without-http_uwsgi_module \
    --without-http_scgi_module \
    --without-http_grpc_module \
    --without-http_memcached_module \
  && make \
  && make install
