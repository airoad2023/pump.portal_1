USE pump_portal_1;

CREATE TABLE token_keywords (
    keyword_id BIGINT AUTO_INCREMENT PRIMARY KEY,

    mint VARCHAR(100) NOT NULL,

    keyword VARCHAR(100) NOT NULL,

    category ENUM(
        'meme',
        'ai',
        'animal',
        'celebrity',
        'political',
        'crypto',
        'gaming',
        'internet_trend',
        'adult',
        'other'
    ) DEFAULT 'other',

    source_field ENUM('name', 'symbol', 'both') DEFAULT 'name',

    detected_at DATETIME NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (mint) REFERENCES launches(mint),

    INDEX idx_token_keywords_mint (mint),
    INDEX idx_token_keywords_keyword (keyword),
    INDEX idx_token_keywords_category (category),

    UNIQUE KEY unique_token_keyword (mint, keyword, category)
);