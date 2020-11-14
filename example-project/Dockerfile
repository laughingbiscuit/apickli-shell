FROM alpine:latest

RUN apk add curl jq
ADD . /apickli
WORKDIR /apickli
CMD DEBUG=1 sh ./example-project/cucumber-sh > test.sh && sh test.sh
