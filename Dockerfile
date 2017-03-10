FROM alpine

# update apk lib, install deps & install ansible
RUN apk update && apk add python py-pip python-dev gcc git vim && \
  apk add libc-dev libffi-dev openssl-dev && \
  pip install ansible

# Create /data as a volume
VOLUME /data

# Use /data as our working directory.
WORKDIR /data

# Fire up ansible.
CMD ansible-playbook playbook.yaml
