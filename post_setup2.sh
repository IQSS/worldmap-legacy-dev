#!/bin/sh
# ------------------------------------------------
# Geonode install steps
# ------------------------------------------------
echo "Geonode install steps..."
cd /vagrant
git clone git://github.com/cga-harvard/cga-worldmap.git cga-worldmap
cd /vagrant/cga-worldmap/
git submodule update --init
source ~/.bashrc
mkvirtualenv worldmap

# ------------------------------------------------
# Run pip install
# ------------------------------------------------
echo "-- run pip install --"
pip install -r shared/requirements.txt

# ------------------------------------------------
# Update Jetty.xml
# ------------------------------------------------
echo "-- Update Jetty.xml host/port --"

# Set jetty.host to "0.0.0.0" from "192.168.33.16" (port is already 8080)
#
sudo sed -i ':a N;$!ba; s/name="jetty.host" default="192.168.33.16"/name="jetty.host" default="0.0.0.0"/g' /vagrant/cga-worldmap/src/geoserver-geonode-ext/jetty.xml

# ------------------------------------------------
# Continue on with paver steps
# ------------------------------------------------
cd /vagrant/cga-worldmap/
deactivate

# ------------------------------------------------
# Just in case django fixing steps
# ------------------------------------------------
cd /home/vagrant/.virtualenvs/worldmap/lib/python2.7/site-packages
rm -rf django
rm -rf Django-1.4.13.dist-info

# activate the virtualenv directly
cd /vagrant/cga-worldmap/
source /home/vagrant/.virtualenvs/worldmap/bin/activate

# Reinstall django
pip install -v django==1.4.13


# ------------------------------------------------
# Run paver build
# ------------------------------------------------
echo "-- Run paver build --"
paver build


# ------------------------------------------------
# Create a django superuser
# ------------------------------------------------
django-admin.py createsuperuser --settings=geonode.settings
# remember these credentials for the "Start Django" step below

### Start jetty and django separately
# ------------------------------------------------

# ------------------------------------------------
# Start jetty
# ------------------------------------------------
# Open a new terminal, ssh into vagrant and run these lines:
cd /vagrant/cga-worldmap
workon worldmap
paver start_geoserver &

# Open a web browser on your local machine (not the VM)
# Go to: http://localhost:8080  
# credentials: admin/admin
