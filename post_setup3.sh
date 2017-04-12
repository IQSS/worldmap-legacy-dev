#!/bin/sh
# ------------------------------------------------
# Start Django in another window
# ------------------------------------------------
# Open a new terminal, ssh into vagrant and run these lines:
cd /vagrant/cga-worldmap
workon worldmap
python manage.py runserver 0.0.0.0:8000

# Open a web browser on your local machine (not the VM)
# Go to: http://localhost:8000  
# Use the credentials from the 'createsuperuser' step above

#------------------------------------------------
## Add geoserver stores
#------------------------------------------------
#  - Log into http://0.0.0.0:8080/geoserver/web/
#    - creds: admin/geoserver
#  - From the left column, click "Stores"
#  - Click "Add New Store"
#  - For "New Data Source", choose "PostGIS - PostGIS Database"
#  - Add each of your databases from the steps above titled:
#    - "Add monthly stores"
#      - e.g. "wm_201703", "wm_201704"
#    - "Add Dataverse store"
#      - e.g. "dataverse"
#  - The username/password for these steps is:
#      - wm_user/wm_password
