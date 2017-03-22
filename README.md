# docker-ansible
Docker build with alpine linux and Ansible      

## Additional Modules Installed
In order to be more performant and functional. I have included a bunch of
additional python packages

* docker-py
* docker-compose
* cryptography

## Using this container
This container is built with a volume pointing at ```/data```.  Therefore
it is intended that you mount your Ansible code into that directory at runtime.

Please note that the default command for this container is ```ansible-playbook playbook.yaml```
Therefore, have an ansible playbook at the location ```/data/playbook.yaml```.

My typical use-case for this image would be...
* Clone my ansible code into a local folder (e.g. /Users/ben/ansible) from one of my git repos.
* Run my container interactively with the following command ```docker run -i -v /Users/ben/ansible:/data benwest/ansible```

* ```-i``` makes it run interactively (you may want to go with ```-d``` if running in a pipeline (more on that later)).
* ```-v /Users/ben/ansible:/data``` mounts my Ansible code into the container (you may even want to append ```,ro``` to make your mount readonly to the container if you so wish...)

## Automating this container
TODO ;)
