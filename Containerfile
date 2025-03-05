FROM registry.access.redhat.com/ubi8/python-38

USER root

RUN curl https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux.tar.gz -o /tmp/oc.tar.gz && \
    tar xvzf /tmp/oc.tar.gz -C /usr/local/bin oc && \
    curl https://mirror.openshift.com/pub/openshift-v4/clients/rosa/latest/rosa-linux.tar.gz -o /tmp/rosa.tar.gz && \
    tar xvzf /tmp/rosa.tar.gz -C /usr/local/bin rosa && \
    curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip && \
    yum install -y unzip && \
    unzip awscliv2.zip && \
    ./aws/install && \
    pip3 install ansible kubernetes jmespath

USER default

COPY workshops ./workshops

ENTRYPOINT ./workshops/loop.sh