
## SSH into vagrant
```
vagrant ssh
```

## Django create superuser

```
django-admin.py createsuperuser --settings=geonode.settings
```

## Start jetty in a separate Terminal

- Open new terminal
- cd into the directory ```.../worldmap-legacy-dev/wm_vagrant```
- Run these commands:

```
vagrant ssh
cd /vagrant/cga-worldmap
workon worldmap
paver start_geoserver
```

- On your local computer:
    - Open a browser
    - Go to: http://localhost:8080  
       - admin/geoserver

## Start Django in a separate Terminal

- Open new terminal
- cd into the directory ```.../worldmap-legacy-dev/wm_vagrant```
- Run these commands:

```
vagrant ssh
cd /vagrant/cga-worldmap
workon worldmap
python manage.py runserver 0.0.0.0:8000
```

- On your local computer:
    - Open a browser
    - Go to: http://localhost:8000  
       - use the username/pw from the "create superuser" step above


## Add geoserver stores

  - Log into http://0.0.0.0:8080/geoserver/web/
    - admin/geoserver
  - From the left column, click "Stores"
  - Click "Add New Store"
  - For "New Data Source", choose "PostGIS - PostGIS Database"
  - Add each of your databases from the steps above titled:
    - "Add monthly stores"
      - e.g. "wm_201703", "wm_201704"
    - "Add Dataverse store"
      - e.g. "dataverse"
  - The username/password for these steps is:
      - wm_user/wm_password

---

## OLD (skip)


- Temp django fix before paver build (may have been bad django install):
  - see item with 11 up votes:  http://stackoverflow.com/questions/31816158/attributeerror-nonetype-object-has-no-attribute-info


  ---
  # SKIP!!! Update for dbs
  ---
  sudo -u postgres psql
  \c wm_db
  \c wmdata

  - Run the following query for both ```wm_db``` and ```wmdata```
    - See query in file: ```index_fix.sql```
  - From: http://stackoverflow.com/questions/13119040/failed-to-install-index-geodjango-related
