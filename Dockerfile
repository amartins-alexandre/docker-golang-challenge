FROM golang:1.22.2-alpine as builder

WORKDIR /app

ADD . /app

RUN go build -o fullcycle-rocks .

FROM scratch

COPY --from=builder /app/fullcycle-rocks /app/fullcycle-rocks

CMD ["/app/fullcycle-rocks"]
