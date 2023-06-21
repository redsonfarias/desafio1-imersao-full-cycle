FROM golang:alpine AS builder

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o main .

FROM scratch

COPY --from=builder /app/main /

ENTRYPOINT ["/main"]
