docker rm ubuntu_dispatcher
docker run \
--name ubuntu_dispatcher -d \
-p 80:80 \
-v /$(pwd)/shared/vhosts:/etc/apache2/sites-enabled \
-v /$(pwd)/shared/cache:/var/www/cache \
-v /$(pwd)/shared/conf:/etc/apache2/conf \
ubuntu_dispatcher:1.0
