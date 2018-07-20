-- CREATE USER 'cs6440'@'localhost' IDENTIFIED BY 'cs6440';
-- GRANT ALL PRIVILEGES ON *.* TO 'cs6440'@'localhost';

use cs6440;

DROP TABLE IF EXISTS User;
CREATE TABLE `User` (
  fhir_id VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  birthday VARCHAR(50) NOT NULL,
  password VARCHAR(50) NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  middle_name VARCHAR(50),
  last_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (email),
  UNIQUE KEY (fhir_id)
);

DROP TABLE IF EXISTS Search_History;
CREATE TABLE Search_History (
  search_id INT(16) unsigned NOT NULL AUTO_INCREMENT,
  searched_medication VARCHAR(200) NOT NULL,
  date VARCHAR(50) NOT NULL,
  best_price Double(16,2) NOT NULL,
  store VARCHAR(50) NOT NULL,
  -- fhir_id VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  PRIMARY KEY (search_id)
);


DROP TABLE IF EXISTS Drug;
CREATE TABLE Drug (
  drug_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (drug_name)
);

DROP TABLE IF EXISTS Drug_Form;
CREATE TABLE Drug_Form (
  form_type VARCHAR(50) NOT NULL,
  drug_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (form_type, drug_name)
);

DROP TABLE IF EXISTS Form;
CREATE TABLE Form (
  form_type VARCHAR(50) NOT NULL,
  PRIMARY KEY (form_type)
);

DROP TABLE IF EXISTS Dosage;
CREATE TABLE Dosage (
  dosage_value VARCHAR(50) NOT NULL,
  PRIMARY KEY (dosage_value)
);

DROP TABLE IF EXISTS Drug_Form_Dosage;
CREATE TABLE Drug_Form_Dosage (
  drug_name VARCHAR(50) NOT NULL,
  form_type VARCHAR(50) NOT NULL,
  dosage_value VARCHAR(50) NOT NULL,
  PRIMARY KEY (drug_name, form_type, dosage_value)
);

DROP TABLE IF EXISTS Quantity;
CREATE TABLE Quantity (
  quantity_value VARCHAR(50) NOT NULL,
  PRIMARY KEY (quantity_value)
);

DROP TABLE IF EXISTS Drug_Form_Quantity;
CREATE TABLE Drug_Form_Quantity (
  drug_name VARCHAR(50) NOT NULL,
  form_type VARCHAR(50) NOT NULL,
  quantity_value VARCHAR(50) NOT NULL,
  PRIMARY KEY (drug_name, form_type, quantity_value)
);

-- drop price table
DROP TABLE IF EXISTS Price_Association;
DROP TABLE IF EXISTS Price;

CREATE TABLE Price (
  price_id INT(16) unsigned NOT NULL AUTO_INCREMENT,
  price_value Double(16,2) NOT NULL,
  store VARCHAR(50) NOT NULL,
  is_coupon_price boolean NOT NULL,
  PRIMARY KEY (price_id)
);

DROP TABLE IF EXISTS Price_Association;
CREATE TABLE Price_Association (
  association_id INT(16) unsigned NOT NULL AUTO_INCREMENT,
  price_id INT(16) unsigned,
  drug_name VARCHAR(50) NOT NULL,
  form_type VARCHAR(50) NOT NULL,
  dosage_value VARCHAR(50) NOT NULL,
  quantity_value VARCHAR(50) NOT NULL,
  PRIMARY KEY (association_id)
);

-- Constraints   Foreign Keys: FK_ChildTable_childColumn_ParentTable_parentColumn

-- ALTER TABLE Search_History
--   ADD CONSTRAINT fk_Search_History_fhir_id_fk_User_fhir_id FOREIGN KEY (fhir_id) REFERENCES `User` (fhir_id);

ALTER TABLE Search_History
  ADD CONSTRAINT fk_Search_History_email_fk_User_email FOREIGN KEY (email) REFERENCES `User` (email);

ALTER TABLE Drug_Form
  ADD CONSTRAINT fk_Drug_Form_drug_name FOREIGN KEY (drug_name) REFERENCES Drug (drug_name),
  ADD CONSTRAINT fk_Drug_Form_form_type FOREIGN KEY (form_type) REFERENCES Form (form_type);

ALTER TABLE Drug_Form_Dosage
  ADD CONSTRAINT fk_Form_Dosage_dosage_value FOREIGN KEY (dosage_value) REFERENCES Dosage (dosage_value),
  ADD CONSTRAINT fk_Form_Dosage_drug_name FOREIGN KEY (drug_name) REFERENCES Drug (drug_name),
  ADD CONSTRAINT fk_Form_Dosage_form_type FOREIGN KEY (form_type) REFERENCES Form (form_type);

ALTER TABLE Drug_Form_Quantity
  ADD CONSTRAINT fk_Form_Quantity_quantity_value FOREIGN KEY (quantity_value) REFERENCES Quantity (quantity_value),
  ADD CONSTRAINT fk_Form_Quantity_form_type FOREIGN KEY (form_type) REFERENCES Form (form_type);

ALTER TABLE Price_Association
  ADD CONSTRAINT fk_Price_Association_price_id FOREIGN KEY (price_id) REFERENCES Price (price_id),
  ADD CONSTRAINT fk_Price_Association_drug_name FOREIGN KEY (drug_name) REFERENCES Drug (drug_name),
  ADD CONSTRAINT fk_Price_Association_form_type FOREIGN KEY (form_type) REFERENCES Form (form_type),
  ADD CONSTRAINT fk_Price_Association_quantity_value FOREIGN KEY (quantity_value) REFERENCES Quantity (quantity_value),
  ADD CONSTRAINT fk_Price_Association_dosage_value FOREIGN KEY (dosage_value) REFERENCES Dosage (dosage_value);
