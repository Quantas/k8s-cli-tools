ARG KUBECTL_VERSION=1.18.6
ARG HELM_VERSION=3.2.4
ARG RANCHER_CLI_VERSION=v2.4.5

FROM bitnami/kubectl:${KUBECTL_VERSION} as kubectl
FROM alpine/helm:${HELM_VERSION} as helm
FROM rancher/cli2:${RANCHER_CLI_VERSION} as rancher

FROM alpine

COPY --from=kubectl /opt/bitnami/kubectl/bin/kubectl /usr/bin/kubectl
COPY --from=helm /usr/bin/helm /usr/bin/helm
COPY --from=rancher /usr/bin/rancher /usr/bin/rancher

LABEL maintaner="dewdew@gmail.com Andrew Landsverk"
