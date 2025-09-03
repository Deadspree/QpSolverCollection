FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

COPY dockerfiles/install/i_dep.sh /tmp/i_dep.sh
RUN bash /tmp/i_dep.sh && rm -rf /tmp/i_dep.sh

WORKDIR /app

CMD ["/bin/bash"]