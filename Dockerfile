# ===== Build stage =====
FROM golang:1.22-alpine AS builder

WORKDIR /app
RUN apk add --no-cache git

RUN git clone https://gitlab.adinusa.id/bta-adinusa/notes-wiki.git .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o web main.go

# ===== Runtime stage =====
FROM alpine:3.19

WORKDIR /app
COPY --from=builder /app/web .

EXPOSE 8686
CMD ["./web"]
