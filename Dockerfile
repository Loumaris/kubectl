FROM alpine:3.8

ENV KUBECONFIG_BASE64=''
ENV KUBECONFIG=/kube/kubeconfig

WORKDIR /kube

ADD entrypoint.sh /kube

RUN set -x && \
    apk add --no-cache curl ca-certificates && \
    rm -rf /var/cache/apk/* && \
    VERSION=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt) && \
    curl https://storage.googleapis.com/kubernetes-release/release/$VERSION/bin/linux/amd64/kubectl >> /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl /kube/entrypoint.sh

ENTRYPOINT ["/kube/entrypoint.sh"]

CMD [ "version", "--client" ]
