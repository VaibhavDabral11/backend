/*
  Warnings:

  - You are about to drop the column `Address` on the `gymbackend_data` table. All the data in the column will be lost.
  - You are about to drop the column `Age` on the `gymbackend_data` table. All the data in the column will be lost.
  - You are about to drop the column `Gender` on the `gymbackend_data` table. All the data in the column will be lost.
  - You are about to drop the column `Name` on the `gymbackend_data` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[name]` on the table `gymbackend_data` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `address` to the `gymbackend_data` table without a default value. This is not possible if the table is not empty.
  - Added the required column `age` to the `gymbackend_data` table without a default value. This is not possible if the table is not empty.
  - Added the required column `gender` to the `gymbackend_data` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `gymbackend_data` table without a default value. This is not possible if the table is not empty.
  - Made the column `email` on table `gymbackend_data` required. This step will fail if there are existing NULL values in that column.

*/
-- DropIndex
DROP INDEX `gymbackend_data_Name_key` ON `gymbackend_data`;

-- AlterTable
ALTER TABLE `gymbackend_data` DROP COLUMN `Address`,
    DROP COLUMN `Age`,
    DROP COLUMN `Gender`,
    DROP COLUMN `Name`,
    ADD COLUMN `address` VARCHAR(255) NOT NULL,
    ADD COLUMN `age` INTEGER NOT NULL,
    ADD COLUMN `gender` VARCHAR(255) NOT NULL,
    ADD COLUMN `name` VARCHAR(255) NOT NULL,
    MODIFY `email` VARCHAR(191) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `gymbackend_data_name_key` ON `gymbackend_data`(`name`);
