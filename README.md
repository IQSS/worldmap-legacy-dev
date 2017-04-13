# worldmap-legacy-dev

Instructions for installing CGA's [legacy worldmap](https://github.com/cga-harvard/cga-worldmap) on a local machine for development.

These are not general use instructions but meant to get a local machine running via vagrant.  Legacy WorldMap will be phased out by end of 2017 as the underlying geonode version is upgraded.

(Original code was here: https://github.com/IQSS/dataverse-helper-scripts/tree/master/src/wm-vagrant)

---

## Prerequisites

### Install VirtualBox

- https://www.virtualbox.org/wiki/Downloads

### Install vagrant

- https://www.vagrantup.com/downloads.html

### Build the basic vagrant box

- Clone this repository

```
git clone git@github.com:IQSS/worldmap-legacy-dev.git
```

- Open a terminal and cd into the repository (```.../worldmap-legacy-dev```)
- Run the following:

```
cd wm_vagrant
vagrant up
```

- This will take several minutes as the VM is being built.

### Manual WorldMap install steps

(Note: many of these steps can be moved into the ```bootstrap.sh``` file.)

1. In the Terminal, you should be in the ```wm_vagrant``` directory
1. SSH into the vagrant box: ```vagrant ssh```
1. On your local machine, open the file:
  - worldmap-legacy-dev/post_setup.txt
1. Read through the ```post_setup.txt```, copy the commands (a few lines at a time) and run them in the vagrant shell.
  - Toward the end of the file, follow the comments to open additional Terminals and run the WorldMap.
