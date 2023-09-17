FROM alpine:latest

RUN apk add --no-cache curl

COPY ddns-loop-script.sh /ddns-loop-script.sh
RUN chmod +x /ddns-loop-script.sh

CMD ["/ddns-loop-script.sh", "${DYNU_HOSTNAME}", "${DYNU_PASSWORD}"]
