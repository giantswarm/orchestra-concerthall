#!/bin/sh
echo starting jackd in dummy mode
jackd -d dummy -r 44100 &

sleep 5
echo starting jackd as a network manager
jack_load netmanager

echo starting vlc streamer in RTP mode
cvlc jack://channels=2:ports=.* --sout "#transcode{vcodec=none,acodec=opus,ab=128,channels=2,samplerate=44100}:rtp{port=1234,sdp=rtsp://0.0.0.0:9999/master.sdp" 
