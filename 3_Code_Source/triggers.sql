
-- =====================================================
-- PHASE 3 — AUDIT ET TRAÇABILITÉ
-- Audit Logs & Triggers
-- Projet DigitalBank — Supabase / PostgreSQL
-- =====================================================

-- ===============================
-- 1. TABLE audit_logs
-- ===============================

CREATE TABLE IF NOT EXISTS audit_logs (
  log_id SERIAL PRIMARY KEY,
  user_id UUID,
  action VARCHAR(100),
  table_name VARCHAR(50),
  record_id INT,
  timestamp TIMESTAMP DEFAULT NOW(),
  ip_address VARCHAR(45)
);

-- ===============================
-- 2. GENERIC AUDIT FUNCTION
-- ===============================

CREATE OR REPLACE FUNCTION log_audit_action()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO audit_logs (
    user_id,
    action,
    table_name,
    record_id,
    ip_address
  )
  VALUES (
    auth.uid(),
    TG_OP || '_' || TG_TABLE_NAME,
    TG_TABLE_NAME,
    COALESCE(OLD.account_id, OLD.customer_id),
    inet_client_addr()
  );

  RETURN OLD;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ===============================
-- 3. TRIGGERS ON accounts
-- ===============================

DROP TRIGGER IF EXISTS trg_accounts_update ON accounts;
DROP TRIGGER IF EXISTS trg_accounts_delete ON accounts;

CREATE TRIGGER trg_accounts_update
AFTER UPDATE ON accounts
FOR EACH ROW
EXECUTE FUNCTION log_audit_action();

CREATE TRIGGER trg_accounts_delete
AFTER DELETE ON accounts
FOR EACH ROW
EXECUTE FUNCTION log_audit_action();

-- ===============================
-- 4. LOGGING CUSTOMER DATA ACCESS
-- (SELECT logging via function)
-- ===============================

CREATE OR REPLACE FUNCTION view_customers_with_audit()
RETURNS SETOF customers AS $$
BEGIN
  INSERT INTO audit_logs (
    user_id,
    action,
    table_name,
    record_id,
    ip_address
  )
  SELECT
    auth.uid(),
    'VIEW_CUSTOMER',
    'customers',
    customer_id,
    inet_client_addr()
  FROM customers;

  RETURN QUERY
  SELECT * FROM customers;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Usage example:
-- SELECT * FROM view_customers_with_audit();
