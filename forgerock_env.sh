#!/bin/bash
if [ "$0" != "bash" ]; then
echo This should be sourced to set the envirnment variables.
echo $''
echo Therefore run: ". $0"
echo $''
fi
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export M2_HOME=/usr/share/maven
export M2=/usr/share/maven/bin
export MAVEN_OPTS='-Xmx2g -Xms2g -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=512m'
