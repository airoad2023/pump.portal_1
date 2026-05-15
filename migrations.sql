USE pump_portal_1;


CREATE TABLE migrations (
    migration_id BIGINT AUTO_INCREMENT PRIMARY KEY,

    mint VARCHAR(100) NOT NULL,

    migration_time DATETIME NOT NULL,
    received_at DATETIME NOT NULL,

    raw_event_id BIGINT,

    minutes_from_launch INT NULL,

    migration_status ENUM('confirmed', 'duplicate', 'unknown') DEFAULT 'confirmed',

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (mint) REFERENCES launches(mint),
    FOREIGN KEY (raw_event_id) REFERENCES raw_events(raw_event_id),

    UNIQUE KEY unique_migration_mint (mint),

    INDEX idx_migrations_mint (mint),
    INDEX idx_migrations_migration_time (migration_time),
    INDEX idx_migrations_minutes_from_launch (minutes_from_launch)
);