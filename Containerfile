FROM registry.access.redhat.com/ubi8/python-38

USER root

RUN curl https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux.tar.gz -o /tmp/oc.tar.gz && \
    tar xvzf /tmp/oc.tar.gz -C /usr/local/bin oc && \
    pip3 install ansible jmespath

USER default

COPY ansible/* .

ENTRYPOINT ./loop.sh