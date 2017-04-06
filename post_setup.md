
### SSH into vagrant
```
vagrant ssh
```


### Add monthly stores

- Create postgis tables in the db for the next 1-2 months
  - This is for test.  (The prod system makes monthly db tables to store new layers)
  - For naming, use the format "wm_YYYYMM".
    - Example names: "wm_201703", "wm_201704"

```
createdb -E UTF8 -U wm_user -T template_postgis wm_201703
createdb -E UTF8 -U wm_user -T template_postgis wm_201704
```

  - **Note:** Remember the db names for the step below titled "Add geoserver stores"


### Geonode install steps

```
cd /vagrant/cga-worldmap/
git submodule update --init
source ~/.bashrc
mkvirtualenv worldmap
```

### Run pip install

- ~~edit: ```pip install -r shared/requirements.txt```~~
- ~~comment out: ```pip==1.0```~~
  - ~~e.g. ```#pip==1.0```~~

- Run it:

```  
pip install -r shared/requirements.txt
```

### Jetty config update

- Jetty.xml adjustment for host and port.  Note host is "0.0.0.0"

```
<Set name="host"><SystemProperty name="jetty.host" default="0.0.0.0"/></Set>
<Set name="port"><SystemProperty name="jetty.port" default="8080"/></Set>
```

### Continue on with paver steps
- Next install steps

```
workon worldmap

#pip install pip==1.0    # revert for paver build script

pip uninstall django
pip install Django==1.4.13 --no-cache-dir

paver build # see note2 below
pip install --upgrade pip

django-admin.py createsuperuser --settings=geonode.settings
```

### Start jetty and django separately

- Start jetty

```
cd /vagrant/cga-worldmap
workon worldmap
paver start_geoserver
```

- Open: http://localhost:8080  
  - admin/admin


- Start Django in another window

```
cd /vagrant/cga-worldmap
workon worldmap
python manage.py runserver 0.0.0.0:8000
```

- Open: http://localhost:8000
  - rp/123


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
