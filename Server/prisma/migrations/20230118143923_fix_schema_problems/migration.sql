/*
  Warnings:

  - You are about to drop the column `date` on the `day_habits` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[date]` on the table `days` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "day_habits" DROP CONSTRAINT "day_habits_day_id_fkey";

-- DropForeignKey
ALTER TABLE "day_habits" DROP CONSTRAINT "day_habits_habit_id_fkey";

-- DropForeignKey
ALTER TABLE "habit_week_days" DROP CONSTRAINT "habit_week_days_habit_id_fkey";

-- DropIndex
DROP INDEX "days_date_idx";

-- AlterTable
ALTER TABLE "day_habits" DROP COLUMN "date";

-- CreateIndex
CREATE UNIQUE INDEX "days_date_key" ON "days"("date");

-- AddForeignKey
ALTER TABLE "habit_week_days" ADD CONSTRAINT "habit_week_days_habit_id_fkey" FOREIGN KEY ("habit_id") REFERENCES "habits"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "day_habits" ADD CONSTRAINT "day_habits_day_id_fkey" FOREIGN KEY ("day_id") REFERENCES "days"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "day_habits" ADD CONSTRAINT "day_habits_habit_id_fkey" FOREIGN KEY ("habit_id") REFERENCES "habits"("id") ON DELETE CASCADE ON UPDATE CASCADE;
