USE pump_portal_1;

CREATE TABLE raw_events (
    raw_event_id BIGINT AUTO_INCREMENT PRIMARY KEY,

    event_type ENUM('launch', 'migration', 'unknown') NOT NULL,

    mint VARCHAR(100),

    received_at DATETIME NOT NULL,

    raw_json JSON NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    INDEX idx_raw_events_mint (mint),
    INDEX idx_raw_events_event_type (event_type),
    INDEX idx_raw_events_received_at (received_at)
);