USE pump_portal_1;

CREATE TABLE creators (
    creator_wallet VARCHAR(100) PRIMARY KEY,

    first_seen_at DATETIME NOT NULL,
    last_seen_at DATETIME NOT NULL,

    total_launches INT DEFAULT 0,
    total_migrations INT DEFAULT 0,

    notes VARCHAR(255),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    INDEX idx_creators_total_launches (total_launches),
    INDEX idx_creators_total_migrations (total_migrations)
);