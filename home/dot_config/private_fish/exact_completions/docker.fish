# TODO make this fall back to docker's official completions
if [ -f /etc/containers/nodocker -o -f /usr/lib/tmpfiles.d/podman-docker.conf ]
    complete -c docker -w podman
else if command -qs carapace
    carapace docker fish | source
end
