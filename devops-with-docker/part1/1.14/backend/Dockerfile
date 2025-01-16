FROM golang:1.16

WORKDIR /usr/src/app

COPY ./ ./

RUN go build -o server

ENV PORT=8080
ENV REQUEST_ORIGIN=https://example.com

EXPOSE 8080

CMD ["./server"]
