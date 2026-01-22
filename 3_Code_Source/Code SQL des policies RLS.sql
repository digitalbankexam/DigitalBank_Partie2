
-- =====================================================
-- PHASE 3 — SÉCURITÉ ET CONFORMITÉ
-- Row Level Security (RLS) Policies
-- Projet DigitalBank — Supabase
-- =====================================================

-- ===============================
-- 1. TABLE app_users (rôles)
-- ===============================

ALTER TABLE app_users ENABLE ROW LEVEL SECURITY;
ALTER TABLE app_users FORCE ROW LEVEL SECURITY;

CREATE POLICY app_users_admin_all
ON app_users
FOR ALL
TO authenticated
USING (
  EXISTS (
    SELECT 1 FROM app_users
    WHERE id = auth.uid()
    AND role = 'admin'
  )
)
WITH CHECK (
  EXISTS (
    SELECT 1 FROM app_users
    WHERE id = auth.uid()
    AND role = 'admin'
  )
);

-- ===============================
-- 2. TABLE customers
-- ===============================

ALTER TABLE customers ENABLE ROW LEVEL SECURITY;
ALTER TABLE customers FORCE ROW LEVEL SECURITY;

CREATE POLICY customers_admin_all
ON customers
FOR ALL
TO authenticated
USING (
  EXISTS (
    SELECT 1 FROM app_users
    WHERE id = auth.uid()
    AND role = 'admin'
  )
)
WITH CHECK (
  EXISTS (
    SELECT 1 FROM app_users
    WHERE id = auth.uid()
    AND role = 'admin'
  )
);

CREATE POLICY customers_support_read
ON customers
FOR SELECT
TO authenticated
USING (
  EXISTS (
    SELECT 1 FROM app_users
    WHERE id = auth.uid()
    AND role = 'customer_service'
  )
);

CREATE POLICY customers_customer_read_own
ON customers
FOR SELECT
TO authenticated
USING (
  email = auth.email()
);

-- ===============================
-- 3. TABLE accounts
-- ===============================

ALTER TABLE accounts ENABLE ROW LEVEL SECURITY;
ALTER TABLE accounts FORCE ROW LEVEL SECURITY;

CREATE POLICY accounts_admin_all
ON accounts
FOR ALL
TO authenticated
USING (
  EXISTS (
    SELECT 1 FROM app_users
    WHERE id = auth.uid()
    AND role = 'admin'
  )
)
WITH CHECK (
  EXISTS (
    SELECT 1 FROM app_users
    WHERE id = auth.uid()
    AND role = 'admin'
  )
);

CREATE POLICY accounts_analyst_read
ON accounts
FOR SELECT
TO authenticated
USING (
  EXISTS (
    SELECT 1 FROM app_users
    WHERE id = auth.uid()
    AND role = 'analyst'
  )
);

CREATE POLICY accounts_support_read
ON accounts
FOR SELECT
TO authenticated
USING (
  EXISTS (
    SELECT 1 FROM app_users
    WHERE id = auth.uid()
    AND role = 'customer_service'
  )
);

CREATE POLICY accounts_customer_read_own
ON accounts
FOR SELECT
TO authenticated
USING (
  customer_id = (
    SELECT customer_id
    FROM app_users
    WHERE id = auth.uid()
    AND role = 'customer'
  )
);

-- ===============================
-- 4. TABLE transactions
-- ===============================

ALTER TABLE transactions ENABLE ROW LEVEL SECURITY;
ALTER TABLE transactions FORCE ROW LEVEL SECURITY;

CREATE POLICY transactions_admin_all
ON transactions
FOR ALL
TO authenticated
USING (
  EXISTS (
    SELECT 1 FROM app_users
    WHERE id = auth.uid()
    AND role = 'admin'
  )
)
WITH CHECK (
  EXISTS (
    SELECT 1 FROM app_users
    WHERE id = auth.uid()
    AND role = 'admin'
  )
);

CREATE POLICY transactions_analyst_read
ON transactions
FOR SELECT
TO authenticated
USING (
  EXISTS (
    SELECT 1 FROM app_users
    WHERE id = auth.uid()
    AND role = 'analyst'
  )
);

CREATE POLICY transactions_support_read
ON transactions
FOR SELECT
TO authenticated
USING (
  EXISTS (
    SELECT 1 FROM app_users
    WHERE id = auth.uid()
    AND role = 'customer_service'
  )
);

CREATE POLICY transactions_customer_read_own
ON transactions
FOR SELECT
TO authenticated
USING (
  account_id IN (
    SELECT a.account_id
    FROM accounts a
    JOIN app_users u ON u.customer_id = a.customer_id
    WHERE u.id = auth.uid()
    AND u.role = 'customer'
  )
);

-- ===============================
-- 5. TABLE audit_logs
-- ===============================

ALTER TABLE audit_logs ENABLE ROW LEVEL SECURITY;
ALTER TABLE audit_logs FORCE ROW LEVEL SECURITY;

CREATE POLICY audit_logs_admin_all
ON audit_logs
FOR ALL
TO authenticated
USING (
  EXISTS (
    SELECT 1 FROM app_users
    WHERE id = auth.uid()
    AND role = 'admin'
  )
);

CREATE POLICY audit_logs_analyst_read
ON audit_logs
FOR SELECT
TO authenticated
USING (
  EXISTS (
    SELECT 1 FROM app_users
    WHERE id = auth.uid()
    AND role = 'analyst'
  )
);
