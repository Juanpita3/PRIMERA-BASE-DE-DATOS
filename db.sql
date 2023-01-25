CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar(10) NOT NULL,
  "age" int DEFAULT 18
);

CREATE TABLE "courses" (
  "id" serial PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" varchar NOT NULL,
  "level" varchar NOT NULL,
  "teacher" varchar NOT NULL,
  "user_id" uuid
);

CREATE TABLE "courses_video" (
  "id" serial PRIMARY KEY,
  "title" varchar NOT NULL,
  "url" string NOT NULL,
  "course_id" int
);

CREATE TABLE "categories" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL,
  "course_video_id" int
);

ALTER TABLE "courses_video" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "courses_video" ADD FOREIGN KEY ("id") REFERENCES "categories" ("course_video_id");

ALTER TABLE "courses" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");
