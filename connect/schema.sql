CREATE TABLE users(
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT,
    "username" TEXT,
    "password" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE school(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "foundation_year" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE companies(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    PRIMARY KEY("id")
);


CREATE TABLE connection_company(
    "company_id" INTEGER,
    "start_date" DATE NOT NULL,
    "end_date" DATE,
    "title" TEXT NOT NULL,
    FOREIGN KEY("company_id") REFERENCES "companies"("id")
);

CREATE TABLE connection_school(
    "school_id" INTEGER,
    "start_date" DATE NOT NULL,
    "end_date" DATE,
    "degree_type" TEXT NOT NULL,
    FOREIGN KEY("school_id") REFERENCES "school"("id")
);

CREATE TABLE connection_people(
    "id" INTEGER,
    "user_id1" INTEGER NOT NULL UNIQUE,
    "user_id2" INTEGER NOT NULL UNIQUE,
    FOREIGN KEY("user_id1") REFERENCES "users"("id"),
    FOREIGN KEY("user_id2") REFERENCES "users"("id"),
    PRIMARY KEY("id")
);
