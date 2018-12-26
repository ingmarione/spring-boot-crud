FROM maven:latest

MAINTAINER Mario Fusco

EXPOSE 8484

RUN apt-get update

RUN apt-get -y install git

RUN git clone https://github.com/ingmarione/spring-boot-crud.git

WORKDIR spring-boot-crud/

ADD application.properties src/main/resources/application.properties

RUN mvn clean package -DskipTests

WORKDIR target/

CMD ["java","-Xdebug","-Xrunjdwp:server=y,transport=dt_socket,address=8000,suspend=n","-jar","spring-boot-crud.jar"]
