# cvs-wms

Create WMS database locally

## Prerequisites :
installed Liquibase
installed MySQL Database Software
installed MySQL Connector/J (https://dev.mysql.com/doc/connectors/en/connector-j-binary-installation.html)

## Liquibase Steps

### Create configuration file liquibase.properties, provide database name (default: WMS_EDH_STAGING), database username and password and class path to MySQL J/Connector.

```properties
driver: com.mysql.cj.jdbc.Driver
url: jdbc:mysql://localhost:3306/CVSBNOP?createDatabaseIfNotExist=true
username: root
password: password
classpath: mysql-connector-java-8.0.23.jar
```

### Once database is up and running (database user needs to have privileges in order to create database objects)

Run: `liquibase --defaultsFile liquibase.properties --changeLogFile changelog-master.xml update`

Running without configuration file (provide missing paths / user credentials):

`liquibase --url=jdbc:mysql://localhost:3306/CVSB19155?createDatabaseIfNotExist=true --driver=com.mysql.cj.jdbc.Driver --classpath=mysql-connector-java-8.0.23.jar --username=root --password=password --changeLogFile changelog-master.xml update`

Quick step to instantiate database in Docker:

`docker run --name local-mysql -e MYSQL_ROOT_PASSWORD=password -p3306:3306 -d mysql:5.7`

## Test Data
Scripts are available in `/test-data` to populate the database with data.