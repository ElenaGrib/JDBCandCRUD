DROP SCHEMA IF EXISTS `clinics`;
CREATE SCHEMA IF NOT EXISTS `clinics`
    CHARACTER SET `utf8`;

USE `clinics`;

DROP TABLE IF EXISTS `clinic`;
CREATE TABLE `clinic`
(
    `id`       BIGINT       NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name`     VARCHAR(255) NOT NULL,
    `phone`    VARCHAR(255) NOT NULL,
    `email`    VARCHAR(255) NOT NULL,
    `address`  VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor`
(
    `id`           BIGINT       NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `fk_clinic_id` BIGINT       NOT NULL,
    `first_name`   VARCHAR(255) NOT NULL,
    `last_name`    VARCHAR(255) NOT NULL,
    `birthday`     DATE         NOT NULL,
    `gender`       VARCHAR(255) NOT NULL,
    `email`        VARCHAR(255),
    `phone`        VARCHAR(255),
    `position`     VARCHAR(255) NOT NULL,
    `address`      VARCHAR(255),
    CONSTRAINT `fk_doctor_to_clinic` FOREIGN KEY (`fk_clinic_id`) REFERENCES `clinic` (`id`)
);

DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient`
(
    `id`         BIGINT       NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `clinic_id`  BIGINT       NOT NULL,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name`  VARCHAR(255) NOT NULL,
    `birthday`   DATE         NOT NULL,
    `gender`     VARCHAR(255) NOT NULL,
    `email`      VARCHAR(255),
    `phone`      VARCHAR(255) NOT NULL,
    `address`      VARCHAR(255)
);

DROP TABLE IF EXISTS `diagnosis`;
CREATE TABLE `diagnosis`
(
    `id`         BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `patient_id` BIGINT NOT NULL,
    `date`       DATE   NOT NULL,
    `analyzes`   VARCHAR(255),
    `diagnosis`  VARCHAR(255),
    `recipe`     VARCHAR(255),
    CONSTRAINT `fk_diagnosis_to_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`)
);

DROP TABLE IF EXISTS `clinic_patient`;
CREATE TABLE `clinic_patient`
(
    `id`            BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `fk_clinic_id`  BIGINT NOT NULL,
    `fk_patient_id` BIGINT NOT NULL,
    CONSTRAINT `fk_clinic_patient_to_clinic` FOREIGN KEY (`fk_clinic_id`) REFERENCES `clinic` (`id`),
    CONSTRAINT `fk_clinic_patient_to_patient` FOREIGN KEY (`fk_patient_id`) REFERENCES `patient` (`id`)
);

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`
(
    `id`    BIGINT       NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `value` VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`
(
    `id`         BIGINT       NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `login`      VARCHAR(255) NOT NULL,
    `email`      VARCHAR(255) NOT NULL,
    `password`   VARCHAR(255) NOT NULL,
    `status`     VARCHAR(255) NOT NULL,
    `fk_role_id` BIGINT       NOT NULL,
    CONSTRAINT `fk_role_id_to_role` FOREIGN KEY (`fk_role_id`) REFERENCES `role` (`id`)
);

-- test data --
INSERT INTO clinic (id, name, phone, email, address)
VALUES (1, 'МедиЛюкс Минск', '+375-29-123-45-67', 'mlminsk@medilus.by', 'Беларусь, Минск, Притыцкого, 8');
INSERT INTO clinic (id, name, phone, email,address)
VALUES (2, 'МедиЛюкс Гомель', '+375-29-987-65-43', 'mlgomel@medilus.by', 'Беларусь, Гомель, Главная, 126');
INSERT INTO clinic (id, name, phone, email, address)
VALUES (3, 'МедиЛюкс Брест', '+375-29-456-91-45', 'mlbrest@medilus.by', 'Беларусь, Брест, Гоголя, 94');