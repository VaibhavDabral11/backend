-- CreateTable
CREATE TABLE `gymbackend_data` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(255) NOT NULL,
    `Age` INTEGER NULL,
    `Gender` VARCHAR(255) NOT NULL,
    `Address` VARCHAR(255) NOT NULL,
    `About_more` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `gymbackend_data_Name_key`(`Name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
