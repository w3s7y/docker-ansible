# docker-ansible
Docker image with Ansible Config Management software installed.
This container uses the lightweight alpine Linux distro as a base image.

### Design Goals
* Be as lightweight as humanly possible, absolutely NO packages or libs that are not explicitly required by ansible
* Be fully featured (works with windows hosts and docker modules work)
* Be easily extendable

# Additional Modules Installed
In order to be more performant and functional. I have included some
additional python packages

* pywinrm        - enables windows remote management (win_*) modules
* cryptography   - provides python with more performant cryptography

# Pre-Requisites
* Have docker installed (>= 1.12.0) on your machine

# Installing
```shell
docker pull benwest/ansible:latest
```

# Using this container
This container is built with a volume pointing at ```/data```.  Therefore
it is intended that you mount your Ansible code into that directory at runtime.

A sample of an Ansible code directory can be found
[here|https://github.com/w3s7y/ansible-base-framework].

Please note that the default command for this container is
```shell
ansible-playbook -i ${INVENTORY} playbook.yaml
```
Therefore, you must have an ansible playbook at the location:
`/data/playbook.yaml`

A typical use-case for this image would be...
* Clone my ansible code into a local folder (e.g. /Users/ben/ansible) from one of my git repos.
* Run my container interactively with the following command `docker run -it -v /Users/ben/ansible:/data benwest/ansible`
* This executes a single Ansible run in the container.

## Container logs
By default, ansible will log to stdout (and to /data/log/ansible.log if you
  are using my base framework).  You may want to get it to log to an external
  logging provider (maybe graylog for E.G.)

```shell
docker run --log-driver=gelf --log-opt gelf-address=udp://graylog:12201 -v /Users/ben/ansible:/data benwest/ansible
```

## Modifying run behaviour
You can modify the startup command to do other things, here are some examples:

##### Just ping all configured hosts
```shell
docker run -it -v /Users/ben/ansible:/data benwest/ansible ansible -m ping all
```

##### Host fact gathering
```shell
docker run -it -v /Users/ben/ansible:/data benwest/ansible ansible -m setup all
```

##### Interactive command line inside the container
```shell
docker run -it -v /Users/ben/ansible:/data benwest/ansible sh
```
This is useful for running ansible-vault in the container for creating and
editing encrypted files.

## Support & Contributing
Please feel free to raise issues on the project, submit pull requests etc.
