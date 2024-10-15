CREATE TABLE passengers(
    "id" INTEGER,
    "First name" TEXT NOT NULL,
    "Last name" TEXT,
    "age" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE Check_ins(
    "flight_id" INTEGER,
    "passenger_id" INTEGER,
    "checkin_datetime" DATETIME NOT NULL,
    FOREIGN KEY("flight_id") REFERENCES "flights"("id"),
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id")
);

CREATE TABLE flights(
    "id" INTEGER,
    "flight_number" INTEGER NOT NULL,
    "airline" TEXT NOT NULL,
    "departing_airport" TEXT NOT NULL,
    "arrival_airport" TEXT NOT NULL,
    "departure_datetime" DATETIME NOT NULL,
    "arrival_datetime" DATETIME NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE airlines(
    "id" INTEGER,
    "name" TEXT NULL,
    "concourses" TEXT CHECK ("concourses" IN ('A','B','C','D','E','T'))
    PRIMARY KEY("id")
);

