export TOMCAT_VERSION=8.0.0-RC10
export NAVAJO_VERSION=2.11.18-SNAPSHOT
export NAVAJO_BRANCH=master
export NAVAJO_REPO=https://repo.dexels.com/nexus/content/repositories/navajo_test/
export NAVAJO_SNAPSHOT_REPO=https://repo.dexels.com/nexus/content/repositories/navajo_test_snapshot/
#export NAVAJO_REPO=https://repo.dexels.com/nexus/content/repositories/navajo/
export PUBLIC_REPO=https://repo.dexels.com/nexus/content/groups/public/
export SETTINGS="/home/robot/testdeploy/settings.xml"
rm -rf ~/.m2/repository
rm -rf tmp
mkdir -p navajo
cd navajo
cd com.sportlink.serv
git reset --hard
git pull
git clean -fd
git checkout $NAVAJO_BRANCH
cd navajo/adapters
#mvn org.apache.maven.plugins:maven-dependency-plugin:2.4:get -DrepoUrl=${NAVAJO_SNAPSHOT_REPO} -Dartifact=com.dexels.navajo:com.sportlink.aaa:1.0.22-SNAPSHOT -U -Ddest=com.sportlink.aaa.jar
#mvn org.apache.maven.plugins:maven-dependency-plugin:2.4:get -DrepoUrl=${NAVAJO_SNAPSHOT_REPO} -Dartifact=com.dexels.navajo:com.sportlink.adapters:1.0.41-SNAPSHOT -U -Ddest=com.sportlink.adapters.jar
#mvn org.apache.maven.plugins:maven-dependency-plugin:2.4:get -DrepoUrl=${NAVAJO_SNAPSHOT_REPO} -Dartifact=com.dexels.navajo:com.sportlink.comp:1.0.13-SNAPSHOT -U -Ddest=com.sportlink.comp.jar
#mvn org.apache.maven.plugins:maven-dependency-plugin:2.4:get -DrepoUrl=${NAVAJO_SNAPSHOT_REPO} -Dartifact=com.dexels.navajo:com.sportlink.financial.functions:1.0.28-SNAPSHOT -U -Ddest=com.sportlink.financial.functions.jar
#mvn org.apache.maven.plugins:maven-dependency-plugin:2.4:get -DrepoUrl=${NAVAJO_SNAPSHOT_REPO} -Dartifact=com.dexels.navajo:com.sportlink.financial.adapters:1.0.6-SNAPSHOT -U -Ddest=com.sportlink.financial.adapters.jar
#mvn org.apache.maven.plugins:maven-dependency-plugin:2.4:get -DrepoUrl=${NAVAJO_SNAPSHOT_REPO} -Dartifact=com.dexels.navajo:com.sportlink.nevobo.dps:1.0.2-SNAPSHOT -U -Ddest=com.sportlink.nevobo.dps.jar
#mvn org.apache.maven.plugins:maven-dependency-plugin:2.4:get -DrepoUrl=${NAVAJO_SNAPSHOT_REPO} -Dartifact=com.dexels.navajo:com.sportlink.optimizepool:1.0.9-SNAPSHOT -U -Ddest=com.sportlink.optimizepool.jar
#mvn org.apache.maven.plugins:maven-dependency-plugin:2.4:get -DrepoUrl=${NAVAJO_SNAPSHOT_REPO} -Dartifact=com.dexels.navajo:com.sportlink.tensing:1.0.3-SNAPSHOT -U -Ddest=com.sportlink.tensing.jar

mvn org.apache.maven.plugins:maven-dependency-plugin:2.4:get --settings ${SETTINGS} -Dartifact=com.dexels.navajo:com.sportlink.aaa:LATEST -U -Ddest=com.sportlink.aaa.jar
mvn org.apache.maven.plugins:maven-dependency-plugin:2.4:get --settings ${SETTINGS} -Dartifact=com.dexels.navajo:com.sportlink.adapters:LATEST -U -Ddest=com.sportlink.adapters.jar
mvn org.apache.maven.plugins:maven-dependency-plugin:2.4:get --settings ${SETTINGS} -Dartifact=com.dexels.navajo:com.sportlink.comp:LATEST -U -Ddest=com.sportlink.comp.jar
mvn org.apache.maven.plugins:maven-dependency-plugin:2.4:get --settings ${SETTINGS} -Dartifact=com.dexels.navajo:com.sportlink.financial.functions:LATEST -U -Ddest=com.sportlink.financial.functions.jar
mvn org.apache.maven.plugins:maven-dependency-plugin:2.4:get --settings ${SETTINGS} -Dartifact=com.dexels.navajo:com.sportlink.financial.adapters:LATEST -U -Ddest=com.sportlink.financial.adapters.jar
mvn org.apache.maven.plugins:maven-dependency-plugin:2.4:get --settings ${SETTINGS} -Dartifact=com.dexels.navajo:com.sportlink.nevobo.dps:LATEST -U -Ddest=com.sportlink.nevobo.dps.jar
mvn org.apache.maven.plugins:maven-dependency-plugin:2.4:get --settings ${SETTINGS} -Dartifact=com.dexels.navajo:com.sportlink.optimizepool:LATEST -U -Ddest=com.sportlink.optimizepool.jar
mvn org.apache.maven.plugins:maven-dependency-plugin:2.4:get --settings ${SETTINGS} -Dartifact=com.dexels.navajo:com.sportlink.tensing:LATEST -U -Ddest=com.sportlink.tensing.jar

cd ../../../..

mkdir -p tmp
# http://apache.xl-mirror.nl/tomcat/tomcat-7/v7.0.41/bin/apache-tomcat-7.0.41.tar.gz
# http://ftp.nluug.nl/internet/apache/tomcat/tomcat-8/v8.0.0-RC3/bin/apache-tomcat-8.0.0-RC3.tar.gz
#wget -O tmp/tomcat.tgz  http://apache.xl-mirror.nl/tomcat/tomcat-7/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz
wget -O tmp/tomcat.tgz  http://ftp.nluug.nl/internet/apache/tomcat/tomcat-8/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz
# http://apache.proserve.nl/tomcat/tomcat-7/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz
cd tmp
tar xfz tomcat.tgz
mv apache-tomcat-${TOMCAT_VERSION} tomcat
rm  tomcat.tgz
cd tomcat/lib
mvn org.apache.maven.plugins:maven-dependency-plugin:2.4:get -DrepoUrl=${PUBLIC_REPO} -Dartifact=org.slf4j:slf4j-api:1.7.5 -U -Ddest=slf4j-api-1.7.5.jar
mvn org.apache.maven.plugins:maven-dependency-plugin:2.4:get -DrepoUrl=${PUBLIC_REPO} -Dartifact=org.slf4j:slf4j-simple:1.7.5 -U -Ddest=slf4j-simple-1.7.5.jar
mvn org.apache.maven.plugins:maven-dependency-plugin:2.4:get -DrepoUrl=${PUBLIC_REPO} -Dartifact=com.oracle:com.oracle.jdbc.driver:11.2.33 -U -Ddest=com.oracle.driver_11.2.3.jar
cd ../..
cd tomcat/webapps
#wget -O navajo.war https://repo.dexels.com/nexus/service/local/repositories/navajo/content/com/dexels/navajo/com.dexels.navajo.enterprise.war/${NAVAJO_VERSION}/com.dexels.navajo.enterprise.war-${NAVAJO_VERSION}.war
mvn org.apache.maven.plugins:maven-dependency-plugin:2.4:get --settings ${SETTINGS} -Ddest=navajo.war -Dartifact=com.dexels.navajo:com.dexels.navajo.enterprise.war.sportlink:${NAVAJO_VERSION}:war -U

cd ../lib
cp /usr/jdk1.7.0/lib/tools.jar .
cd ../conf
sed -i -e 's/8080/9090/g' server.xml
sed -i -e 's/8009/9009/g' server.xml
sed -i -e 's/8005/9005/g' server.xml
cp ../../../tomcat-users.xml .
cd ../bin
./catalina.sh run
