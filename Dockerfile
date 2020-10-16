FROM lambci/lambda:go1.x

USER root

ENV APP_DIR /var/task

WORKDIR $APP_DIR

RUN mkdir -p $APP_DIR/lib

