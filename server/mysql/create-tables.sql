# Run following.
# mysql -u root < create-tables.sql

USE `series`;

CREATE TABLE `account` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `display_name` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `series` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `series_content` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `series_id` INT UNSIGNED NOT NULL,
  `title` TEXT NOT NULL,
  PRIMARY KEY (`id`),
  KEY `series_content_series_id` (`series_id`),
  CONSTRAINT `series_content_series_id_foreign_KEY` FOREIGN KEY (`series_id`) REFERENCES `series` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `series_uri` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `series_id` INT UNSIGNED NOT NULL,
  `uri` TEXT NOT NULL,
  PRIMARY KEY (`id`),
  KEY `series_uri_series_id` (`series_id`),
  CONSTRAINT `series_uri_series_id_foreign_KEY` FOREIGN KEY (`series_id`) REFERENCES `series` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `following` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `account_id` INT UNSIGNED NOT NULL,
  `series_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `following_account_id` (`account_id`),
  KEY `following_series_id` (`series_id`),
  UNIQUE KEY `unique_following` (`account_id`, `series_id`),
  CONSTRAINT `following_account_id_foreign_KEY` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  CONSTRAINT `following_series_id_foreign_KEY` FOREIGN KEY (`series_id`) REFERENCES `series` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `article` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` TEXT NOT NULL,
  `read` bool,
  `volume` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_volume` (`volume`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `containing` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `series_id` INT UNSIGNED NOT NULL,
  `article_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `containing_series_id` (`series_id`),
  KEY `containing_article_id` (`article_id`),
  UNIQUE KEY `unique_following` (`series_id`, `article_id`),
  CONSTRAINT `containing_series_id_foreign_KEY` FOREIGN KEY (`series_id`) REFERENCES `series` (`id`),
  CONSTRAINT `containing_article_id_foreign_KEY` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
