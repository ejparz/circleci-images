FROM circleci/python:3.7.2-stretch
COPY --from=0 / / 
