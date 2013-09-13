package eu.mjelen.runtime;

import org.osgi.framework.Bundle;
import org.osgi.framework.BundleException;
import org.osgi.framework.InvalidSyntaxException;
import org.osgi.framework.launch.Framework;
import org.osgi.framework.launch.FrameworkFactory;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.ServiceLoader;

public class Main {
    
    @SuppressWarnings("unchecked")
    public static void main(String[] args) throws BundleException, InterruptedException, IOException, InvalidSyntaxException {

        System.getProperties().load(new FileInputStream("config/system.properties"));

        FrameworkFactory ff = ServiceLoader.load(FrameworkFactory.class).iterator().next();

        Properties config = new Properties();
        config.load(new FileInputStream("config/osgi.properties"));

        Framework fwk = ff.newFramework(new HashMap((Map) config));

        fwk.start();

        String[] bundles = {"org.apache.felix.bundlerepository.jar","org.apache.felix.gogo.runtime.jar","org.apache.felix.gogo.command.jar","org.apache.felix.gogo.shell.jar", "org.eclipse.equinox.console.jar"};

        for(String bundle : bundles){
            Bundle b = fwk.getBundleContext().installBundle("file:lib/" + bundle);
            b.start();
        }

        fwk.waitForStop(0);
    }

}

