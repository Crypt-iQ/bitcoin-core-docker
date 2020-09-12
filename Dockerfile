FROM ubuntu:18.04

# If running with ASAN, Docker needs access to ptrace

#RUN apt-get update && apt-get -y install wget build-essential libtool git autotools-dev automake pkg-config bsdmainutils python3 libevent-dev libboost-system-dev libboost-filesystem-dev libboost-test-dev libboost-thread-dev

# Add our setup script to the container
ADD setup.sh /
RUN chmod +x /setup.sh
RUN /setup.sh
