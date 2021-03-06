### Oracle JAVA
Download:
http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html
// http://www.oracle.com/technetwork/java/javase/downloads/index.html

Change to the directory in which you want to install. Type:
cd directory_path_name
For example, to install the software in the /usr/java/ directory, Type:
mkdir /usr/java/

Move the .tar.gz archive binary to the /usr/java.
Unpack the tarball and install Java
tar -zxvf jdk-10.0.2_linux-x64_bin.tar.gz -C /usr/java

The Java files are installed in a directory called jdk-10.0.2.
In this example, it is installed in the /usr/java/jdk-10.0.2 directory.
When the installation has completed, you will see the word Done.
Delete the .tar.gz file if you want to save disk space.

### Setting JAVA_HOME path:
The preferred location for JAVA_HOME or any system variable is /etc/environment.

Open /etc/environment in any text editor like nano or gedit and add the following line:

JAVA_HOME="/usr/java/jdk-10.0.2"
(java path could be different)

Use source to load the variables, by running this command:

source /etc/environment
Then check the variable, by running this command:

echo $JAVA_HOME
Update

Usually most linux systems source /etc/environment by default. If your system doesn't do that add the following line to ~/.bashrc

source /etc/environment


### Install (java -version)
Type:
sudo update-alternatives --install /usr/bin/java java /usr/java/jdk-10.0.2/bin/java 100

Check:
```shell
$ update-alternatives --display java
java - auto mode
  link best version is /usr/java/jdk-10.0.2/bin/java
  link currently points to /usr/java/jdk-10.0.2/bin/java
  link java is /usr/bin/java
```

```shell
$ java -version
java version "10.0.2" 2018-07-17
Java(TM) SE Runtime Environment 18.3 (build 10.0.2+13)
Java HotSpot(TM) 64-Bit Server VM 18.3 (build 10.0.2+13, mixed mode)
```



IF!!! Logstash Doesn't Install..
Install openjdk-8-jre
$ sudo apt-get install openjdk-8-jre

