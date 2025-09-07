CREATE TABLE IF NOT EXISTS employees (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS chores (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS duties (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    employee_id INTEGER NOT NULL REFERENCES employees(id),
    chore_id INTEGER NOT NULL REFERENCES chores(id),
    assigned_date DATE NOT NULL,
    "status" TEXT CHECK(
        "status" IN ('pending', 'done', 'done_by_other')
    ) NOT NULL DEFAULT 'pending'
);