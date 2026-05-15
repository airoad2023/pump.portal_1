USE pump_portal_1;

CREATE TABLE launches (
    mint VARCHAR(100) PRIMARY KEY,

    name VARCHAR(255),
    symbol VARCHAR(100),

    creator_wallet VARCHAR(100),

    launch_time DATETIME NOT NULL,
    received_at DATETIME NOT NULL,

    raw_event_id BIGINT,

    name_lower VARCHAR(255),
    symbol_lower VARCHAR(100),

    launch_date DATE,
    launch_hour TINYINT,
    launch_day_of_week TINYINT,

    is_migrated BOOLEAN DEFAULT FALSE,
    migration_time DATETIME NULL,
    minutes_to_migration INT NULL,

    duplicate_name_count_at_launch INT DEFAULT 0,
    duplicate_symbol_count_at_launch INT DEFAULT 0,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (creator_wallet) REFERENCES creators(creator_wallet),
    FOREIGN KEY (raw_event_id) REFERENCES raw_events(raw_event_id),

    INDEX idx_launches_creator_wallet (creator_wallet),
    INDEX idx_launches_launch_time (launch_time),
    INDEX idx_launches_name (name),
    INDEX idx_launches_symbol (symbol),
    INDEX idx_launches_is_migrated (is_migrated),
    INDEX idx_launches_launch_hour (launch_hour),
    INDEX idx_launches_launch_day_of_week (launch_day_of_week)
);