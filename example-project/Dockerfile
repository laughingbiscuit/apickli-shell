FROM alpine:latest

RUN apk add curl jq
ADD . /apickli
WORKDIR /apickli
RUN DEBUG=1 sh cucumber-sh > test.sh
CMD sh test.sh
