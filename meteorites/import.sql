CREATE TABLE meteorites(
    "id" INTEGER PRIMARY KEY,
    "name" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT CHECK("discovery" IN ('Fell', 'Found')),
    "year" REAL,
    "lat" REAL,
    "long" REAL
);

.mode csv
.import meteorites.csv meteorites_temp

UPDATE "meteorites_temp" SET "mass" = NULLIF("mass", '') ;
UPDATE "meteorites_temp" SET "year" = NULLIF("year", '') ;
UPDATE "meteorites_temp" SET "lat" = NULLIF("lat", '') ;
UPDATE "meteorites_temp" SET "long" = NULLIF("long", '') ;

UPDATE "meteorites_temp" SET "mass" = ROUND("mass", 2) WHERE "mass" IS NOT NULL;
UPDATE "meteorites_temp" SET "lat" = ROUND("lat", 2) WHERE "lat" IS NOT NULL;
UPDATE "meteorites_temp" SET "long" = ROUND("long", 2) WHERE "long" IS NOT NULL;

DELETE FROM "meteorites_temp" WHERE "nametype" = 'Relict';



INSERT INTO "meteorites"("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", "mass", "discovery", "year", "lat", "long" FROM "meteorites_temp"
WHERE "nametype" <> 'Relict'
ORDER BY "year" ASC, "name" ASC;

DROP TABLE "meteorites_temp";
