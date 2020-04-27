#!/usr/bin/env bash

PROG_FILE="target/rookout-slf-problem-0.0.1-SNAPSHOT.jar";
ROOKOUT_JAR="rookJars/$1.jar";

function usage() {
    echo "make sure rookout environment variables are set"
    echo $"Usage: $0 [rookout version]"
    echo -e  "\t Results (check the last printed line of the app:"
    echo -e  "\t\t Success:"
    echo -e  "\t\t\t LogAndExit         : Print and Exit"
    echo -e  "\t\t Failure:"
    echo -e  "\t\t\t :: Spring Boot ::        (v2.2.6.RELEASE)"
    exit
}
if test -z $ROOKOUT_TOKEN; then
  echo "ROOKOUT_TOKEN environment variables is not set"
  usage
fi

if test -z $1; then
  echo "no rookout jar version specified"
  usage
fi

if test ! -f $ROOKOUT_JAR; then
    echo "### downloading rookout jar..."
    curl -L "https://repository.sonatype.org/service/local/artifact/maven/redirect?r=central-proxy&g=com.rookout&a=rook&v=$1" -o $ROOKOUT_JAR
fi


if test ! -f $PROG_FILE; then
    echo "### building project..."
    mvn package
fi

if test ! -d "rookJars"; then
    mkdir rookJars
fi

echo "### Running app..."
java -javaagent:$ROOKOUT_JAR -jar $PROG_FILE
