#!/bin/bash

rm -rf lib
mkdir -p lib

wget -O lib/org.eclipse.osgi.jar "http://www.eclipse.org/downloads/download.php?file=/equinox/drops/R-Kepler-201306052000/org.eclipse.osgi_3.9.0.v20130529-1710.jar&r=1"

wget -O lib/org.apache.felix.gogo.runtime.jar "http://mirror.hosting90.cz/apache/felix/org.apache.felix.gogo.runtime-0.10.0.jar"
wget -O lib/org.apache.felix.gogo.command.jar "http://mirror.hosting90.cz/apache/felix/org.apache.felix.gogo.command-0.12.0.jar"
wget -O lib/org.apache.felix.gogo.shell.jar "http://mirror.hosting90.cz/apache/felix/org.apache.felix.gogo.shell-0.10.0.jar"
wget -O lib/org.eclipse.equinox.console.jar "http://www.eclipse.org/downloads/download.php?file=/equinox/drops/R-Kepler-201306052000/org.eclipse.equinox.console_1.0.100.v20130429-0953.jar&r=1"

wget -O lib/org.apache.felix.bundlerepository.jar "http://mirror.hosting90.cz/apache/felix/org.apache.felix.bundlerepository-1.6.6.jar"

cd src

javac -cp ../lib/org.eclipse.osgi.jar eu/mjelen/runtime/Main.java
jar cf ../lib/eu.mjelen.runtime.jar eu/mjelen/runtime/Main.class

rm eu/mjelen/runtime/Main.class

cd ..
