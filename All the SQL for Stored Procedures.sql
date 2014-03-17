
/*DELIMITER $$
USE `testingframeworkdb`$$
CREATE PROCEDURE `newTest` (test_name varchar(300), des varchar(1000))
BEGIN
	insert into test (test_name, description) values (test_name, des);
END$$

DELIMITER ;*/

/*call newTest('mySelenium.Driver.searchYoutube', 'bhghjgdfshghgksfdygsdfkhygdskfgsdgkygrkdydfs fyds dfgdsiygfdkgdkgkbfdskgdkhbgkdf gbkdfhbgdshbgkhdfgdf');
*/

/*select * From test;*/
/*
CREATE TABLE IF NOT EXISTS `TestingFrameworkDB`.`test_case` (
  






`test_auto_id` BIGINT NOT NULL,
  `test_case_number` SMALLINT NOT NULL,
  `date_time` DATETIME NOT NULL,
  `os_version` VARCHAR(200) NULL,
  `platform` VARCHAR(100) NULL,
  `machine_name` VARCHAR(100) NOT NULL,
  `machine_user` VARCHAR(100) NOT NULL,
  `asserts` SMALLINT NULL,
  `executed` TINYINT(1) NULL,
  `result` VARCHAR(100) NULL,
  `success` TINYINT(1) NOT NULL,
  `message` VARCHAR(1000) NULL,
  `stack_trace` VARCHAR(5000) NULL,
  `running_time` DOUBLE NOT NULL,
  `code_coverage_type` VARCHAR(80) NULL,
  `code_coverage_percentage` FLOAT NULL,*/
  
/*DELIMITER $$

USE `testingframeworkdb` $$

CREATE PROCEDURE `newTestCase` (test_auto_id bigint, test_case_number smallint, date_time datetime, os_version varchar(200), platform varchar(100),
								machine_name varchar(100), machine_user varchar(100), asserts smallint, executed bool, result varchar(100),
								success bool, message varchar(1000), stack_trace varchar(5000), running_time double, code_coverage_type varchar(50),
								code_coverage_percentage float)
BEGIN
	insert into test_case (test_auto_id, test_case_number, date_time, os_version, platform, machine_name, machine_user, asserts, executed,
							result, success, message, stack_trace, running_time, code_coverage_type, code_coverage_percentage) values
							(test_auto_id, test_case_number, date_time, os_version, platform, machine_name, machine_user, asserts, executed,
							result, success, message, stack_trace, running_time, code_coverage_type, code_coverage_percentage);
END$$

DELIMITER ;*/

/*DELIMITER $$

CREATE FUNCTION `testExist` (testName varchar(300))
RETURNS bool

BEGIN
	DECLARE temp bool;
	IF ((SELECT COUNT(*) FROM test WHERE test_name = testName) = 1) 
		THEN 
			SET temp = true;
		ELSE 
			SET temp = false;
	END IF;
	RETURN temp;
END$$

DELIMITER $$*/

/*test testExist*/
/*SELECT testExist("mySelenium.Driver.searchYou");*/

/*
DELIMITER $$

CREATE FUNCTION `nextTestCaseNumber` (testName varchar(300))
RETURNS INTEGER

BEGIN
	DECLARE testID bigint;
	
	SET testID = (SELECT auto_id FROM test WHERE test_name = testName LIMIT 1); 
	RETURN (SELECT COUNT(*) FROM test_case WHERE test_auto_id = testID) + 1;

END$$

DELIMITER $$
*/

/*DELIMITER $$

CREATE FUNCTION `newTestRun` (test_name varchar(300), description varchar(1000), date_time datetime, os_version varchar(200), platform varchar(100),
							  machine_name varchar(100), machine_user varchar(100), asserts smallint, executed bool, result varchar(100),
							  success bool, message varchar(1000), stack_trace varchar(5000), running_time double, code_coverage_type varchar(50),
							  code_coverage_percentage float)
RETURNS INTEGER

BEGIN
		DECLARE testExistBit BIGINT;
		DECLARE returnValue INTEGER;
		SET testExistBit = testExist(test_name);
		IF testExistBit = 0
		THEN 
			CALL newTest(test_name, description);
			
			CALL newTestCase(testExist(test_name), nextTestCaseNumber(test_name), date_time, os_version, platform, machine_name, machine_user, asserts, executed,
							 result, success, message, stack_trace, running_time, code_coverage_type, code_coverage_percentage);
			SET returnValue = 2;
		ELSE 
			CALL newTestCase(testExistBit, nextTestCaseNumber(test_name), date_time, os_version, platform, machine_name, machine_user, asserts, executed,
							 result, success, message, stack_trace, running_time, code_covergae_type, code_coverage_percentage);
			SET returnValue = 1;
		END IF;		
		RETURN returnValue;		
END$$

DELIMITER $$

*/
/*insert into test (test_name, description) values ("testtesttest", "dvgdfsgfdsggdfsg");*/


/*DELIMITER $$

USE `testingframeworkdb`$$

CREATE FUNCTION `testExist` (testName varchar(300))
RETURNS BIGINT

BEGIN
	DECLARE temp BIGINT;
	IF ((SELECT COUNT(*) FROM test WHERE test_name = testName) = 1) 
		THEN 
			SET temp = (SELECT auto_id FROM test WHERE test_name = testName LIMIT 1);
		ELSE 
			SET temp = 0;
	END IF;
	RETURN temp;
END$$

DELIMITER $$*/

/*SELECT newTestRun("testtesttest3", "dfgdfsgds", CURRENT_TIMESTAMP(), "MS Vista", "x32", "JAMIE-PC", "JAMIE", 2, true, "failed", false, "jhdsahd", 
					"suhfiodshfiugsfyrsy stack", 10.225, "line", 20.5);*/