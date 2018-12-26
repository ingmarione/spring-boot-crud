FROM maven:latest

MAINTAINER Mario Fusco

EXPOSE 8488

RUN apt-get update

RUN apt-get -y install git

RUN git clone https://github.com/ingmarione/spring-boot-crud.git

WORKDIR spring-boot-crud/

RUN mvn clean package -DskipTests

WORKDIR target/

CMD ["java","-Xdebug","-Xrunjdwp:server=y,transport=dt_socket,address=8000,suspend=n","-jar","spring-boot-crud.jar"]
