docker run --name mysql -d -e MYSQL_ROOT_PASSWORD=root -e MYSQL_ROOT_HOST=% -p 3306:3306 -v $PWD/db:/var/lib/mysql -it mysql:8