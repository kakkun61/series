# Run following.
# mysql -u root -e "SET @password = '${SERIES_MYSQL_PASSWORD}'; SOURCE create-user.sql;"

SET @create_user = CONCAT("CREATE USER `series`@`localhost` IDENTIFIED BY '", @password, "'");
PREPARE stmt FROM @create_user; EXECUTE stmt; DEALLOCATE PREPARE stmt;
grant all on `series`.* to 'series'@'localhost';
