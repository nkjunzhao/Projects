use cs6440;

-- Insert into User
INSERT INTO User (fhir_id, email, password, birthday, first_name, middle_name, last_name) VALUES('2005252', 'test1@gatech.edu', '123', '1950-07-30', 'Archie', '', 'Wang');
INSERT INTO User (fhir_id, email, password, birthday, first_name, middle_name, last_name) VALUES('2032860', 'test2@gatech.edu', '123', '1893-07-15', 'Brandon', '', 'Ferguson');
INSERT INTO User (fhir_id, email, password, birthday, first_name, middle_name, last_name) VALUES('2032861', 'test3@gatech.edu', '123', '1897-10-15', 'John', '', 'Doe');

-- Insert into Search_History
INSERT INTO Search_History (searched_medication, date, best_price, store, email) VALUES('1 tube (28.4g) 1% of Hydrocortisone Cream', '2018-Mar-04', 4, 'Walmart' ,'test1@gatech.edu');
INSERT INTO Search_History (searched_medication, date, best_price, store, email) VALUES('40mg 30 tablet of Lipitor', '2018-Mar-04', 24.75, 'CVS' ,'test1@gatech.edu');

-- Insert into Drug
INSERT INTO Drug (drug_name) VALUES('zolpidem');
INSERT INTO Drug (drug_name) VALUES('chlortalidone');
INSERT INTO Drug (drug_name) VALUES('terbinafine');
INSERT INTO Drug (drug_name) VALUES('isosorbide mononitrate');
INSERT INTO Drug (drug_name) VALUES('gabapentin');
INSERT INTO Drug (drug_name) VALUES('lisinopril');
INSERT INTO Drug (drug_name) VALUES('citalopram');
INSERT INTO Drug (drug_name) VALUES('losartan/hydrochlorothiazide');
INSERT INTO Drug (drug_name) VALUES('buspirone');
INSERT INTO Drug (drug_name) VALUES('insulin glargine');
INSERT INTO Drug (drug_name) VALUES('naproxen');
INSERT INTO Drug (drug_name) VALUES('metformin');
INSERT INTO Drug (drug_name) VALUES('prednisone');
INSERT INTO Drug (drug_name) VALUES('omeprazole');
INSERT INTO Drug (drug_name) VALUES('salbutamol');
INSERT INTO Drug (drug_name) VALUES('carvedilol');
INSERT INTO Drug (drug_name) VALUES('simvastatin');
INSERT INTO Drug (drug_name) VALUES('beclomethasone dipropionate');
INSERT INTO Drug (drug_name) VALUES('aspirin');

INSERT INTO Drug (drug_name) VALUES('Codeine Phosphate');
INSERT INTO Drug (drug_name) VALUES('Lithium Bromide');
INSERT INTO Drug (drug_name) VALUES('Trichothecenes');
INSERT INTO Drug (drug_name) VALUES('Sodium Iodipamide');

-- Insert into Form
INSERT INTO Form (form_type) VALUES("sublingual tablet");
INSERT INTO Form (form_type) VALUES("tablet");
INSERT INTO Form (form_type) VALUES("vial");
INSERT INTO Form (form_type) VALUES("inhaler");
INSERT INTO Form (form_type) VALUES("aerosol");
INSERT INTO Form (form_type) VALUES("chewable tablet");
INSERT INTO Form (form_type) VALUES("capsules");
INSERT INTO Form (form_type) VALUES("dropper");




-- Insert into Drug_Form
INSERT INTO Drug_Form (form_type, drug_name) VALUES("sublingual tablet", "zolpidem");
INSERT INTO Drug_Form (form_type, drug_name) VALUES("tablet", "zolpidem");
INSERT INTO Drug_Form (form_type, drug_name) VALUES("tablet", "chlortalidone");
INSERT INTO Drug_Form (form_type, drug_name) VALUES("tablet", "terbinafine");
INSERT INTO Drug_Form (form_type, drug_name) VALUES("tablet", "isosorbide mononitrate");
INSERT INTO Drug_Form (form_type, drug_name) VALUES("tablet", "gabapentin");
INSERT INTO Drug_Form (form_type, drug_name) VALUES("tablet", "lisinopril");
INSERT INTO Drug_Form (form_type, drug_name) VALUES("tablet", "citalopram");
INSERT INTO Drug_Form (form_type, drug_name) VALUES("tablet", "losartan/hydrochlorothiazide");
INSERT INTO Drug_Form (form_type, drug_name) VALUES("tablet", "buspirone");
INSERT INTO Drug_Form (form_type, drug_name) VALUES("tablet", "insulin glargine");
INSERT INTO Drug_Form (form_type, drug_name) VALUES("tablet", "naproxen");
INSERT INTO Drug_Form (form_type, drug_name) VALUES("tablet", "metformin");
INSERT INTO Drug_Form (form_type, drug_name) VALUES("tablet", "prednisone");
INSERT INTO Drug_Form (form_type, drug_name) VALUES("tablet", "omeprazole");
INSERT INTO Drug_Form (form_type, drug_name) VALUES("inhaler", "salbutamol");
INSERT INTO Drug_Form (form_type, drug_name) VALUES("tablet", "carvedilol");
INSERT INTO Drug_Form (form_type, drug_name) VALUES("tablet", "simvastatin");
INSERT INTO Drug_Form (form_type, drug_name) VALUES("aerosol", "beclomethasone dipropionate");
INSERT INTO Drug_Form (form_type, drug_name) VALUES("tablet", "aspirin");
INSERT INTO Drug_Form (form_type, drug_name) VALUES("chewable tablet", "aspirin");

INSERT INTO Drug_Form (form_type, drug_name) VALUES("tablet", "Codeine Phosphate");
INSERT INTO Drug_Form (form_type, drug_name) VALUES("capsules", "Lithium Bromide");
INSERT INTO Drug_Form (form_type, drug_name) VALUES("tablet", "Trichothecenes");
INSERT INTO Drug_Form (form_type, drug_name) VALUES("dropper", "Sodium Iodipamide");




-- Insert into Dosage
INSERT INTO Dosage (dosage_value) VALUES("1.75mg");
INSERT INTO Dosage (dosage_value) VALUES("5mg");
INSERT INTO Dosage (dosage_value) VALUES("10mg");
INSERT INTO Dosage (dosage_value) VALUES("15mg");
INSERT INTO Dosage (dosage_value) VALUES("20mg");
INSERT INTO Dosage (dosage_value) VALUES("25mg");
INSERT INTO Dosage (dosage_value) VALUES("40mg");
INSERT INTO Dosage (dosage_value) VALUES("81mg");
INSERT INTO Dosage (dosage_value) VALUES("100mg");
INSERT INTO Dosage (dosage_value) VALUES("250mg");
INSERT INTO Dosage (dosage_value) VALUES("325mg");
INSERT INTO Dosage (dosage_value) VALUES("500mg");
INSERT INTO Dosage (dosage_value) VALUES("600mg");
INSERT INTO Dosage (dosage_value) VALUES("1000mg");
INSERT INTO Dosage (dosage_value) VALUES("100mg/12.5mg");
INSERT INTO Dosage (dosage_value) VALUES("10ml of 100units/ml");
INSERT INTO Dosage (dosage_value) VALUES("40mcg/inh");

INSERT INTO Dosage (dosage_value) VALUES("60mg");
INSERT INTO Dosage (dosage_value) VALUES("300mg");
INSERT INTO Dosage (dosage_value) VALUES("30ml");


-- Insert into Drug_Form_Dosage
INSERT INTO Drug_Form_Dosage (drug_name, form_type, dosage_value) VALUES("zolpidem", "sublingual tablet", "1.75mg");
INSERT INTO Drug_Form_Dosage (drug_name, form_type, dosage_value) VALUES("zolpidem", "sublingual tablet", "5mg");
INSERT INTO Drug_Form_Dosage (drug_name, form_type, dosage_value) VALUES("zolpidem", "tablet", "5mg");
INSERT INTO Drug_Form_Dosage (drug_name, form_type, dosage_value) VALUES("zolpidem", "tablet", "10mg");
INSERT INTO Drug_Form_Dosage (drug_name, form_type, dosage_value) VALUES("chlortalidone", "tablet", "15mg");
INSERT INTO Drug_Form_Dosage (drug_name, form_type, dosage_value) VALUES("terbinafine", "tablet", "250mg");
INSERT INTO Drug_Form_Dosage (drug_name, form_type, dosage_value) VALUES("isosorbide mononitrate", "tablet", "20mg");
INSERT INTO Drug_Form_Dosage (drug_name, form_type, dosage_value) VALUES("gabapentin", "tablet", "600mg");
INSERT INTO Drug_Form_Dosage (drug_name, form_type, dosage_value) VALUES("lisinopril", "tablet", "20mg");
INSERT INTO Drug_Form_Dosage (drug_name, form_type, dosage_value) VALUES("citalopram", "tablet", "20mg");
INSERT INTO Drug_Form_Dosage (drug_name, form_type, dosage_value) VALUES("citalopram", "tablet", "100mg/12.5mg");
INSERT INTO Drug_Form_Dosage (drug_name, form_type, dosage_value) VALUES("buspirone", "tablet", "5mg");
INSERT INTO Drug_Form_Dosage (drug_name, form_type, dosage_value) VALUES("insulin glargine", "vial", "10ml of 100units/ml");
INSERT INTO Drug_Form_Dosage (drug_name, form_type, dosage_value) VALUES("naproxen", "tablet", "500mg");
INSERT INTO Drug_Form_Dosage (drug_name, form_type, dosage_value) VALUES("metformin", "tablet", "1000mg");
INSERT INTO Drug_Form_Dosage (drug_name, form_type, dosage_value) VALUES("prednisone", "tablet", "20mg");
INSERT INTO Drug_Form_Dosage (drug_name, form_type, dosage_value) VALUES("omeprazole", "tablet", "40mg");
INSERT INTO Drug_Form_Dosage (drug_name, form_type, dosage_value) VALUES("salbutamol", "inhaler", "100mg");
INSERT INTO Drug_Form_Dosage (drug_name, form_type, dosage_value) VALUES("carvedilol", "tablet", "25mg");
INSERT INTO Drug_Form_Dosage (drug_name, form_type, dosage_value) VALUES("simvastatin", "tablet", "40mg");
INSERT INTO Drug_Form_Dosage (drug_name, form_type, dosage_value) VALUES("beclomethasone dipropionate", "aerosol", "40mcg/inh");
INSERT INTO Drug_Form_Dosage (drug_name, form_type, dosage_value) VALUES("aspirin", "tablet", "81mg");
INSERT INTO Drug_Form_Dosage (drug_name, form_type, dosage_value) VALUES("aspirin", "tablet", "325mg");
INSERT INTO Drug_Form_Dosage (drug_name, form_type, dosage_value) VALUES("aspirin", "chewable tablet", "81mg");

INSERT INTO Drug_Form_Dosage (drug_name, form_type, dosage_value) VALUES("Codeine Phosphate", "tablet", "60mg");
INSERT INTO Drug_Form_Dosage (drug_name, form_type, dosage_value) VALUES("Lithium Bromide", "capsules", "300mg");
INSERT INTO Drug_Form_Dosage (drug_name, form_type, dosage_value) VALUES("Trichothecenes", "tablet", "25mg");
INSERT INTO Drug_Form_Dosage (drug_name, form_type, dosage_value) VALUES("Sodium Iodipamide", "dropper", "30ml");





-- Insert into Quantity
INSERT INTO Quantity (quantity_value) VALUES("10 tablets");
INSERT INTO Quantity (quantity_value) VALUES("15 tablets");
INSERT INTO Quantity (quantity_value) VALUES("20 tablets");
INSERT INTO Quantity (quantity_value) VALUES("30 tablets");
INSERT INTO Quantity (quantity_value) VALUES("60 tablets");
INSERT INTO Quantity (quantity_value) VALUES("90 tablets");
INSERT INTO Quantity (quantity_value) VALUES("10 sublingual tablets");
INSERT INTO Quantity (quantity_value) VALUES("30 sublingual tablets");
INSERT INTO Quantity (quantity_value) VALUES("30 chewable tablets");
INSERT INTO Quantity (quantity_value) VALUES("90 chewable tablets");
INSERT INTO Quantity (quantity_value) VALUES("1 vial");
INSERT INTO Quantity (quantity_value) VALUES("1 bottle");
INSERT INTO Quantity (quantity_value) VALUES("8.7g");

INSERT INTO Quantity (quantity_value) VALUES("30 capsules");
INSERT INTO Quantity (quantity_value) VALUES("90 capsules");
INSERT INTO Quantity (quantity_value) VALUES("1 dropper");



-- Insert into Drug_Form_Quantity
INSERT INTO Drug_Form_Quantity (drug_name, form_type, quantity_value) VALUES("zolpidem", "sublingual tablet", "10 sublingual tablets");
INSERT INTO Drug_Form_Quantity (drug_name, form_type, quantity_value) VALUES("zolpidem", "sublingual tablet", "30 sublingual tablets");
INSERT INTO Drug_Form_Quantity (drug_name, form_type, quantity_value) VALUES("zolpidem", "tablet", "15 tablets");
INSERT INTO Drug_Form_Quantity (drug_name, form_type, quantity_value) VALUES("zolpidem", "tablet", "20 tablets");
INSERT INTO Drug_Form_Quantity (drug_name, form_type, quantity_value) VALUES("zolpidem", "tablet", "30 tablets");
INSERT INTO Drug_Form_Quantity (drug_name, form_type, quantity_value) VALUES("chlortalidone", "tablet", "30 tablets");
INSERT INTO Drug_Form_Quantity (drug_name, form_type, quantity_value) VALUES("terbinafine", "tablet", "30 tablets");
INSERT INTO Drug_Form_Quantity (drug_name, form_type, quantity_value) VALUES("isosorbide mononitrate", "tablet", "30 tablets");
INSERT INTO Drug_Form_Quantity (drug_name, form_type, quantity_value) VALUES("gabapentin", "tablet", "30 tablets");
INSERT INTO Drug_Form_Quantity (drug_name, form_type, quantity_value) VALUES("lisinopril", "tablet", "30 tablets");
INSERT INTO Drug_Form_Quantity (drug_name, form_type, quantity_value) VALUES("citalopram", "tablet", "30 tablets");
INSERT INTO Drug_Form_Quantity (drug_name, form_type, quantity_value) VALUES("losartan/hydrochlorothiazide", "tablet", "30 tablets");
INSERT INTO Drug_Form_Quantity (drug_name, form_type, quantity_value) VALUES("buspirone", "tablet", "30 tablets");
INSERT INTO Drug_Form_Quantity (drug_name, form_type, quantity_value) VALUES("insulin glargine", "vial", "1 vial");
INSERT INTO Drug_Form_Quantity (drug_name, form_type, quantity_value) VALUES("naproxen", "tablet", "30 tablets");
INSERT INTO Drug_Form_Quantity (drug_name, form_type, quantity_value) VALUES("metformin", "tablet", "30 tablets");
INSERT INTO Drug_Form_Quantity (drug_name, form_type, quantity_value) VALUES("prednisone", "tablet", "10 tablets");
INSERT INTO Drug_Form_Quantity (drug_name, form_type, quantity_value) VALUES("omeprazole", "tablet", "30 tablets");
INSERT INTO Drug_Form_Quantity (drug_name, form_type, quantity_value) VALUES("salbutamol", "inhaler", "1 bottle");
INSERT INTO Drug_Form_Quantity (drug_name, form_type, quantity_value) VALUES("carvedilol", "tablet", "30 tablets");
INSERT INTO Drug_Form_Quantity (drug_name, form_type, quantity_value) VALUES("simvastatin", "tablet", "30 tablets");
INSERT INTO Drug_Form_Quantity (drug_name, form_type, quantity_value) VALUES("beclomethasone dipropionate", "aerosol", "8.7g");
INSERT INTO Drug_Form_Quantity (drug_name, form_type, quantity_value) VALUES("aspirin", "tablet", "30 tablets");
INSERT INTO Drug_Form_Quantity (drug_name, form_type, quantity_value) VALUES("aspirin", "tablet", "60 tablets");
INSERT INTO Drug_Form_Quantity (drug_name, form_type, quantity_value) VALUES("aspirin", "tablet", "90 tablets");
INSERT INTO Drug_Form_Quantity (drug_name, form_type, quantity_value) VALUES("aspirin", "chewable tablet", "30 tablets");
INSERT INTO Drug_Form_Quantity (drug_name, form_type, quantity_value) VALUES("aspirin", "chewable tablet", "90 tablets");

INSERT INTO Drug_Form_Quantity (drug_name, form_type, quantity_value) VALUES("Codeine Phosphate", "tablet", "30 tablets");
INSERT INTO Drug_Form_Quantity (drug_name, form_type, quantity_value) VALUES("Codeine Phosphate", "tablet", "60 tablets");
INSERT INTO Drug_Form_Quantity (drug_name, form_type, quantity_value) VALUES("Lithium Bromide", "capsules", "30 capsules");
INSERT INTO Drug_Form_Quantity (drug_name, form_type, quantity_value) VALUES("Lithium Bromide", "capsules", "90 capsules");
INSERT INTO Drug_Form_Quantity (drug_name, form_type, quantity_value) VALUES("Trichothecenes", "tablet", "30 tablets");
INSERT INTO Drug_Form_Quantity (drug_name, form_type, quantity_value) VALUES("Sodium Iodipamide", "dropper", "1 dropper");





-- Insert into Price
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(1, 300, 'Walmart', FALSE);  -- "zolpidem", "sublingual tablet", "5mg", "30 sublingual tablets"
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(2, 267.01, 'Walmart', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(3, 120, 'CVS', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(4, 116.16, 'CVS', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(5, 104, 'Walgreen', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(6, 103.61, 'Walgreen', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(7, 100, 'Walmart', FALSE);  -- "zolpidem", "sublingual tablet", "1.75mg", "10 sublingual tablets"
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(8, 90.34, 'Walmart', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(9, 45, 'CVS', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(10, 43.89, 'CVS', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(11, 42, 'Walgreen', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(12, 40.37, 'Walgreen', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(13, 320, 'Walmart', FALSE);  -- "zolpidem", "sublingual tablet", "1.75mg", "30 sublingual tablets"
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(14, 267.01, 'Walmart', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(15, 130, 'CVS', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(16, 116.16, 'CVS', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(17, 110, 'Walgreen', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(18, 103.61, 'Walgreen', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(19, 15, 'Walmart', FALSE);  -- "zolpidem", "tablet", "5mg", "20 tablets"
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(20, 7.81, 'Walmart', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(21, 33, 'CVS', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(22, 7.63, 'CVS', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(23, 30, 'Walgreen', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(24, 22.97, 'Walgreen', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(25, 12, 'Walmart', FALSE);  -- "zolpidem", "tablet", "5mg", "30 tablets"
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(26, 10.71, 'Walmart', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(27, 47, 'CVS', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(28, 9.45, 'CVS', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(29, 35, 'Walgreen', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(30, 32.2, 'Walgreen', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(31, 20, 'Walmart', FALSE);  -- "zolpidem", "tablet", "10mg", "15 tablets"
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(32, 9.38, 'Walmart', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(33, 25, 'CVS', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(34, 11.26, 'CVS', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(35, 20, 'Walgreen', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(36, 11.21, 'Walgreen', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(37, 26, 'Walmart', FALSE);  -- "zolpidem", "tablet", "10mg", "30 tablets"
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(38, 16.76, 'Walmart', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(39, 48, 'CVS', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(40, 14.72, 'CVS', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(41, 19.68, 'Walgreen', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(42, 14.68, 'Walgreen', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(43, 24, 'Walmart', FALSE);  -- "chlortalidone", "tablet", "15mg", "30 tablets"
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(44, 17.81, 'Walmart', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(45, 27, 'CVS', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(46, 20.58, 'CVS', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(47, 31, 'Walgreen', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(48, 19.7, 'Walgreen', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(49, 4, 'Walmart', FALSE);  -- "terbinafine", "tablet", "250mg", "30 tablets"
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(50, 4, 'Walmart', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(51, 65, 'CVS', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(52, 26.53, 'CVS', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(53, 10, 'Walgreen', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(54, 10, 'Walgreen', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(55, 15, 'Walmart', FALSE);  -- "isosorbide mononitrate", "tablet", "20mg", "30 tablets"
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(56, 11.16, 'Walmart', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(57, 16, 'CVS', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(58, 12.26, 'CVS', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(59, 18.35, 'Walgreen', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(60, 14.35, 'Walgreen', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(61, 182.6, 'Walmart', FALSE);  -- "insulin glargine", "vial", "10ml of 100units/ml", "1 vial"
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(62, 187.59, 'Walmart', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(63, 321, 'CVS', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(64, 187.59, 'CVS', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(65, 417, 'Walgreen', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(66, 187.59, 'Walgreen', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(67, 30, 'Walmart', FALSE);  -- "salbutamol", "inhaler", "100mg", "1 bottle"
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(68, 4, 'Walmart', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(69, 27, 'CVS', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(70, 14.94, 'CVS', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(71, 36, 'Walgreen', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(72, 21.14, 'Walgreen', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(73, 183.25, 'Walmart', FALSE);  -- "beclomethasone dipropionate", "aerosol", "40mcg/inh", "8.7g"
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(74, 179.75, 'Walmart', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(75, 192.31, 'CVS', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(76, 187.79, 'CVS', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(77, 205.32, 'Walgreen', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(78, 192.92, 'Walgreen', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(79, 2, 'Walmart', FALSE);  -- "aspirin", "tablet", "81mg", "30 tablets"
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(80, 2.41, 'Walmart', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(81, 1.74, 'CVS', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(82, 1.74, 'CVS', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(83, 5, 'Walgreen', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(84, 4.55, 'Walgreen', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(85, 3, 'Walmart', FALSE);  -- "aspirin", "tablet", "81mg", "60 tablets"
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(86, 2.81, 'Walmart', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(87, 3.52, 'CVS', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(88, 3.52, 'CVS', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(89, 6, 'Walgreen', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(90, 5.66, 'Walgreen', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(91, 3, 'Walmart', FALSE);  -- "aspirin", "tablet", "325mg", "30 tablets"
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(92, 2.68, 'Walmart', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(93, 1.68, 'CVS', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(94, 1.68, 'CVS', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(95, 5, 'Walgreen', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(96, 4.79, 'Walgreen', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(97, 3, 'Walmart', FALSE);  -- "aspirin", "tablet", "325mg", "60 tablets"
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(98, 2.51, 'Walmart', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(99, 3.41, 'CVS', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(100, 3.41, 'CVS', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(101, 6, 'Walgreen', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(102, 5.25, 'Walgreen', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(103, 3.82, 'Walmart', FALSE);  -- "aspirin", "chewable tablet", "81mg", "30 chewable tablet"
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(104, 3.82, 'Walmart', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(105, 4.53, 'CVS', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(106, 4.53, 'CVS', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(107, 2.15, 'Walgreen', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(108, 2.15, 'Walgreen', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(109, 8, 'Walmart', FALSE);  -- "aspirin", "chewable tablet", "81mg", "90 chewable tablet"
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(110, 7.3, 'Walmart', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(111, 14, 'CVS', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(112, 6.81, 'CVS', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(113, 5.65, 'Walgreen', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(114, 5.65, 'Walgreen', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(115, 32, 'Walmart', FALSE);  -- "gabapentin", "tablet", "600mg", "30 tablets"
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(116, 16.66, 'Walmart', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(117, 62, 'CVS', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(118, 19.75, 'CVS', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(119, 67, 'Walgreen', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(120, 18.6, 'Walgreen', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(121, 4, 'Walmart', FALSE);  -- "lisinopril", "tablet", "20mg", "30 tablets"
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(122, 4, 'Walmart', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(123, 15, 'CVS', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(124, 8.5, 'CVS', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(125, 9, 'Walgreen', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(126, 5, 'Walgreen', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(127, 4, 'Walmart', FALSE);  -- "citalopram", "tablet", "20mg", "30 tablets"
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(128, 4, 'Walmart', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(129, 22, 'CVS', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(130, 8.5, 'CVS', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(131, 21, 'Walgreen', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(132, 10.74, 'Walgreen', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(133, 73, 'Walmart', FALSE);  -- "losartan/hydrochlorothiazide", "tablet", "100mg/12.5mg", "30 tablets"
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(134, 15.34, 'Walmart', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(135, 74, 'CVS', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(136, 23, 'CVS', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(137, 88, 'Walgreen', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(138, 20, 'Walgreen', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(139, 4, 'Walmart', FALSE);  -- "buspirone", "tablet", "5mg", "30 tablets"
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(140, 4, 'Walmart', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(141, 13, 'CVS', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(142, 12.51, 'CVS', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(143, 17, 'Walgreen', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(144, 10.61, 'Walgreen', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(145, 4, 'Walmart', FALSE);  -- "naproxen", "tablet", "500mg", "30 tablets"
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(146, 4, 'Walmart', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(147, 12, 'CVS', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(148, 11.82, 'CVS', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(149, 15, 'Walgreen', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(150, 10, 'Walgreen', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(151, 4, 'Walmart', FALSE); -- "metformin", "tablet", "1000mg", "30 tablets"
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(152, 4, 'Walmart', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(153, 14, 'CVS', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(154, 11.06, 'CVS', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(155, 8, 'Walgreen', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(156, 5, 'Walgreen', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(157, 5, 'Walmart', FALSE); -- "prednisone", "tablet", "20mg", "10 tablets"
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(158, 4.67, 'Walmart', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(159, 12, 'CVS', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(160, 6, 'CVS', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(161, 12, 'Walgreen', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(162, 6.73, 'Walgreen', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(163, 58, 'Walmart', FALSE); -- "omeprazole", "tablet", "40mg", "30 tablets"
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(164, 23.16, 'Walmart', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(165, 162, 'CVS', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(166, 22.75, 'CVS', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(167, 169, 'Walgreen', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(168, 22, 'Walgreen', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(169, 4, 'Walmart', FALSE); -- "carvedilol", "tablet", "25mg", "30 tablets"
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(170, 4, 'Walmart', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(171, 21, 'CVS', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(172, 14.1, 'CVS', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(173, 14, 'Walgreen', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(174, 10, 'Walgreen', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(175, 28, 'Walmart', FALSE); -- "simvastatin", "tablet", "40mg", "30 tablets"
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(176, 13.01, 'Walmart', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(177, 29, 'CVS', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(178, 18.99, 'CVS', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(179, 19.88, 'Walgreen', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(180, 15, 'Walgreen', TRUE);

INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(181, 72.4, 'Walmart', FALSE); -- "Codeine Phosphate", "tablet", "60mg", "30 tablets"
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(182, 66.2, 'Walmart', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(183, 77, 'CVS', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(184, 73, 'CVS', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(185, 80.6, 'Walgreen', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(186, 76.2, 'Walgreen', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(187, 98.55, 'Walmart', FALSE); -- "Codeine Phosphate", "tablet", "60mg", "60 tablets"
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(188, 93.65, 'Walmart', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(189, 100, 'CVS', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(190, 96, 'CVS', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(191, 107, 'Walgreen', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(192, 103.2, 'Walgreen', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(193, 4, 'Walmart', FALSE); -- "Lithium Bromide", "capsules", "300mg", "30 capsules"
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(194, 4, 'Walmart', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(195, 12, 'CVS', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(196, 8.18, 'CVS', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(197, 12, 'Walgreen', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(198, 5.52, 'Walgreen', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(199, 4, 'Walmart', FALSE); -- "Lithium Bromide", "capsules", "300mg", "90 capsules"
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(200, 4, 'Walmart', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(201, 22, 'CVS', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(202, 14.45, 'CVS', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(203, 24, 'Walgreen', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(204, 7.55, 'Walgreen', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(205, 20, 'Walmart', FALSE); -- "Trichothecenes", "tablet", "25mg", "30 tablet"
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(206, 16.67, 'Walmart', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(207, 48, 'CVS', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(208, 14.72, 'CVS', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(209, 17.44, 'Walgreen', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(210, 14.68, 'Walgreen', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(211, 21.75, 'Walmart', FALSE); -- "Sodium Iodipamide", "dropper", "30ml", "1 dropper"
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(212, 18.75, 'Walmart', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(213, 23.81, 'CVS', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(214, 20.81, 'CVS', TRUE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(215, 24.99, 'Walgreen', FALSE);
INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(216, 20.21, 'Walgreen', TRUE);




-- template
-- INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(, , 'Walmart', FALSE);  -- "", "", "", ""
-- INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(, , 'Walmart', TRUE);
-- INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(, , 'CVS', FALSE);
-- INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(, , 'CVS', TRUE);
-- INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(, , 'Walgreen', FALSE);
-- INSERT INTO Price (price_id, price_value, store, is_coupon_price) VALUES(, , 'Walgreen', TRUE);



-- Insert into Price_Association
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(1, 1, "zolpidem", "sublingual tablet", "5mg", "30 sublingual tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(2, 2, "zolpidem", "sublingual tablet", "5mg", "30 sublingual tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(3, 3, "zolpidem", "sublingual tablet", "5mg", "30 sublingual tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(4, 4, "zolpidem", "sublingual tablet", "5mg", "30 sublingual tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(5, 5, "zolpidem", "sublingual tablet", "5mg", "30 sublingual tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(6, 6, "zolpidem", "sublingual tablet", "5mg", "30 sublingual tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(7, 7, "zolpidem", "sublingual tablet", "1.75mg", "10 sublingual tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(8, 8, "zolpidem", "sublingual tablet", "1.75mg", "10 sublingual tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(9, 9, "zolpidem", "sublingual tablet", "1.75mg", "10 sublingual tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(10, 10, "zolpidem", "sublingual tablet", "1.75mg", "10 sublingual tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(11, 11, "zolpidem", "sublingual tablet", "1.75mg", "10 sublingual tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(12, 12, "zolpidem", "sublingual tablet", "1.75mg", "10 sublingual tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(13, 13, "zolpidem", "sublingual tablet", "1.75mg", "30 sublingual tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(14, 14, "zolpidem", "sublingual tablet", "1.75mg", "30 sublingual tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(15, 15, "zolpidem", "sublingual tablet", "1.75mg", "30 sublingual tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(16, 16, "zolpidem", "sublingual tablet", "1.75mg", "30 sublingual tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(17, 17, "zolpidem", "sublingual tablet", "1.75mg", "30 sublingual tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(18, 18, "zolpidem", "sublingual tablet", "1.75mg", "30 sublingual tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(19, 19, "zolpidem", "tablet", "5mg", "20 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(20, 20, "zolpidem", "tablet", "5mg", "20 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(21, 21, "zolpidem", "tablet", "5mg", "20 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(22, 22, "zolpidem", "tablet", "5mg", "20 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(23, 23, "zolpidem", "tablet", "5mg", "20 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(24, 24, "zolpidem", "tablet", "5mg", "20 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(25, 25, "zolpidem", "tablet", "5mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(26, 26, "zolpidem", "tablet", "5mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(27, 27, "zolpidem", "tablet", "5mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(28, 28, "zolpidem", "tablet", "5mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(29, 29, "zolpidem", "tablet", "5mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(30, 30, "zolpidem", "tablet", "5mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(31, 31, "zolpidem", "tablet", "10mg", "15 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(32, 32, "zolpidem", "tablet", "10mg", "15 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(33, 33, "zolpidem", "tablet", "10mg", "15 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(34, 34, "zolpidem", "tablet", "10mg", "15 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(35, 35, "zolpidem", "tablet", "10mg", "15 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(36, 36, "zolpidem", "tablet", "10mg", "15 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(37, 37, "zolpidem", "tablet", "10mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(38, 38, "zolpidem", "tablet", "10mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(39, 39, "zolpidem", "tablet", "10mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(40, 40, "zolpidem", "tablet", "10mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(41, 41, "zolpidem", "tablet", "10mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(42, 42, "zolpidem", "tablet", "10mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(43, 43, "chlortalidone", "tablet", "15mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(44, 44, "chlortalidone", "tablet", "15mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(45, 45, "chlortalidone", "tablet", "15mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(46, 46, "chlortalidone", "tablet", "15mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(47, 47, "chlortalidone", "tablet", "15mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(48, 48, "chlortalidone", "tablet", "15mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(49, 49, "terbinafine", "tablet", "250mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(50, 50, "terbinafine", "tablet", "250mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(51, 51, "terbinafine", "tablet", "250mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(52, 52, "terbinafine", "tablet", "250mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(53, 53, "terbinafine", "tablet", "250mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(54, 54, "terbinafine", "tablet", "250mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(55, 55, "isosorbide mononitrate", "tablet", "20mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(56, 56, "isosorbide mononitrate", "tablet", "20mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(57, 57, "isosorbide mononitrate", "tablet", "20mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(58, 58, "isosorbide mononitrate", "tablet", "20mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(59, 59, "isosorbide mononitrate", "tablet", "20mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(60, 60, "isosorbide mononitrate", "tablet", "20mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(61, 61, "insulin glargine", "vial", "10ml of 100units/ml", "1 vial");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(62, 62, "insulin glargine", "vial", "10ml of 100units/ml", "1 vial");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(63, 63, "insulin glargine", "vial", "10ml of 100units/ml", "1 vial");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(64, 64, "insulin glargine", "vial", "10ml of 100units/ml", "1 vial");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(65, 65, "insulin glargine", "vial", "10ml of 100units/ml", "1 vial");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(66, 66, "insulin glargine", "vial", "10ml of 100units/ml", "1 vial");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(67, 67, "salbutamol", "inhaler", "100mg", "1 bottle");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(68, 68, "salbutamol", "inhaler", "100mg", "1 bottle");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(69, 69, "salbutamol", "inhaler", "100mg", "1 bottle");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(70, 70, "salbutamol", "inhaler", "100mg", "1 bottle");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(71, 71, "salbutamol", "inhaler", "100mg", "1 bottle");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(72, 72, "salbutamol", "inhaler", "100mg", "1 bottle");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(73, 73, "beclomethasone dipropionate", "aerosol", "40mcg/inh", "8.7g");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(74, 74, "beclomethasone dipropionate", "aerosol", "40mcg/inh", "8.7g");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(75, 75, "beclomethasone dipropionate", "aerosol", "40mcg/inh", "8.7g");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(76, 76, "beclomethasone dipropionate", "aerosol", "40mcg/inh", "8.7g");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(77, 77, "beclomethasone dipropionate", "aerosol", "40mcg/inh", "8.7g");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(78, 78, "beclomethasone dipropionate", "aerosol", "40mcg/inh", "8.7g" );
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(79, 79, "aspirin", "tablet", "81mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(80, 80, "aspirin", "tablet", "81mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(81, 81, "aspirin", "tablet", "81mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(82, 82, "aspirin", "tablet", "81mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(83, 83, "aspirin", "tablet", "81mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(84, 84, "aspirin", "tablet", "81mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(85, 85, "aspirin", "tablet", "81mg", "60 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(86, 86, "aspirin", "tablet", "81mg", "60 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(87, 87, "aspirin", "tablet", "81mg", "60 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(88, 88, "aspirin", "tablet", "81mg", "60 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(89, 89, "aspirin", "tablet", "81mg", "60 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(90, 90, "aspirin", "tablet", "81mg", "60 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(91, 91, "aspirin", "tablet", "325mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(92, 92, "aspirin", "tablet", "325mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(93, 93, "aspirin", "tablet", "325mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(94, 94, "aspirin", "tablet", "325mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(95, 95, "aspirin", "tablet", "325mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(96, 96, "aspirin", "tablet", "325mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(97, 97, "aspirin", "tablet", "325mg", "60 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(98, 98, "aspirin", "tablet", "325mg", "60 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(99, 99, "aspirin", "tablet", "325mg", "60 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(100, 100, "aspirin", "tablet", "325mg", "60 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(101, 101, "aspirin", "tablet", "325mg", "60 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(102, 102, "aspirin", "tablet", "325mg", "60 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(103, 103, "aspirin", "chewable tablet", "81mg", "30 chewable tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(104, 104, "aspirin", "chewable tablet", "81mg", "30 chewable tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(105, 105, "aspirin", "chewable tablet", "81mg", "30 chewable tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(106, 106, "aspirin", "chewable tablet", "81mg", "30 chewable tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(107, 107, "aspirin", "chewable tablet", "81mg", "30 chewable tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(108, 108, "aspirin", "chewable tablet", "81mg", "30 chewable tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(109, 109, "aspirin", "chewable tablet", "81mg", "90 chewable tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(110, 110, "aspirin", "chewable tablet", "81mg", "90 chewable tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(111, 111, "aspirin", "chewable tablet", "81mg", "90 chewable tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(112, 112, "aspirin", "chewable tablet", "81mg", "90 chewable tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(113, 113, "aspirin", "chewable tablet", "81mg", "90 chewable tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(114, 114, "aspirin", "chewable tablet", "81mg", "90 chewable tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(115, 115, "gabapentin", "tablet", "600mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(116, 116, "gabapentin", "tablet", "600mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(117, 117, "gabapentin", "tablet", "600mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(118, 118, "gabapentin", "tablet", "600mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(119, 119, "gabapentin", "tablet", "600mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(120, 120, "gabapentin", "tablet", "600mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(121, 121, "lisinopril", "tablet", "20mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(122, 122, "lisinopril", "tablet", "20mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(123, 123, "lisinopril", "tablet", "20mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(124, 124, "lisinopril", "tablet", "20mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(125, 125, "lisinopril", "tablet", "20mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(126, 126, "lisinopril", "tablet", "20mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(127, 127, "citalopram", "tablet", "20mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(128, 128, "citalopram", "tablet", "20mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(129, 129, "citalopram", "tablet", "20mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(130, 130, "citalopram", "tablet", "20mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(131, 131, "citalopram", "tablet", "20mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(132, 132, "citalopram", "tablet", "20mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(133, 133, "losartan/hydrochlorothiazide", "tablet", "100mg/12.5mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(134, 134, "losartan/hydrochlorothiazide", "tablet", "100mg/12.5mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(135, 135, "losartan/hydrochlorothiazide", "tablet", "100mg/12.5mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(136, 136, "losartan/hydrochlorothiazide", "tablet", "100mg/12.5mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(137, 137, "losartan/hydrochlorothiazide", "tablet", "100mg/12.5mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(138, 138, "losartan/hydrochlorothiazide", "tablet", "100mg/12.5mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(139, 139, "buspirone", "tablet", "5mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(140, 140, "buspirone", "tablet", "5mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(141, 141, "buspirone", "tablet", "5mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(142, 142, "buspirone", "tablet", "5mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(143, 143, "buspirone", "tablet", "5mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(144, 144, "buspirone", "tablet", "5mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(145, 145, "naproxen", "tablet", "500mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(146, 146, "naproxen", "tablet", "500mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(147, 147, "naproxen", "tablet", "500mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(148, 148, "naproxen", "tablet", "500mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(149, 149, "naproxen", "tablet", "500mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(150, 150, "naproxen", "tablet", "500mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(151, 151, "metformin", "tablet", "1000mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(152, 152, "metformin", "tablet", "1000mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(153, 153, "metformin", "tablet", "1000mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(154, 154, "metformin", "tablet", "1000mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(155, 155, "metformin", "tablet", "1000mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(156, 156, "metformin", "tablet", "1000mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(157, 157, "prednisone", "tablet", "20mg", "10 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(158, 158, "prednisone", "tablet", "20mg", "10 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(159, 159, "prednisone", "tablet", "20mg", "10 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(160, 160, "prednisone", "tablet", "20mg", "10 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(161, 161, "prednisone", "tablet", "20mg", "10 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(162, 162, "prednisone", "tablet", "20mg", "10 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(163, 163, "omeprazole", "tablet", "40mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(164, 164, "omeprazole", "tablet", "40mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(165, 165, "omeprazole", "tablet", "40mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(166, 166, "omeprazole", "tablet", "40mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(167, 167, "omeprazole", "tablet", "40mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(168, 168, "omeprazole", "tablet", "40mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(169, 169, "carvedilol", "tablet", "25mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(170, 170, "carvedilol", "tablet", "25mg", "30 tablets" );
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(171, 171, "carvedilol", "tablet", "25mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(172, 172, "carvedilol", "tablet", "25mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(173, 173, "carvedilol", "tablet", "25mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(174, 174, "carvedilol", "tablet", "25mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(175, 175, "simvastatin", "tablet", "40mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(176, 176, "simvastatin", "tablet", "40mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(177, 177, "simvastatin", "tablet", "40mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(178, 178, "simvastatin", "tablet", "40mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(179, 179, "simvastatin", "tablet", "40mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(180, 180, "simvastatin", "tablet", "40mg", "30 tablets");

INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(181, 181, "Codeine Phosphate", "tablet", "60mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(182, 182, "Codeine Phosphate", "tablet", "60mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(183, 183, "Codeine Phosphate", "tablet", "60mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(184, 184, "Codeine Phosphate", "tablet", "60mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(185, 185, "Codeine Phosphate", "tablet", "60mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(186, 186, "Codeine Phosphate", "tablet", "60mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(187, 187, "Codeine Phosphate", "tablet", "60mg", "60 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(188, 188, "Codeine Phosphate", "tablet", "60mg", "60 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(189, 189, "Codeine Phosphate", "tablet", "60mg", "60 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(190, 190, "Codeine Phosphate", "tablet", "60mg", "60 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(191, 191, "Codeine Phosphate", "tablet", "60mg", "60 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(192, 192, "Codeine Phosphate", "tablet", "60mg", "60 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(193, 193, "Lithium Bromide", "capsules", "300mg", "30 capsules");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(194, 194, "Lithium Bromide", "capsules", "300mg", "30 capsules");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(195, 195, "Lithium Bromide", "capsules", "300mg", "30 capsules");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(196, 196, "Lithium Bromide", "capsules", "300mg", "30 capsules");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(197, 197, "Lithium Bromide", "capsules", "300mg", "30 capsules");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(198, 198, "Lithium Bromide", "capsules", "300mg", "30 capsules");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(199, 199, "Lithium Bromide", "capsules", "300mg", "90 capsules");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(200, 200, "Lithium Bromide", "capsules", "300mg", "90 capsules");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(201, 201, "Lithium Bromide", "capsules", "300mg", "90 capsules");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(202, 202, "Lithium Bromide", "capsules", "300mg", "90 capsules");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(203, 203, "Lithium Bromide", "capsules", "300mg", "90 capsules");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(204, 204, "Lithium Bromide", "capsules", "300mg", "90 capsules");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(205, 205, "Trichothecenes", "tablet", "25mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(206, 206, "Trichothecenes", "tablet", "25mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(207, 207, "Trichothecenes", "tablet", "25mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(208, 208, "Trichothecenes", "tablet", "25mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(209, 209, "Trichothecenes", "tablet", "25mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(210, 210, "Trichothecenes", "tablet", "25mg", "30 tablets");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(211, 211, "Sodium Iodipamide", "dropper", "30ml", "1 dropper");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(212, 212, "Sodium Iodipamide", "dropper", "30ml", "1 dropper");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(213, 213, "Sodium Iodipamide", "dropper", "30ml", "1 dropper");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(214, 214, "Sodium Iodipamide", "dropper", "30ml", "1 dropper");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(215, 215, "Sodium Iodipamide", "dropper", "30ml", "1 dropper");
INSERT INTO Price_Association (association_id, price_id, drug_name, form_type, dosage_value, quantity_value) VALUES(216, 216, "Sodium Iodipamide", "dropper", "30ml", "1 dropper");
