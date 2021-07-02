# Server Deployment using docker.io

- PXE-Server
	Deploys a tftp and apache2 webserver.

	By default port 69 and port 80 are exposed.

	*Deploy using:* docker run -td --name <servername> -p 80:80 -p 69:69 -v /srv/tftp:/srv/tftp openlabdk/pxe-server:latest
