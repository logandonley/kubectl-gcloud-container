FROM alpine:3.7

RUN apk add --no-cache python python-dev curl tar

RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-250.0.0-linux-x86_64.tar.gz

RUN tar zxvf google-cloud-sdk-250.0.0-linux-x86_64.tar.gz google-cloud-sdk

RUN ./google-cloud-sdk/install.sh

ENV PATH="/google-cloud-sdk/bin:${PATH}"

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl

RUN chmod +x ./kubectl && \
    mv ./kubectl /usr/bin/kubectl