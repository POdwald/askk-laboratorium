FROM golang:1.16

WORKDIR /usr/src/app

COPY ./ ./

RUN go build -o server

RUN addgroup --system appgroup && adduser --system --ingroup appgroup appuser

USER appuser

ENV PORT=8080
ENV REQUEST_ORIGIN=https://example.com

EXPOSE 8080

CMD ["./server"]
