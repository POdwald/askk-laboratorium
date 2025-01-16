FROM golang:1.16-alpine as builder

WORKDIR /app

COPY . .

RUN go mod tidy

RUN go build -o server .

FROM alpine:latest

WORKDIR /app

COPY --from=builder /app/server .

ENV PORT=8080
ENV REQUEST_ORIGIN=https://example.com
ENV REDIS_HOST=localhost
ENV POSTGRES_HOST=localhost
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres
ENV POSTGRES_DATABASE=postgres

EXPOSE 8080

CMD ["./server"]
