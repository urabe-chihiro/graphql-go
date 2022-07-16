CREATE TABLE "memos" (
  "id" bigserial PRIMARY KEY,
  "title" varchar,
  "context" varchar NOT NULL,
  "created_at" timestamptz DEFAULT (now()),
  "tag_id" bigint
);

CREATE TABLE "tags" (
  "id" bigserial PRIMARY KEY,
  "name" varchar NOT NULL,
  "color" varchar
);

ALTER TABLE "memos" ADD FOREIGN KEY ("tag_id") REFERENCES "tags" ("id");
