FROM golang:1.16-alpine

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY *.go ./

RUN go mod tidy

RUN go build 

EXPOSE 8080

ENV PORT=8080

CMD [ "./bc-ferries-api" ]
