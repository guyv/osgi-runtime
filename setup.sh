#!/bin/bash

rm -rf lib
mkdir -p lib

wget -O lib/org.eclipse.osgi.jar "http://eclipse.mirror.kangaroot.net/equinox/drops/R-Luna-201406061215/org.eclipse.osgi_3.10.0.v20140606-1445.jar" 

wget -O lib/org.apache.felix.gogo.runtime.jar "http://central.maven.org/maven2/org/apache/felix/org.apache.felix.gogo.runtime/0.12.1/org.apache.felix.gogo.runtime-0.12.1.jar" 
wget -O lib/org.apache.felix.gogo.command.jar "http://central.maven.org/maven2/org/apache/felix/org.apache.felix.gogo.command/0.14.0/org.apache.felix.gogo.command-0.14.0.jar"
wget -O lib/org.apache.felix.gogo.shell.jar "http://central.maven.org/maven2/org/apache/felix/org.apache.felix.gogo.shell/0.10.0/org.apache.felix.gogo.shell-0.10.0.jar"
wget -O lib/org.eclipse.equinox.console.jar "http://www.eclipse.org/downloads/download.php?file=/equinox/drops/R-Luna-201406061215/org.eclipse.equinox.console_1.1.0.v20140131-1639.jar&r=1"

wget -O lib/org.apache.felix.bundlerepository.jar "http://central.maven.org/maven2/org/apache/felix/org.apache.felix.bundlerepository/2.0.2/org.apache.felix.bundlerepository-2.0.2.jar"

cd src

javac -cp ../lib/org.eclipse.osgi.jar eu/mjelen/runtime/Main.java
jar cf ../lib/eu.mjelen.runtime.jar eu/mjelen/runtime/Main.class

rm eu/mjelen/runtime/Main.class

cd ..
