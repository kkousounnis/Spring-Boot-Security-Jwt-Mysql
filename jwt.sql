CREATE TABLE `contact_numbers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tel_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `item_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comments` varchar(255) DEFAULT NULL,
  `tracking_number` varchar(255) DEFAULT NULL,
  `billing_address_id` int NOT NULL,
  `item_status_id` int NOT NULL,
  `product_id` int NOT NULL,
  `shipping_address_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqfbgrqhuebq69yxdv0ib7wgb2` (`billing_address_id`),
  KEY `FKp8jtqvp6kmpkndhk6gva30jr1` (`item_status_id`),
  KEY `FKkp5k52qtiygd8jkag4hayd0qg` (`product_id`),
  KEY `FKq2dfcmpxmg3lqseeacd48f12k` (`shipping_address_id`),
  KEY `FK32ql8ubntj5uh44ph9659tiih` (`user_id`),
  CONSTRAINT `FK32ql8ubntj5uh44ph9659tiih` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKkp5k52qtiygd8jkag4hayd0qg` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKp8jtqvp6kmpkndhk6gva30jr1` FOREIGN KEY (`item_status_id`) REFERENCES `item_status` (`id`),
  CONSTRAINT `FKq2dfcmpxmg3lqseeacd48f12k` FOREIGN KEY (`shipping_address_id`) REFERENCES `user_addresses` (`id`),
  CONSTRAINT `FKqfbgrqhuebq69yxdv0ib7wgb2` FOREIGN KEY (`billing_address_id`) REFERENCES `user_addresses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `product_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `user_id` int DEFAULT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqnq71xsohugpqwf3c9gxmsuy` (`product_id`),
  CONSTRAINT `FKqnq71xsohugpqwf3c9gxmsuy` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(14,9) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `product_tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5rk6s19k3risy7q7wqdr41uss` (`product_id`),
  CONSTRAINT `FK5rk6s19k3risy7q7wqdr41uss` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user_addresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `is_billing` bit(1) DEFAULT NULL,
  `is_shipping` bit(1) DEFAULT NULL,
  `postal_code` int NOT NULL,
  `street_name` varchar(255) DEFAULT NULL,
  `street_number` varchar(255) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKn2fisxyyu3l9wlch3ve2nocgp` (`user_id`),
  CONSTRAINT `FKn2fisxyyu3l9wlch3ve2nocgp` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users_contact_numbers` (
  `user_id` int NOT NULL,
  `contact_number_id` int NOT NULL,
  KEY `FKk95sx3vrkkbftpinng1mf2w91` (`contact_number_id`),
  KEY `FKja6y6c78u7xhur6yvoupqfauy` (`user_id`),
  CONSTRAINT `FKja6y6c78u7xhur6yvoupqfauy` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKk95sx3vrkkbftpinng1mf2w91` FOREIGN KEY (`contact_number_id`) REFERENCES `contact_numbers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users_roles` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKj6m8fwv7oqv74fcehir1a9ffy` (`role_id`),
  CONSTRAINT `FK2o0jvgh89lemvvo17cbqvdxaa` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKj6m8fwv7oqv74fcehir1a9ffy` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
