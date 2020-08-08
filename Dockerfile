FROM debian:latest

RUN apt-get update  \
    && apt-get upgrade -y  
COPY unreal-dedicated.tar.gz .
RUN tar -xzf ./unreal-dedicated.tar.gz

RUN useradd -u 1000 -m lastways \
    && chown lastways:lastways -R ./Linux

USER lastways
EXPOSE 7777/udp

ENTRYPOINT [ "./Linux/LinuxServer/LastWaysServer.sh" ]