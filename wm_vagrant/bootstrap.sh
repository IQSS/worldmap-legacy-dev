#!/usr/bin/env bash

#Attempt to install cga-worldmap:
# https://github.com/cga-harvard/cga-worldmap


# ------------------------------------------------
# Install vim (for editing)
# ------------------------------------------------
echo "-- Install vim (for editing) --"
sudo apt-get --assume-yes install vim

# ------------------------------------------------
# Install c (to have)
# ------------------------------------------------
echo "-- Install curl "
sudo apt-get --assume-yes install curl


# ------------------------------------------------
# Pip + virtualenvwrapper
# ------------------------------------------------
echo "-- Install Pip + virtualenvwrapper "
sudo apt-get -y install python-pip
sudo pip install virtualenvwrapper
mkdir ~/.virtualenvs
export WORKON_HOME=~/.virtualenvs
pip install --upgrade pip

# ------------------------------------------------
# Install git
# ------------------------------------------------
echo "-- Install git --"
sudo apt-get --assume-yes install git

# ------------------------------------------------
# Install subversion
# ------------------------------------------------
echo "-- Install subversion --"
sudo apt-get --assume-yes install subversion

# ------------------------------------------------
# Install xclip
# ------------------------------------------------
#echo "-- Install xclip, helpful if adding ssh key to github later --"
#sudo apt-get --assume-yes install xclip~~

# ------------------------------------------------
# Java 1.7
# reference: http://stackoverflow.com/questions/16263556/installing-java-7-on-ubuntu
# ------------------------------------------------
echo "-- Install Java 1.7 --"
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update
sudo apt-get --assume-yes install openjdk-7-jdk
#sudo update-alternatives --config java
#sudo apt-get install oracle-java7-set-default

export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/jre
export PATH=$PATH:$JAVA_HOME/bin

# ------------------------------------------------
# precursors for geos
# ------------------------------------------------
echo "-- Install precursors for geos --"
sudo apt-get install make
sudo apt-get --assume-yes install build-essential

# ------------------------------------------------
# for GEOS
# -  https://docs.djangoproject.com/en/1.10/ref/contrib/gis/install/geolibs/
# ------------------------------------------------
echo "-- Install GEOS --"
wget http://download.osgeo.org/geos/geos-3.6.1.tar.bz2
tar xjf geos-3.6.1.tar.bz2
cd geos-3.6.1
echo "-- Install GEOS .. configure --"
sudo ./configure
echo "-- Install GEOS .. make --"
sudo make
echo "-- Install GEOS .. make install --"
sudo make install
cd ..
rm geos-3.6.1.tar.bz2

# ------------------------------------------------
# Precursors for GDAL/OGR
# http://askubuntu.com/questions/493460/how-to-install-add-apt-repository-using-the-terminal
# ------------------------------------------------
echo "-- Install Precursors for GDAL/OGR --"
sudo apt-get install software-properties-common
sudo apt-get --assume-yes install python-software-properties

# ------------------------------------------------
# GDAL/OGR
# http://www.sarasafavi.com/installing-gdalogr-on-ubuntu.html
# ------------------------------------------------
echo "-- Install GDAL/OGR --"
sudo add-apt-repository ppa:ubuntugis/ppa -y && sudo apt-get update
sudo apt-get --assume-yes install gdal-bin

# ------------------------------------------------
# Apache Maven
# ------------------------------------------------
echo "-- Install Apache Maven --"
sudo apt-get --assume-yes install maven

#sudo apt-get remove maven
#apt-get autoremove

# ------------------------------------------------
# jetty
# ------------------------------------------------
echo "-- Install jetty --"
sudo apt-get --assume-yes install jetty
#sudo apt-get remove jetty

# ------------------------------------------------
# Apache ant
# ------------------------------------------------
echo "-- Install Apache ant --"
sudo apt-get --assume-yes install ant
#Not creating home directory `/usr/share/jetty'.
# * Not starting jetty - edit /etc/default/jetty and change #NO_START to be 0 (or comment it out).


# ------------------------------------------------
# Pre-Postgres
# http://crohr.me/journal/2014/postgres-rails-the-chosen-lc-ctype-setting-requires-encoding-latin1.html
# ------------------------------------------------
echo "-- (skip) Install Pre-Postgres --"
#sudo locale-gen en_US.UTF-8
#sudo cat - > /etc/default/locale <<EOF
#LANG=en_US.UTF-8
#LANGUAGE=
#LC_CTYPE="en_US.UTF-8"
#LC_NUMERIC="en_US.UTF-8"
#LC_TIME="en_US.UTF-8"
#LC_COLLATE="en_US.UTF-8"
#LC_MONETARY="en_US.UTF-8"
#LC_MESSAGES="en_US.UTF-8"
#LC_PAPER="en_US.UTF-8"
#LC_NAME="en_US.UTF-8"
#LC_ADDRESS="en_US.UTF-8"
#LC_TELEPHONE="en_US.UTF-8"
#LC_MEASUREMENT="en_US.UTF-8"
#LC_IDENTIFICATION="en_US.UTF-8"
#LC_ALL=en_US.UTF-8
#EOF

# ------------------------------------------------
# Postgres
# - http://www.saintsjd.com/2014/08/13/howto-install-postgis-on-ubuntu-trusty.html
# ------------------------------------------------
echo "-- Install Postgres --"
sudo apt-get install -y postgresql postgresql-contrib

# test user and db
#sudo -u postgres createuser -P wmadmin
#sudo -u postgres createdb -O wmadmin testit
#psql -h localhost -U wmadmin testit

# ------------------------------------------------
# Postgis
# ------------------------------------------------
echo "-- Install Postgis --"
sudo apt-get install -y postgis postgresql-9.3-postgis-2.2

# ------------------------------------------------
# psycopg2
#
# see: http://stackoverflow.com/questions/28253681/you-need-to-install-postgresql-server-dev-x-y-for-building-a-server-side-extensi
# ------------------------------------------------
echo "-- Install psycopg2 --"
sudo apt-get install --assume-yes python-psycopg2
sudo apt-get install --assume-yes libpq-dev


# ------------------------------------------------
# pre-reqs for Pillow
# ------------------------------------------------
echo "-- dependencies for Pillow install --"
sudo apt-get install --assume-yes libjpeg-dev
sudo apt-get build-dep --assume-yes python-imaging

# ------------------------------------------------
# fix for paver fail
# see: https://github.com/scieloorg/packtools/issues/12
# ------------------------------------------------
echo "-- dependencies for pip requirements --"
sudo apt-get install --assume-yes libxml2-dev
sudo apt-get install --assume-yes libxslt1-dev

# ------------------------------------------------
# Add these lines to the end of the .bashrc file
# . /usr/local/bin/virtualenvwrapper.sh
# export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/jre
# export PATH=$PATH:$JAVA_HOME/bin
# export WORKON_HOME=~/.virtualenvs


# ------------------------------------------------
sudo sed -i '$ a\\n# from worldmap set-up\n. /usr/local/bin/virtualenvwrapper.sh\nexport JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/jre\nexport PATH=$PATH:$JAVA_HOME/bin\nexport WORKON_HOME=~/.virtualenvs' /home/vagrant/.bashrc

# ------------------------------------------------
# Update pg_hba.conf conf file
#
# Replace the 2nd and 3rd occurrences of "peer" with "md5"
#
# Reference: http://stackoverflow.com/questions/18664074/getting-error-peer-authentication-failed-for-user-postgres-when-trying-to-ge
# ------------------------------------------------
echo "-- Postgres. Update conf file to fix peer authentication failure --"

# Replace 2nd occurrence
sudo sed -i ':a N;$!ba; s/peer/md5/2' /etc/postgresql/9.3/main/pg_hba.conf

# Replace 2nd occurrence again--originally the 3rd occurrence
sudo sed -i ':a N;$!ba; s/peer/md5/2' /etc/postgresql/9.3/main/pg_hba.conf

# Open db for password Reset
sudo sed -i '1s/^/local  all   all   trust\n/' /etc/postgresql/9.3/main/pg_hba.conf

# Restart postgres
echo "-- Restart postgres --"

sudo service postgresql restart

# ------------------------------------------------
# Update postgres password to '123'
# ------------------------------------------------
echo "-- Set postgres user password to '123' --"

psql -U postgres -c "ALTER USER postgres with password '123';"

# Remove 1st line that allows postgres password reset
sudo sed -i '1d' /etc/postgresql/9.3/main/pg_hba.conf

# Restart postgres (again)
echo "-- Restart postgres (again) --"

sudo service postgresql restart

# ------------------------------------------------
# Add postgres .pgpass file
# ------------------------------------------------
echo "-- Add postgres .pgpass file --"
echo -n "*:*:*:postgres:123" > /home/vagrant/.pgpass
chmod 600 .pgpass
export PGPASSFILE=/home/vagrant/.pgpass
# ------------------------------------------------
# Postgres: Create/update databases
# ------------------------------------------------
echo "-- Postgres: update db, create db --"
#
PGPASSWORD=123 psql -U postgres -c "update pg_database set datistemplate=false where datname='template1';"
PGPASSWORD=123 psql -U postgres -c "drop database Template1;"
PGPASSWORD=123 psql -U postgres -c "create database template1 with owner=postgres encoding='UTF-8' lc_collate='en_US.utf8' lc_ctype='en_US.utf8' template template0;"
PGPASSWORD=123 psql -U postgres -c "update pg_database set datistemplate=true where datname='template1';"

# ------------------------------------------------
# Postgres: create wm_user
# ------------------------------------------------
echo "-- Postgres: create wm_user with superuser privileges --"
#
PGPASSWORD=123 psql -U postgres -c "CREATE USER wm_user WITH PASSWORD 'wm_password' SUPERUSER LOGIN;"


# ------------------------------------------------
# Create PostGIS template with legacy GIST operators
# ------------------------------------------------
echo "-- Postgres: create template_postgis --"

PGPASSWORD=123 createdb -U postgres -E UTF8 -O wm_user template_postgis

PGPASSWORD=123 psql -U postgres -d template_postgis -c "CREATE EXTENSION postgis;"

PGPASSWORD=123 psql -U postgres -d template_postgis -f /vagrant/cga-worldmap/geonode/static/geonode/patches/postgis/legacy_gist.sql


# ------------------------------------------------
# Create worldmap databases
# ------------------------------------------------
echo "-- Postgres: create worldmap databases --"

PGPASSWORD=123 createdb -U postgres -E UTF8 -T template_postgis wm_db
PGPASSWORD=123 createdb -U postgres -E UTF8 -T template_postgis wmdata

# ------------------------------------------------
# Create monthly dbs for next 15 months
#  The prod system makes monthly dbs to store new layers)
#  - For naming, use the format "wm_YYYYMM".
#    - Example names: "wm_201703", "wm_201704"
# ------------------------------------------------
echo "Create monthly dbs for next 15 months..."
d=$(date +'%Y-%m-%d')
for i in {1..15}; do
  #echo $d
  d=$(date -I -d "$d + 1 month")
  echo "Create database wm_${d:0:4}${d:5:2}"
  PGPASSWORD=123 createdb -E UTF8 -U postgres -T template_postgis wm_"${d:0:4}${d:5:2}"
done

# ------------------------------------------------
# Add Dataverse store
# If you're using WorldMap with Dataverse, where Dataverse (http://dataverse.org/)
# can create layers via API, then add a "dataverse" table.
# ------------------------------------------------
echo "Add dataverse db..."
PGPASSWORD=123 createdb -E UTF8 -U postgres -T template_postgis dataverse


# ------------------------------------------------
# Geonode install steps
# ------------------------------------------------
echo "Geonode install steps..."

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

# activate the virtualenv directly
source /home/vagrant/.virtualenvs/worldmap/bin/activate
#workon worldmap

echo "-- Run paver build --"
# Run paver build
# ------------------------------------------------
paver build # see note2 below

# ------------------------------------------------
# Upgrade pip and reinstall django
# ------------------------------------------------
#echo "-- upgrade pip --"
#pip install --upgrade pip
#pip uninstall django
#pip install Django==1.4.13


# ------------------------------------------------
# Onto manual install steps
# ------------------------------------------------
echo "--- Run manual steps!  See post_setup.md ---"
