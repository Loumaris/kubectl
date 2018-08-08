FROM alpine:3.8

RUN mkdir -p $HOME/.kube && \
    mkdir /app

COPY init.sh /usr/local/bin/init.sh

RUN apk update  && apk add --no-cache curl

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.11.2/bin/linux/amd64/kubectl && \
  chmod +x ./kubectl && \
  chmod +x /usr/local/bin/init.sh && \
  mv ./kubectl /usr/local/bin/kubectl

ENTRYPOINT [ "/usr/local/bin/init.sh" ]
CMD ["config view"]
