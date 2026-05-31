-- Ensure the DB exists with correct owner.
-- IMPORTANT: do not reference the built-in "postgres" role.

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_database WHERE datname = 'musicboxedDB'
  ) THEN
    -- This statement is executed as the connection user that the
    -- Postgres image uses during init (typically the configured POSTGRES_USER).
    EXECUTE 'CREATE DATABASE musicboxedDB OWNER admin';
  END IF;
END
$$;

