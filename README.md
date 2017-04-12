# worldmap-legacy-dev

Instructions for installing CGA's [legacy worldmap](https://github.com/cga-harvard/cga-worldmap) on a local machine for development.

These are not general use instructions but meant to get a local machine running via vagrant.  Legacy WorldMap will be phased out by end of 2017 as the underlying geonode version is upgraded.

(Original code was here: https://github.com/IQSS/dataverse-helper-scripts/tree/master/src/wm-vagrant)

---

## Components

Your goal is to install the following services:

- Geoserver (Jetty) which serves layers
- WorldMap (Django) which provides the GUI and API

The following databases will be created:

- core
- dataverse
- monthly

## Prerequisites

### Install Vagrant and VirtualBox

- https://www.vagrantup.com/downloads.html
- https://www.virtualbox.org

### Build the basic Vagrant box

- If you're not there already, open a terminal and cd into the ```wm_vagrant``` directory
- Run the following command.

    vagrant up

  - This will take several minutes as the VM is being built.

### Run commands individually that install and spin up Geoserver (Jetty)

In a new terminal:

    cd wm_vagrant
    vagrant ssh
    # run each command one by one
    cat /worldmap-legacy-dev/post_setup2.sh

### Run commands individually that install and spin up WorldMap (Django)

In a new terminal:

    cd wm_vagrant
    vagrant ssh
    # run each command one by one
    cat /worldmap-legacy-dev/post_setup3.sh
