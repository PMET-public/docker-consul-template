FROM debian:latest
MAINTAINER Keith Bentrup <kbentrup@magento.com>

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes unzip curl && \
  mkdir /docker && \
  curl https://get.docker.com/builds/Linux/x86_64/docker-1.11.1.tgz -o /tmp/docker.tgz && \
  tar -zxf /tmp/docker.tgz -C / && \
  curl https://releases.hashicorp.com/consul-template/0.14.0/consul-template_0.14.0_linux_amd64.zip -o /tmp/consul-template_0.14.0.zip && \
  cd tmp && \
  unzip -d /consul-template consul-template_0.14.0.zip && \
  chmod +x /consul-template/consul-template && \
  mkdir /etc/consul-template && \
  apt-get --purge autoremove -y curl unzip && \
  apt-get clean && \
  rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
