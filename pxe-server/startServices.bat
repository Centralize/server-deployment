@echo off
echo Starting services
docker exec pxetest service apache2 start
docker exec pxetest service tftpd-hpa start
echo Done.