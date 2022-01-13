-- CreateEnum
CREATE TYPE "Gender" AS ENUM ('Male', 'Female', 'NonBinary');

-- CreateEnum
CREATE TYPE "Role" AS ENUM ('USER', 'ADMIN', 'SUPERADMIN');

-- CreateTable
CREATE TABLE "User" (
    "id" UUID NOT NULL,
    "username" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "first_name" VARCHAR(255) NOT NULL,
    "last_name" VARCHAR(255) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "phone" VARCHAR(255) NOT NULL,
    "phone_code" VARCHAR(50),
    "last_login" DATE,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "role" "Role" NOT NULL DEFAULT E'USER',

    CONSTRAINT "user_pk" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User_address" (
    "id" UUID NOT NULL,
    "user_id" UUID NOT NULL,
    "address_line1" VARCHAR(255) NOT NULL,
    "address_line2" VARCHAR(255) NOT NULL,
    "city" VARCHAR(255) NOT NULL,
    "postal_code" VARCHAR(255) NOT NULL,
    "country" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "gender" "Gender" NOT NULL,

    CONSTRAINT "user_address_pk" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_username_uindex" ON "User"("username");

-- CreateIndex
CREATE UNIQUE INDEX "user_email_uindex" ON "User"("email");

-- AddForeignKey
ALTER TABLE "User_address" ADD CONSTRAINT "user_id_fk" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
