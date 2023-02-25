FROM quay.io/toolbx-images/alpine-toolbox:3.17

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used with the toolbox or distrobox command" \
      summary="A cloud-native terminal experience"

COPY edge-repos /etc/apk/repositories
COPY pkgs /
RUN apk update && \
    apk upgrade && \
    cat /pkgs | xargs apk add
RUN rm /pkgs

RUN   ln -fs /bin/sh /usr/bin/sh && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/imv && \ 
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/flatpak && \ 
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/podman && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/rpm-ostree
     
