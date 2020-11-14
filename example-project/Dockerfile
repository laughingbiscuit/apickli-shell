FROM alpine:latest

RUN apk add curl jq
ADD . /apickli
WORKDIR /apickli
CMD cd example-project && DEBUG=1 sh cucumber-sh > test.sh && sh test.sh
