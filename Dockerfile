FROM teemow/arch

RUN pacman -Sy
RUN pacman -Syu --noconfirm
RUN pacman -Sy --noconfirm vlc jack2
# WARNING, horrible hack to enable vlc to run as root!
RUN sed -i 's/geteuid/getppid/' /usr/bin/vlc

ADD startup.sh startup.sh

RUN pacman -Sy --noconfirm wget mplayer

#rtp port
EXPOSE 1234
#rtps port 9999
EXPOSE 9999
CMD ./startup.sh
