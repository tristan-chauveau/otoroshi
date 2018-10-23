#!/bin/sh

LOCATION=`pwd`

fmt_cli () {
  cd $LOCATION/clients/cli
  rustup run nightly cargo fmt
}

fmt_demo () {
  cd $LOCATION/demos/loadbalancing
  yarn prettier
  cd $LOCATION/demos/snowmonkey
  yarn prettier
}

fmt_ui () {
  cd $LOCATION/otoroshi/javascript
  yarn prettier
}

fmt_connectors () {
  cd $LOCATION/connectors/clevercloud
  yarn prettier
  cd $LOCATION/connectors/common
  yarn prettier
  cd $LOCATION/connectors/kubernetes
  yarn prettier
  cd $LOCATION/connectors/rancher
  yarn prettier
}

fmt_server () {
  cd $LOCATION/otoroshi
  sbt ';scalafmt;sbt:scalafmt;test:scalafmt'
}

case "${1}" in
  all)
    fmt_cli
    fmt_demo
    fmt_ui
    fmt_connectors
    fmt_server
    ;;
  cli)
    fmt_cli
    ;;
  demo)
    fmt_demo
    ;;
  ui)
    fmt_ui
    ;;
  connectors)
    fmt_connectors
    ;;
  server)
    fmt_server
    ;;
  *)
    fmt_cli
    fmt_demo
    fmt_ui
    fmt_connectors
    fmt_server
esac

exit ${?}