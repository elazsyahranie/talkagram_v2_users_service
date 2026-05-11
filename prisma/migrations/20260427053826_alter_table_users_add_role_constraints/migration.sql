ALTER TABLE "Users"
ADD CONSTRAINT "role_check"
CHECK ("role" IN ('User', 'Super Admin'));