/*
  Warnings:

  - You are about to drop the column `About_more` on the `gymbackend_data` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `gymbackend_data` DROP COLUMN `About_more`,
    ADD COLUMN `email` VARCHAR(191) NULL;
