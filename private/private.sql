CREATE TABLE "cipher"(
    "sentence_id" INTEGER,
    "first_letter" INTEGER,
    "last_letter" INTEGER
);

INSERT INTO "cipher" ("sentence_id", "first_letter", "last_letter")
VALUES
(14, 98, 4),
(114, 3, 5),
(618, 72, 9),
(630, 7, 3),
(932, 12, 5),
(2230, 50, 7),
(2346, 44, 10),
(3041, 14, 5);

CREATE VIEW "message" AS
SELECT substr("sentence", "first_letter", "length") AS "phrase" FROM "cipher"
JOIN "sentences" ON "sentences"."id" = "cipher"."sentence_id";

