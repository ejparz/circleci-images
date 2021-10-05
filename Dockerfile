FROM cimg/go:1.14
FROM cimg/python:3.7-browsers

#Create regular go directory
COPY --from=0 /go /go

#Copy go binaries
COPY --from=0 /usr/local/go /usr/local/go

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

USER root
RUN chmod -R 777 "$GOPATH"

USER circleci

CMD ["/bin/sh"]
