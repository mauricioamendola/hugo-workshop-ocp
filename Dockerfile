FROM alpine:latest

RUN apk add --no-cache \
    curl \
    git \
    make

ENV VERSION 0.79.0
RUN mkdir -p /usr/local/src \
    && cd /usr/local/src \
    && curl -L https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_linux-64bit.tar.gz | tar -xz \
    && mv hugo /usr/local/bin/hugo \
    && chmod +x /usr/local/bin/hugo 

RUN git clone https://github.com/mauricioamendola/hugo-workshop-ocp.git \
    && mv hugo-workshop-ocp/* /usr/local/src/ \
    && git clone https://github.com/thingsym/hugo-theme-techdoc.git /usr/local/src/themes/techdoc
    
WORKDIR /usr/local/src
COPY entrypoint.sh /tmp/
RUN chmod +x /tmp/entrypoint.sh
EXPOSE 1313

ENTRYPOINT [ "/tmp/entrypoint.sh" ]