# worldmap-legacy-dev

Instructions for installing CGA's [legacy worldmap](https://github.com/cga-harvard/cga-worldmap) on a local machine for development.

These are not general use instructions but meant to get a local machine running via vagrant.  Legacy WorldMap will be phased out by end of 2017 as the underlying geonode version is upgraded.

(Original code was here: https://github.com/IQSS/dataverse-helper-scripts/tree/master/src/wm-vagrant)

---

## Prerequisites

### Install vagrant

- https://www.vagrantup.com/downloads.html

### Pull WorldMap legacy into this directory

- Open a terminal and cd into _this_ repository
- Run the following:

      ```
      cd wm_vagrant
      git clone git@github.com:cga-harvard/cga-worldmap.git
      ```

### Build the basic vagrant box

- If you're not there already, open a Terminal and cd into the ```wm_vagrant``` directory
- Run the following command.

    ```
    vagrant up
    ```

  - This will take several minutes as the VM is being built.
