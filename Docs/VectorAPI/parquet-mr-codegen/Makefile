clean:
	/home/jbhateja/softwares/apache-maven-3.8.6/bin/mvn clean
	rm -rf VectorBitUnpack*.java VectorBitPacker*.java *.class
build:
	/home/jbhateja/softwares/apache-maven-3.8.6/bin/mvn clean install
help:
	java -jar target/codegen-1.0-SNAPSHOT.jar

all: clean build
