docker-perforce
===============
[![License: MIT](http://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](LICENSE)

This is a collection of docker images to run products provided by [Perforce](http://www.perforce.com/).

Usage
-----

    docker run -e SERVER_NAME=server-name -e P4PASSWD=<password> noonien/perforce-server

Details
-------
The following environment variables are available:

  - SERVER_NAME - Server name. Required.
  - P4PORT - Address on which to listen. Described [here](http://www.perforce.com/perforce/doc.current/manuals/cmdref/P4PORT.html). Defaults to ssl:1666.
  - P4USER - Superuser username. Only created when creating a new server. Defaults to perforce.
  - P4PASSWD - Superuser password. Required when creating a new server.

The path `/opt/perforce/server` is mounted as a volume because that's where the server roots are stored.

Contributing
------------
Contributing is always welcome and appreciated! Pull requests and issues will
be processed as fast as possible!
