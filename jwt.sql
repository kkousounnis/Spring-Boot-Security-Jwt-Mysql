CREATE DATABASE IF NOT EXISTS `jwt`;
USE `jwt`;
CREATE TABLE `users` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
)  ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;

CREATE TABLE `roles` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `role` VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
)  ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;

CREATE TABLE `users_roles` (
    `user_id` INT NOT NULL,
    `role_id` INT NOT NULL,
    PRIMARY KEY (`user_id` , `role_id`),
    KEY `fk_user_roles_role_id_roles_id` (`role_id`),
    CONSTRAINT `fk_user_roles_role_id_roles_id` FOREIGN KEY (`role_id`)
        REFERENCES `roles` (`id`),
    CONSTRAINT `fk_user_roles_user_id_users_id` FOREIGN KEY (`user_id`)
        REFERENCES `users` (`id`)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;

INSERT INTO `jwt`.`users`
(`id`,`email`,`password`,`first_name`,`last_name`)
VALUES(1,'admin@gmail.com','$2a$10$.P3ERs5Kvvtm2r07AtEBtuW1HH2q2UwmgffoXImBbOvIzBeM.F9.W','admin','admin');

INSERT INTO `jwt`.`roles`(`id`,`role`)VALUES(1,'ADMIN');
INSERT INTO `jwt`.`users_roles`(`user_id`,`role_id`)VALUES (1,1);