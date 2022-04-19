#!/bin/bash
# Based on https://github.com/mdouchement/docker-zoom-us
set -e
USER_UID=${USER_UID:-1000}
USER_GID=${USER_GID:-1000}

TK_USER=tk
TK_HOME=/home/${TK_USER}

create_user() {
  # create group with USER_GID
  if ! getent group ${TK_USER} >/dev/null; then
    groupadd -f -g ${USER_GID} ${TK_USER} >/dev/null 2>&1
  fi

  # create user with USER_UID
  if ! getent passwd ${TK_USER} >/dev/null; then
    adduser --disabled-login --uid ${USER_UID} --gid ${USER_GID} \
      --gecos 'Tk' ${TK_USER} >/dev/null 2>&1
  fi

  chown ${TK_USER}:${TK_USER} -R ${TK_HOME}
  adduser ${TK_USER} audio
}

launch_tkbash() {
  cd ${TK_HOME}
  exec sudo -HEu ${TK_USER} PULSE_SERVER=/run/pulse/native QT_GRAPHICSSYSTEM="native" /bin/bash
}

case "$1" in
  tkbash)
    create_user
    launch_tkbash $@
    ;;
  *)
    exec $@
    ;;
esac
