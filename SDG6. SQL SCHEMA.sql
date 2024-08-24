CREATE TABLE WaterTesting (
    test_id INT PRIMARY KEY AUTO_INCREMENT,
    source_id INT,
    test_date DATE NOT NULL,
    contaminants_found TEXT,
    safety_level VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (source_id) REFERENCES WaterSource(source_id)
);


