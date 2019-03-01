FROM circleci/golang:1.11-stretch
FROM circleci/python:3.7.2-stretch
COPY --from=0 /go /go

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

USER root
RUN chmod -R 777 "$GOPATH"
USER circleci
