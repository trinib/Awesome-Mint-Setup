### Enable High Quality Audio on Linux from 

https://medium.com/@gamunu/enable-high-quality-audio-on-linux-6f16f3fe7e1f

#
First you have to do little bit of tweaking of the Pulse configuration, to match your preference by creating the daemon.conf file in your home config directory:

 `nano ~/.config/pulse/daemon.conf`

Or you can directly modify /etc/pulse/daemon.conf. Although be careful and have a backup of original configuration to restore if you messed it up.

    sudo nano /etc/pulse/daemon.conf

And add or modify below options:
```
default-sample-format = float32le
default-sample-rate = 48000
alternate-sample-rate = 44100
default-sample-channels = 2
default-channel-map = front-left,front-right
default-fragments = 2
default-fragment-size-msec = 125
resample-method = soxr-vhq
enable-lfe-remixing = no
high-priority = yes
nice-level = -11
realtime-scheduling = yes
realtime-priority = 9
rlimit-rtprio = 9
daemonize = no
```

What are these configurations and what they do?
default-sample-format:

The default sampling format of the sampler. The quality will be different for each sample format. For me, float32le appears to be producing the highest quality of sound.

When determining sample format you must select it depending on your CPU architecture’s byte order or also called Endianness. You can determine your CPU’s byte order by using below command:

    lscpu | grep 'Byte Order'
    Byte Order:          Little Endian

In my case it’s Little Endian hence I have selected float32le. If your output returns Big Endian then select float32be sampling format.

Available sample formats:

`u8, s16le, s16be, s24le, s24be, s24-32le, s24-32be, s32le, s32be float32le, float32be, ulaw, alaw`
Some hardware drivers require the hardware playback buffer to be subdivided into several fragments. These configurations determines the number of fragments and a duration of a single fragment. Defaults are 4 and 25ms so the total buffer will be 100ms long. I have selected 2 and 125ms.

If you have a good sound card you can ignore this configuration since most of newer sound drivers support timer-base scheduling.
resample-method:

The resampling algorithm to use. I have selected soxr-vhq. It is the point sampler, which offers better sound quality than speex-* methods however it is CPU intensive.

Available values:

`src-sinc-best-quality, src-sinc-medium-quality, src-sinc-fastest, src-zero-order-hold, src-linear, trivial, speex-float-N, speex-fixed-N, ffmpeg, soxr-mq, soxr-hq, soxr-vhq.`


Finally you have to configure the alsa to get the best audio output:

`nano /etc/asound.conf`

The default configuration will be something similar to following:
```
# Use PulseAudio by default
pcm.!default {
  type pulse
  fallback "sysdefault"
  hint {
    show on
    description "Default ALSA Output (currently PulseAudio Sound Server)"
  }
}
```
Change it to this:
```
# Use PulseAudio plugin hw
pcm.!default {
   type plug
   slave.pcm hw
}
```
slave.pcm `hw` plugin will communicates directly with ALSA kernel driver. It is a raw communication without any conversion thus giving you a low latency audio output.

Then reboot your computer or restart Pulse and ALSA processes.

That’s it. Enjoy your favourite music on Linux hereafter. You will notice that sounds are much better and less noisy than Windows.
