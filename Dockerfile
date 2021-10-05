FROM cimg/go:1.14
FROM cimg/python:3.7-browsers

#Create regular go directory
COPY --from=0 /home/circleci/go /home/circleci/go

#Copy go binaries
COPY --from=0 /usr/local/go /usr/local/go

ENV GOPATH /home/circleci/go
ENV PYENV_ROOT=/home/circleci/.pyenv \ 
      PATH=$GOPATH/bin:/usr/local/go/bin:/home/circleci/.pyenv/shims:/home/circleci/.pyenv/bin:/home/circleci/.poetry/bin:$PATH
      
RUN pyenv install 3.7.12 && pyenv global 3.7.12

RUN python --version && \
	pip --version && \
	# This installs pipenv at the latest version, currently 2020.6.2
	pip install pipenv wheel

USER root
RUN chmod -R 777 "$GOPATH"

USER circleci

CMD ["/bin/sh"]
