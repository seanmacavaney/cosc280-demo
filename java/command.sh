#!/bin/sh

echo compiling
javac *.java && \

echo running select && echo && \
java -cp .:mysql.jar Select

echo running insert && echo && \
java -cp .:mysql.jar Insert Michelle Obama 2023932343 54
