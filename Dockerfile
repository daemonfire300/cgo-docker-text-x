FROM golang:latest

#RUN apt-get update && apt-get install -y build-essential  libxml2-dev libfftw3-dev libmagickwand-dev libopenexr-dev liborc-0.4-0 gobject-introspection libgsf-1-dev
#RUN apt-get update && apt-get install -y libvips-dev libvips



RUN mkdir -p /go/src/app

WORKDIR /go/src/app
COPY . .
RUN apt-get update && \
    apt-get install -y --no-install-recommends lsb-release && \
    chmod +x libvips-installer.sh && \ 
    ./libvips-installer.sh && \
    apt-get install -y --no-install-recommends libvips-dev libgsf-1-dev libmagickcore-dev
#RUN go install -v
RUN go build -v -ldflags '-extldflags "-static"' ...
RUN apt-get purge -y automake build-essential gtk-doc-tools  libglib2.0-dev libjpeg-turbo8-dev libpng12-dev libwebp-dev libtiff5-dev libexif-dev libgsf-1-dev liblcms2-dev libxml2-dev swig curl && \
    apt-get autoremove -y
    #apt-get install -y --no-install-recommends libvips-dev libgsf-1-dev libmagickcore-dev && \
    #apt-get autoremove -y
#RUN apt-get purge -y swig curl && apt-get autoremove -y

CMD ["app"]