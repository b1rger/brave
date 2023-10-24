FROM python:3.11-slim-bookworm

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENV PYTHONPATH=/src

RUN apt-get update && \
    apt-get install -yq \
    gstreamer1.0-wpe \
    gstreamer1.0-tools \
    gstreamer1.0-rtsp \
    gstreamer1.0-python3-plugin-loader  \
    gstreamer1.0-pulseaudio  \
    gstreamer1.0-plugins-ugly  \
    gstreamer1.0-plugins-good  \
    gstreamer1.0-plugins-base-apps  \
    gstreamer1.0-plugins-bad-apps  \
    gstreamer1.0-plugins-bad  \
    gstreamer1.0-pipewire  \
    gstreamer1.0-libav \
    gstreamer1.0-nice \
    libcairo2 \
    libcairo2-dev \
    libgirepository-1.0-1 \
    libgirepository1.0-dev  \
    gstreamer1.0-plugins-bad \
    gir1.2-gst-plugins-bad-1.0 \
    gir1.2-gstreamer-1.0 \
    gir1.2-gst-plugins-base-1.0  \
    gstreamer1.0-vaapi vainfo

COPY . /src
RUN cd /src && pip install . --ignore-installed && mkdir -p /usr/local/share/brave/output_images/

EXPOSE 5000
WORKDIR /src
CMD ["brave-cli"]
