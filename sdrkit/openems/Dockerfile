FROM ubuntu:latest

RUN apt update
# required
RUN apt-get install -y --no-install-recommends build-essential git cmake libhdf5-dev libvtk5-dev libboost-all-dev libcgal-dev libtinyxml-dev libqt4-dev libvtk5-qt4-dev qtbase5-dev libcgal-qt5-dev
# optional
RUN apt-get install -y --no-install-recommends octave liboctave-dev epstool transfig paraview
RUN apt-get install -y --no-install-recommends wget
RUN cd /tmp && wget http://openems.de/download/src/openEMS-v0.0.35.tar.bz2 && tar jxf openEMS-v0.0.35.tar.bz2

RUN cd /tmp/openEMS && ( ./update_openEMS.sh /opt/openEMS || (cat /tmp/openEMS/*log && exit 1) )
ADD octaverc /octaverc
RUN cat /octaverc >>/etc/octaverc