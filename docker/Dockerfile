FROM microsoft/mssql-server-linux:latest
MAINTAINER Jorge Santos

RUN apt-get update 
RUN apt-get install -y git
RUN mkdir files
RUN chmod 755 files

EXPOSE 1433

ENTRYPOINT ["/opt/mssql/bin/sqlservr"]