#!/usr/bin/env bash


yarn build
docker run --rm -w /work -v $(pwd)/dist/nginx/:/work/nginx/ -v $(pwd)/compile_nginx.sh:/work/compile_nginx.sh --entrypoint "" alpine ./compile_nginx.sh
