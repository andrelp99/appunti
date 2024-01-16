-- FROM --> WHERE --> GROUP BY --> SELECT --> ORDER BY --> HAVING.

CREATE DATABASE proveee;

USE proveee;
go

CREATE SCHEMA hr;
go

CREATE TABLE hr.countries (
  COUNTRY_ID varchar(2) DEFAULT NULL,
  COUNTRY_NAME varchar(40) DEFAULT NULL,
  REGION_ID decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (COUNTRY_ID)
);

-- DROP TABLE dbo.hr;

INSERT INTO hr.countries (COUNTRY_ID, COUNTRY_NAME, REGION_ID) VALUES
('AR', 'Argentina', '2'),
('AU', 'Australia', '3'),
('BE', 'Belgium', '1'),
('BR', 'Brazil', '2'),
('CA', 'Canada', '2'),
('CH', 'Switzerland', '1'),
('CN', 'China', '3'),
('DE', 'Germany', '1'),
('DK', 'Denmark', '1'),
('EG', 'Egypt', '4'),
('FR', 'France', '1'),
('HK', 'HongKong', '3'),
('IL', 'Israel', '4'),
('IN', 'India', '3'),
('IT', 'Italy', '1'),
('JP', 'Japan', '3'),
('KW', 'Kuwait', '4'),
('MX', 'Mexico', '2'),
('NG', 'Nigeria', '4'),
('NL', 'Netherlands', '1'),
('SG', 'Singapore', '3'),
('UK', 'United Kingdom', '1'),
('US', 'United States of America', '2'),
('ZM', 'Zambia', '4'),
('ZW', 'Zimbabwe', '4');

-------

CREATE TABLE hr.departments (
  DEPARTMENT_ID decimal(4,0) NOT NULL DEFAULT '0',
  DEPARTMENT_NAME varchar(30) NOT NULL,
  MANAGER_ID decimal(6,0) DEFAULT NULL,
  LOCATION_ID decimal(4,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (DEPARTMENT_ID)
);

INSERT INTO hr.departments (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID) VALUES
('10', 'Administration', '200', '1700'),
('20', 'Marketing', '201', '1800'),
('30', 'Purchasing', '114', '1700'),
('40', 'Human Resources', '203', '2400'),
('50', 'Shipping', '121', '1500'),
('60', 'IT', '103', '1400'),
('70', 'Public Relations', '204', '2700'),
('80', 'Sales', '145', '2500'),
('90', 'Executive', '100', '1700'),
('100', 'Finance', '108', '1700'),
('110', 'Accounting', '205', '1700'),
('120', 'Treasury', '0', '1700'),
('130', 'Corporate Tax', '0', '1700'),
('140', 'Control And Credit', '0', '1700'),
('150', 'Shareholder Services', '0', '1700'),
('160', 'Benefits', '0', '1700'),
('170', 'Manufacturing', '0', '1700'),
('180', 'Construction', '0', '1700'),
('190', 'Contracting', '0', '1700'),
('200', 'Operations', '0', '1700'),
('210', 'IT Support', '0', '1700'),
('220', 'NOC', '0', '1700'),
('230', 'IT Helpdesk', '0', '1700'),
('240', 'Government Sales', '0', '1700'),
('250', 'Retail Sales', '0', '1700'),
('260', 'Recruiting', '0', '1700'),
('270', 'Payroll', '0', '1700');

---------

CREATE TABLE hr.employees (
  EMPLOYEE_ID decimal(6,0) NOT NULL DEFAULT '0',
  FIRST_NAME varchar(20) DEFAULT NULL,
  LAST_NAME varchar(25) NOT NULL,
  EMAIL varchar(25) NOT NULL,
  PHONE_NUMBER varchar(20) DEFAULT NULL,
  HIRE_DATE date NOT NULL,
  JOB_ID varchar(10) NOT NULL DEFAULT '',
  SALARY decimal(8,2) DEFAULT NULL,
  COMMISSION_PCT decimal(2,2) DEFAULT NULL,
  MANAGER_ID decimal(6,0) DEFAULT NULL,
  DEPARTMENT_ID decimal(4,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (EMPLOYEE_ID),
  UNIQUE (EMAIL),
);

---------

INSERT INTO hr.employees (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES
('100', 'Steven', 'King', 'SKING', '515.123.4567', '1987-06-17', 'AD_PRES', '24000.00', '0.00', '0', '90'),
('101', 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', '1987-06-18', 'AD_VP', '17000.00', '0.00', '100', '90'),
('102', 'Lex', 'De Haan', 'LDEHAAN', '515.123.4569', '1987-06-19', 'AD_VP', '17000.00', '0.00', '100', '90'),
('103', 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', '1987-06-20', 'IT_PROG', '9000.00', '0.00', '102', '60'),
('104', 'Bruce', 'Ernst', 'BERNST', '590.423.4568', '1987-06-21', 'IT_PROG', '6000.00', '0.00', '103', '60'),
('105', 'David', 'Austin', 'DAUSTIN', '590.423.4569', '1987-06-22', 'IT_PROG', '4800.00', '0.00', '103', '60'),
('106', 'Valli', 'Pataballa', 'VPATABAL', '590.423.4560', '1987-06-23', 'IT_PROG', '4800.00', '0.00', '103', '60'),
('107', 'Diana', 'Lorentz', 'DLORENTZ', '590.423.5567', '1987-06-24', 'IT_PROG', '4200.00', '0.00', '103', '60'),
('108', 'Nancy', 'Greenberg', 'NGREENBE', '515.124.4569', '1987-06-25', 'FI_MGR', '12000.00', '0.00', '101', '100'),
('109', 'Daniel', 'Faviet', 'DFAVIET', '515.124.4169', '1987-06-26', 'FI_ACCOUNT', '9000.00', '0.00', '108', '100'),
('110', 'John', 'Chen', 'JCHEN', '515.124.4269', '1987-06-27', 'FI_ACCOUNT', '8200.00', '0.00', '108', '100'),
('111', 'Ismael', 'Sciarra', 'ISCIARRA', '515.124.4369', '1987-06-28', 'FI_ACCOUNT', '7700.00', '0.00', '108', '100'),
('112', 'Jose Manuel', 'Urman', 'JMURMAN', '515.124.4469', '1987-06-29', 'FI_ACCOUNT', '7800.00', '0.00', '108', '100'),
('113', 'Luis', 'Popp', 'LPOPP', '515.124.4567', '1987-06-30', 'FI_ACCOUNT', '6900.00', '0.00', '108', '100'),
('114', 'Den', 'Raphaely', 'DRAPHEAL', '515.127.4561', '1987-07-01', 'PU_MAN', '11000.00', '0.00', '100', '30'),
('115', 'Alexander', 'Khoo', 'AKHOO', '515.127.4562', '1987-07-02', 'PU_CLERK', '3100.00', '0.00', '114', '30'),
('116', 'Shelli', 'Baida', 'SBAIDA', '515.127.4563', '1987-07-03', 'PU_CLERK', '2900.00', '0.00', '114', '30'),
('117', 'Sigal', 'Tobias', 'STOBIAS', '515.127.4564', '1987-07-04', 'PU_CLERK', '2800.00', '0.00', '114', '30'),
('118', 'Guy', 'Himuro', 'GHIMURO', '515.127.4565', '1987-07-05', 'PU_CLERK', '2600.00', '0.00', '114', '30'),
('119', 'Karen', 'Colmenares', 'KCOLMENA', '515.127.4566', '1987-07-06', 'PU_CLERK', '2500.00', '0.00', '114', '30'),
('120', 'Matthew', 'Weiss', 'MWEISS', '650.123.1234', '1987-07-07', 'ST_MAN', '8000.00', '0.00', '100', '50'),
('121', 'Adam', 'Fripp', 'AFRIPP', '650.123.2234', '1987-07-08', 'ST_MAN', '8200.00', '0.00', '100', '50'),
('122', 'Payam', 'Kaufling', 'PKAUFLIN', '650.123.3234', '1987-07-09', 'ST_MAN', '7900.00', '0.00', '100', '50'),
('123', 'Shanta', 'Vollman', 'SVOLLMAN', '650.123.4234', '1987-07-10', 'ST_MAN', '6500.00', '0.00', '100', '50'),
('124', 'Kevin', 'Mourgos', 'KMOURGOS', '650.123.5234', '1987-07-11', 'ST_MAN', '5800.00', '0.00', '100', '50'),
('125', 'Julia', 'Nayer', 'JNAYER', '650.124.1214', '1987-07-12', 'ST_CLERK', '3200.00', '0.00', '120', '50'),
('126', 'Irene', 'Mikkilineni', 'IMIKKILI', '650.124.1224', '1987-07-13', 'ST_CLERK', '2700.00', '0.00', '120', '50'),
('127', 'James', 'Landry', 'JLANDRY', '650.124.1334', '1987-07-14', 'ST_CLERK', '2400.00', '0.00', '120', '50'),
('128', 'Steven', 'Markle', 'SMARKLE', '650.124.1434', '1987-07-15', 'ST_CLERK', '2200.00', '0.00', '120', '50'),
('129', 'Laura', 'Bissot', 'LBISSOT', '650.124.5234', '1987-07-16', 'ST_CLERK', '3300.00', '0.00', '121', '50'),
('130', 'Mozhe', 'Atkinson', 'MATKINSO', '650.124.6234', '1987-07-17', 'ST_CLERK', '2800.00', '0.00', '121', '50'),
('131', 'James', 'Marlow', 'JAMRLOW', '650.124.7234', '1987-07-18', 'ST_CLERK', '2500.00', '0.00', '121', '50'),
('132', 'TJ', 'Olson', 'TJOLSON', '650.124.8234', '1987-07-19', 'ST_CLERK', '2100.00', '0.00', '121', '50'),
('133', 'Jason', 'Mallin', 'JMALLIN', '650.127.1934', '1987-07-20', 'ST_CLERK', '3300.00', '0.00', '122', '50'),
('134', 'Michael', 'Rogers', 'MROGERS', '650.127.1834', '1987-07-21', 'ST_CLERK', '2900.00', '0.00', '122', '50'),
('135', 'Ki', 'Gee', 'KGEE', '650.127.1734', '1987-07-22', 'ST_CLERK', '2400.00', '0.00', '122', '50'),
('136', 'Hazel', 'Philtanker', 'HPHILTAN', '650.127.1634', '1987-07-23', 'ST_CLERK', '2200.00', '0.00', '122', '50'),
('137', 'Renske', 'Ladwig', 'RLADWIG', '650.121.1234', '1987-07-24', 'ST_CLERK', '3600.00', '0.00', '123', '50'),
('138', 'Stephen', 'Stiles', 'SSTILES', '650.121.2034', '1987-07-25', 'ST_CLERK', '3200.00', '0.00', '123', '50'),
('139', 'John', 'Seo', 'JSEO', '650.121.2019', '1987-07-26', 'ST_CLERK', '2700.00', '0.00', '123', '50'),
('140', 'Joshua', 'Patel', 'JPATEL', '650.121.1834', '1987-07-27', 'ST_CLERK', '2500.00', '0.00', '123', '50'),
('141', 'Trenna', 'Rajs', 'TRAJS', '650.121.8009', '1987-07-28', 'ST_CLERK', '3500.00', '0.00', '124', '50'),
('142', 'Curtis', 'Davies', 'CDAVIES', '650.121.2994', '1987-07-29', 'ST_CLERK', '3100.00', '0.00', '124', '50'),
('143', 'Randall', 'Matos', 'RMATOS', '650.121.2874', '1987-07-30', 'ST_CLERK', '2600.00', '0.00', '124', '50'),
('144', 'Peter', 'Vargas', 'PVARGAS', '650.121.2004', '1987-07-31', 'ST_CLERK', '2500.00', '0.00', '124', '50'),
('145', 'John', 'Russell', 'JRUSSEL', '011.44.1344.429268', '1987-08-01', 'SA_MAN', '14000.00', '0.40', '100', '80'),
('146', 'Karen', 'Partners', 'KPARTNER', '011.44.1344.467268', '1987-08-02', 'SA_MAN', '13500.00', '0.30', '100', '80'),
('147', 'Alberto', 'Errazuriz', 'AERRAZUR', '011.44.1344.429278', '1987-08-03', 'SA_MAN', '12000.00', '0.30', '100', '80'),
('148', 'Gerald', 'Cambrault', 'GCAMBRAU', '011.44.1344.619268', '1987-08-04', 'SA_MAN', '11000.00', '0.30', '100', '80'),
('149', 'Eleni', 'Zlotkey', 'EZLOTKEY', '011.44.1344.429018', '1987-08-05', 'SA_MAN', '10500.00', '0.20', '100', '80'),
('150', 'Peter', 'Tucker', 'PTUCKER', '011.44.1344.129268', '1987-08-06', 'SA_REP', '10000.00', '0.30', '145', '80'),
('151', 'David', 'Bernstein', 'DBERNSTE', '011.44.1344.345268', '1987-08-07', 'SA_REP', '9500.00', '0.25', '145', '80'),
('152', 'Peter', 'Hall', 'PHALL', '011.44.1344.478968', '1987-08-08', 'SA_REP', '9000.00', '0.25', '145', '80'),
('153', 'Christopher', 'Olsen', 'COLSEN', '011.44.1344.498718', '1987-08-09', 'SA_REP', '8000.00', '0.20', '145', '80'),
('154', 'Nanette', 'Cambrault', 'NCAMBRAU', '011.44.1344.987668', '1987-08-10', 'SA_REP', '7500.00', '0.20', '145', '80'),
('155', 'Oliver', 'Tuvault', 'OTUVAULT', '011.44.1344.486508', '1987-08-11', 'SA_REP', '7000.00', '0.15', '145', '80'),
('156', 'Janette', 'King', 'JKING', '011.44.1345.429268', '1987-08-12', 'SA_REP', '10000.00', '0.35', '146', '80'),
('157', 'Patrick', 'Sully', 'PSULLY', '011.44.1345.929268', '1987-08-13', 'SA_REP', '9500.00', '0.35', '146', '80'),
('158', 'Allan', 'McEwen', 'AMCEWEN', '011.44.1345.829268', '1987-08-14', 'SA_REP', '9000.00', '0.35', '146', '80'),
('159', 'Lindsey', 'Smith', 'LSMITH', '011.44.1345.729268', '1987-08-15', 'SA_REP', '8000.00', '0.30', '146', '80'),
('160', 'Louise', 'Doran', 'LDORAN', '011.44.1345.629268', '1987-08-16', 'SA_REP', '7500.00', '0.30', '146', '80'),
('161', 'Sarath', 'Sewall', 'SSEWALL', '011.44.1345.529268', '1987-08-17', 'SA_REP', '7000.00', '0.25', '146', '80'),
('162', 'Clara', 'Vishney', 'CVISHNEY', '011.44.1346.129268', '1987-08-18', 'SA_REP', '10500.00', '0.25', '147', '80'),
('163', 'Danielle', 'Greene', 'DGREENE', '011.44.1346.229268', '1987-08-19', 'SA_REP', '9500.00', '0.15', '147', '80'),
('164', 'Mattea', 'Marvins', 'MMARVINS', '011.44.1346.329268', '1987-08-20', 'SA_REP', '7200.00', '0.10', '147', '80'),
('165', 'David', 'Lee', 'DLEE', '011.44.1346.529268', '1987-08-21', 'SA_REP', '6800.00', '0.10', '147', '80'),
('166', 'Sundar', 'Ande', 'SANDE', '011.44.1346.629268', '1987-08-22', 'SA_REP', '6400.00', '0.10', '147', '80'),
('167', 'Amit', 'Banda', 'ABANDA', '011.44.1346.729268', '1987-08-23', 'SA_REP', '6200.00', '0.10', '147', '80'),
('168', 'Lisa', 'Ozer', 'LOZER', '011.44.1343.929268', '1987-08-24', 'SA_REP', '11500.00', '0.25', '148', '80'),
('169', 'Harrison', 'Bloom', 'HBLOOM', '011.44.1343.829268', '1987-08-25', 'SA_REP', '10000.00', '0.20', '148', '80'),
('170', 'Tayler', 'Fox', 'TFOX', '011.44.1343.729268', '1987-08-26', 'SA_REP', '9600.00', '0.20', '148', '80'),
('171', 'William', 'Smith', 'WSMITH', '011.44.1343.629268', '1987-08-27', 'SA_REP', '7400.00', '0.15', '148', '80'),
('172', 'Elizabeth', 'Bates', 'EBATES', '011.44.1343.529268', '1987-08-28', 'SA_REP', '7300.00', '0.15', '148', '80'),
('173', 'Sundita', 'Kumar', 'SKUMAR', '011.44.1343.329268', '1987-08-29', 'SA_REP', '6100.00', '0.10', '148', '80'),
('174', 'Ellen', 'Abel', 'EABEL', '011.44.1644.429267', '1987-08-30', 'SA_REP', '11000.00', '0.30', '149', '80'),
('175', 'Alyssa', 'Hutton', 'AHUTTON', '011.44.1644.429266', '1987-08-31', 'SA_REP', '8800.00', '0.25', '149', '80'),
('176', 'Jonathon', 'Taylor', 'JTAYLOR', '011.44.1644.429265', '1987-09-01', 'SA_REP', '8600.00', '0.20', '149', '80'),
('177', 'Jack', 'Livingston', 'JLIVINGS', '011.44.1644.429264', '1987-09-02', 'SA_REP', '8400.00', '0.20', '149', '80'),
('178', 'Kimberely', 'Grant', 'KGRANT', '011.44.1644.429263', '1987-09-03', 'SA_REP', '7000.00', '0.15', '149', '0'),
('179', 'Charles', 'Johnson', 'CJOHNSON', '011.44.1644.429262', '1987-09-04', 'SA_REP', '6200.00', '0.10', '149', '80'),
('180', 'Winston', 'Taylor', 'WTAYLOR', '650.507.9876', '1987-09-05', 'SH_CLERK', '3200.00', '0.00', '120', '50'),
('181', 'Jean', 'Fleaur', 'JFLEAUR', '650.507.9877', '1987-09-06', 'SH_CLERK', '3100.00', '0.00', '120', '50'),
('182', 'Martha', 'Sullivan', 'MSULLIVA', '650.507.9878', '1987-09-07', 'SH_CLERK', '2500.00', '0.00', '120', '50'),
('183', 'Girard', 'Geoni', 'GGEONI', '650.507.9879', '1987-09-08', 'SH_CLERK', '2800.00', '0.00', '120', '50'),
('184', 'Nandita', 'Sarchand', 'NSARCHAN', '650.509.1876', '1987-09-09', 'SH_CLERK', '4200.00', '0.00', '121', '50'),
('185', 'Alexis', 'Bull', 'ABULL', '650.509.2876', '1987-09-10', 'SH_CLERK', '4100.00', '0.00', '121', '50'),
('186', 'Julia', 'Dellinger', 'JDELLING', '650.509.3876', '1987-09-11', 'SH_CLERK', '3400.00', '0.00', '121', '50'),
('187', 'Anthony', 'Cabrio', 'ACABRIO', '650.509.4876', '1987-09-12', 'SH_CLERK', '3000.00', '0.00', '121', '50'),
('188', 'Kelly', 'Chung', 'KCHUNG', '650.505.1876', '1987-09-13', 'SH_CLERK', '3800.00', '0.00', '122', '50'),
('189', 'Jennifer', 'Dilly', 'JDILLY', '650.505.2876', '1987-09-14', 'SH_CLERK', '3600.00', '0.00', '122', '50'),
('190', 'Timothy', 'Gates', 'TGATES', '650.505.3876', '1987-09-15', 'SH_CLERK', '2900.00', '0.00', '122', '50'),
('191', 'Randall', 'Perkins', 'RPERKINS', '650.505.4876', '1987-09-16', 'SH_CLERK', '2500.00', '0.00', '122', '50'),
('192', 'Sarah', 'Bell', 'SBELL', '650.501.1876', '1987-09-17', 'SH_CLERK', '4000.00', '0.00', '123', '50'),
('193', 'Britney', 'Everett', 'BEVERETT', '650.501.2876', '1987-09-18', 'SH_CLERK', '3900.00', '0.00', '123', '50'),
('194', 'Samuel', 'McCain', 'SMCCAIN', '650.501.3876', '1987-09-19', 'SH_CLERK', '3200.00', '0.00', '123', '50'),
('195', 'Vance', 'Jones', 'VJONES', '650.501.4876', '1987-09-20', 'SH_CLERK', '2800.00', '0.00', '123', '50'),
('196', 'Alana', 'Walsh', 'AWALSH', '650.507.9811', '1987-09-21', 'SH_CLERK', '3100.00', '0.00', '124', '50'),
('197', 'Kevin', 'Feeney', 'KFEENEY', '650.507.9822', '1987-09-22', 'SH_CLERK', '3000.00', '0.00', '124', '50'),
('198', 'Donald', 'OConnell', 'DOCONNEL', '650.507.9833', '1987-09-23', 'SH_CLERK', '2600.00', '0.00', '124', '50'),
('199', 'Douglas', 'Grant', 'DGRANT', '650.507.9844', '1987-09-24', 'SH_CLERK', '2600.00', '0.00', '124', '50'),
('200', 'Jennifer', 'Whalen', 'JWHALEN', '515.123.4444', '1987-09-25', 'AD_ASST', '4400.00', '0.00', '101', '10'),
('201', 'Michael', 'Hartstein', 'MHARTSTE', '515.123.5555', '1987-09-26', 'MK_MAN', '13000.00', '0.00', '100', '20'),
('202', 'Pat', 'Fay', 'PFAY', '603.123.6666', '1987-09-27', 'MK_REP', '6000.00', '0.00', '201', '20'),
('203', 'Susan', 'Mavris', 'SMAVRIS', '515.123.7777', '1987-09-28', 'HR_REP', '6500.00', '0.00', '101', '40'),
('204', 'Hermann', 'Baer', 'HBAER', '515.123.8888', '1987-09-29', 'PR_REP', '10000.00', '0.00', '101', '70'),
('205', 'Shelley', 'Higgins', 'SHIGGINS', '515.123.8080', '1987-09-30', 'AC_MGR', '12000.00', '0.00', '101', '110'),
('206', 'William', 'Gietz', 'WGIETZ', '515.123.8181', '1987-10-01', 'AC_ACCOUNT', '8300.00', '0.00', '205', '110');

---

CREATE TABLE hr.job_history (
  EMPLOYEE_ID decimal(6,0) NOT NULL,
  START_DATE date NOT NULL,
  END_DATE date NOT NULL,
  JOB_ID varchar(10) NOT NULL DEFAULT '',
  DEPARTMENT_ID decimal(4,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (EMPLOYEE_ID, START_DATE)
);

INSERT INTO hr.job_history (EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID, DEPARTMENT_ID) VALUES
('102', '1993-01-13', '1998-07-24', 'IT_PROG', '60'),
('101', '1989-09-21', '1993-10-27', 'AC_ACCOUNT', '110'),
('101', '1993-10-28', '1997-03-15', 'AC_MGR', '110'),
('201', '1996-02-17', '1999-12-19', 'MK_REP', '20'),
('114', '1998-03-24', '1999-12-31', 'ST_CLERK', '50'),
('122', '1999-01-01', '1999-12-31', 'ST_CLERK', '50'),
('200', '1987-09-17', '1993-06-17', 'AD_ASST', '90'),
('176', '1998-03-24', '1998-12-31', 'SA_REP', '80'),
('176', '1999-01-01', '1999-12-31', 'SA_MAN', '80'),
('200', '1994-07-01', '1998-12-31', 'AC_ACCOUNT', '90');

-------

CREATE TABLE hr.jobs (
  JOB_ID varchar(10) NOT NULL DEFAULT '',
  JOB_TITLE varchar(35) NOT NULL,
  MIN_SALARY decimal(6,0) DEFAULT NULL,
  MAX_SALARY decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (JOB_ID)
);

INSERT INTO hr.jobs (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) VALUES
('AD_PRES', 'President', '20000', '40000'),
('AD_VP', 'Administration Vice President', '15000', '30000'),
('AD_ASST', 'Administration Assistant', '3000', '6000'),
('FI_MGR', 'Finance Manager', '8200', '16000'),
('FI_ACCOUNT', 'Accountant', '4200', '9000'),
('AC_MGR', 'Accounting Manager', '8200', '16000'),
('AC_ACCOUNT', 'Public Accountant', '4200', '9000'),
('SA_MAN', 'Sales Manager', '10000', '20000'),
('SA_REP', 'Sales Representative', '6000', '12000'),
('PU_MAN', 'Purchasing Manager', '8000', '15000'),
('PU_CLERK', 'Purchasing Clerk', '2500', '5500'),
('ST_MAN', 'Stock Manager', '5500', '8500'),
('ST_CLERK', 'Stock Clerk', '2000', '5000'),
('SH_CLERK', 'Shipping Clerk', '2500', '5500'),
('IT_PROG', 'Programmer', '4000', '10000'),
('MK_MAN', 'Marketing Manager', '9000', '15000'),
('MK_REP', 'Marketing Representative', '4000', '9000'),
('HR_REP', 'Human Resources Representative', '4000', '9000'),
('PR_REP', 'Public Relations Representative', '4500', '10500');

-----

CREATE TABLE hr.locations (
  LOCATION_ID decimal(4,0) NOT NULL DEFAULT '0',
  STREET_ADDRESS varchar(40) DEFAULT NULL,
  POSTAL_CODE varchar(12) DEFAULT NULL,
  CITY varchar(30) NOT NULL,
  STATE_PROVINCE varchar(25) DEFAULT NULL,
  COUNTRY_ID varchar(2) DEFAULT NULL,
  PRIMARY KEY (LOCATION_ID)
);

INSERT INTO hr.locations (LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE, COUNTRY_ID) VALUES
('1000', '1297 Via Cola di Rie', '989', 'Roma', '', 'IT'),
('1100', '93091 Calle della Testa', '10934', 'Venice', '', 'IT'),
('1200', '2017 Shinjuku-ku', '1689', 'Tokyo', 'Tokyo Prefecture', 'JP'),
('1300', '9450 Kamiya-cho', '6823', 'Hiroshima', '', 'JP'),
('1400', '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US'),
('1500', '2011 Interiors Blvd', '99236', 'South San Francisco', 'California', 'US'),
('1600', '2007 Zagora St', '50090', 'South Brunswick', 'New Jersey', 'US'),
('1700', '2004 Charade Rd', '98199', 'Seattle', 'Washington', 'US'),
('1800', '147 Spadina Ave', 'M5V 2L7', 'Toronto', 'Ontario', 'CA'),
('1900', '6092 Boxwood St', 'YSW 9T2', 'Whitehorse', 'Yukon', 'CA'),
('2000', '40-5-12 Laogianggen', '190518', 'Beijing', '', 'CN'),
('2100', '1298 Vileparle (E)', '490231', 'Bombay', 'Maharashtra', 'IN'),
('2200', '12-98 Victoria Street', '2901', 'Sydney', 'New South Wales', 'AU'),
('2300', '198 Clementi North', '540198', 'Singapore', '', 'SG'),
('2400', '8204 Arthur St', '', 'London', '', 'UK'),
('2500', '"Magdalen Centre', ' The Oxford ', 'OX9 9ZB', 'Oxford', 'Ox'),
('2600', '9702 Chester Road', '9629850293', 'Stretford', 'Manchester', 'UK'),
('2700', 'Schwanthalerstr. 7031', '80925', 'Munich', 'Bavaria', 'DE'),
('2800', 'Rua Frei Caneca 1360', '01307-002', 'Sao Paulo', 'Sao Paulo', 'BR'),
('2900', '20 Rue des Corps-Saints', '1730', 'Geneva', 'Geneve', 'CH'),
('3000', 'Murtenstrasse 921', '3095', 'Bern', 'BE', 'CH'),
('3100', 'Pieter Breughelstraat 837', '3029SK', 'Utrecht', 'Utrecht', 'NL'),
('3200', 'Mariano Escobedo 9991', '11932', 'Mexico City', '"Distrito Federal', 'MX');

-------- ok

CREATE TABLE hr.regions (
  REGION_ID decimal(10,0) DEFAULT NULL,
  REGION_NAME varchar(25) DEFAULT NULL,
  PRIMARY KEY (REGION_ID),
  UNIQUE (REGION_NAME)
);

INSERT INTO hr.regions (REGION_ID, REGION_NAME) VALUES
('1', 'Europe\r'),
('2', 'Americas\r'),
('3', 'Asia\r'),
('4', 'Middle East and Africa\r');

--------
-- da fare, aggiungere constraints

DROP TABLE hr.locations

ALTER TABLE hr.countries
ADD FOREIGN KEY (REGION_ID) REFERENCES hr.regions(REGION_ID);

ALTER TABLE hr.locations
ADD FOREIGN KEY (COUNTRY_ID) REFERENCES hr.countries(COUNTRY_ID);




---------- Esercizi select

-- 1. Write a query to display the names (first_name, last_name) using alias name “First Name", "Last Name" from employees table

SELECT first_name as 'First Name', last_name as 'Last Name' FROM hr.employees;

-- 2. Write a query to get unique department ID from employee table.

SELECT DISTINCT DEPARTMENT_ID FROM hr.employees;

-- 3. Write a query to get all employee details from the employee table order by first name, descending.

SELECT * FROM hr.employees ORDER BY FIRST_NAME DESC;

-- 4. Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 15% of salary).

SELECT FIRST_NAME, LAST_NAME, SALARY, SALARY*0.15 AS PF FROM hr.employees;

-- 5. Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary.

SELECT EMPLOYEE_ID, (FIRST_NAME+' '+LAST_NAME) AS NAMES, SALARY FROM hr.employees ORDER BY SALARY;

-- 6. Write a query to get the total salaries payable to employees.

SELECT SUM(SALARY) FROM hr.employees;

-- 7. Write a query to get the maximum and minimum salary from employees table.

SELECT MAX(SALARY) as MASSIMO, MIN(SALARY) as MINIMO FROM hr.employees;

-- 8. Write a query to get the average salary and number of employees in the employees table.

SELECT AVG(SALARY) AS MEDIA_SALARIO, COUNT(*) AS N_DIPENDENTI FROM hr.employees;

-- 9. Write a query to get the number of employees working with the company.

SELECT COUNT(*) AS N_DIPENDENTI FROM hr.employees;

-- 10. Write a query to get the number of jobs available in the employees table.

SELECT COUNT(DISTINCT(JOB_ID)) AS N_LAVORI FROM hr.employees;

-- 11. Write a query get all first name from employees table in upper case.

SELECT UPPER(FIRST_NAME) AS NOMI FROM hr.employees;

-- 12. Write a query to get the first 3 characters of first name from employees table.

SELECT SUBSTRING(FIRST_NAME,1,3) AS NAME3 FROM hr.employees;

-- 13. Write a query to calculate 171*214+625.

SELECT 171*214+625 AS result;

-- 14. Write a query to get the names (for example Ellen Abel, Sundar Ande etc.) of all the employees from employees table.

SELECT (FIRST_NAME+' '+LAST_NAME) as NOME from hr.employees;
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) as NOME from hr.employees;

-- 15. Write a query to get first name from employees table after removing white spaces from both side.

SELECT TRIM(FIRST_NAME) FROM hr.employees;

-- 16. Write a query to get the length of the employee names (first_name, last_name) from employees table.

SELECT LEN(FIRST_NAME + LAST_NAME) AS lunghezza, (FIRST_NAME + ' ' + LAST_NAME) as nome from hr.employees;

-- 17. Write a query to check if the first_name fields of the employees table contains numbers.

SELECT * FROM hr.employees WHERE FIRST_NAME LIKE '%[0-9]%';

-- 18. Write a query to select first 10 records from a table.

SELECT TOP 10 * FROM hr.employees;

-- 19. Write a query to get monthly salary (round 2 decimal places) of each and every employee

SELECT FIRST_NAME, LAST_NAME, ROUND(SALARY/12, 2) as SALARIO FROM hr.employees;

-----------  esercizi sorting e restricting

-- 1. Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000.

SELECT FIRST_NAME, LAST_NAME, SALARY FROM hr.employees WHERE SALARY NOT BETWEEN 10000 AND 15000;

-- 2. Write a query to display the name (first_name, last_name) and department ID of all employees in departments 30 or 100 in ascending order.

SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID FROM hr.employees WHERE DEPARTMENT_ID = 30 OR DEPARTMENT_ID = 100 ORDER BY DEPARTMENT_ID;

SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID FROM hr.employees WHERE DEPARTMENT_ID IN (30,100) ORDER BY DEPARTMENT_ID;

-- 3. Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000 and are in department 30 or 100.

SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID FROM hr.employees WHERE SALARY NOT BETWEEN 10000 AND 15000 AND DEPARTMENT_ID IN (30,100);

-- 4. Write a query to display the name (first_name, last_name) and hire date for all employees who were hired in 1987.

SELECT FIRST_NAME, LAST_NAME, HIRE_DATE FROM hr.employees WHERE HIRE_DATE LIKE '1987%';

SELECT FIRST_NAME, LAST_NAME, HIRE_DATE FROM hr.employees WHERE YEAR(HIRE_DATE) LIKE '1987';

-- 5. Write a query to display the first_name of all employees who have both "b" and "c" in their first name.

SELECT FIRST_NAME FROM hr.employees WHERE FIRST_NAME LIKE '%b%' AND FIRST_NAME LIKE '%c%';

-- 6. Write a query to display the last name, job, and salary for all employees whose job is that of a Programmer or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, or $15,000.

SELECT LAST_NAME, employees.JOB_ID, SALARY, jobs.JOB_TITLE FROM hr.employees JOIN hr.jobs ON employees.JOB_ID = jobs.JOB_ID
WHERE SALARY NOT IN (4500, 10000, 15000) AND JOB_TITLE IN ('Programmer', 'Shipping Clerk');

-- 7. Write a query to display the last name of employees whose names have exactly 6 characters.

SELECT LAST_NAME FROM hr.employees WHERE LEN(LAST_NAME) = 6;

SELECT LAST_NAME FROM hr.employees WHERE LAST_NAME LIKE '______';

-- 8. Write a query to display the last name of employees having 'e' as the third character.

SELECT LAST_NAME FROM hr.employees WHERE LAST_NAME LIKE '__e%';

-- 9. Write a query to display the jobs/designations available in the employees table.

SELECT DISTINCT(jobs.JOB_TITLE) FROM hr.employees JOIN hr.jobs ON employees.JOB_ID = jobs.JOB_ID

-- 10. Write a query to display the name (first_name, last_name), salary and PF (15% of salary) of all employees.

SELECT (FIRST_NAME+' '+LAST_NAME) AS NAME, SALARY, (SALARY*.15) AS PF FROM hr.employees;

-- 11. Write a query to select all record from employees where last name in 'BLAKE', 'SCOTT', 'KING' and 'FORD'.

SELECT * FROM hr.employees WHERE LAST_NAME IN ('BLAKE','SCOTT','KING','FORD');

--------- esercizi group by e aggregate functions

-- 1. Write a query to list the number of jobs available in the employees table.

SELECT COUNT(DISTINCT(jobs.JOB_TITLE)) FROM hr.employees JOIN hr.jobs ON employees.JOB_ID = jobs.JOB_ID;

-- 2. Write a query to get the total salaries payable to employees.

SELECT SUM(SALARY) FROM hr.employees;

-- 3. Write a query to get the minimum salary from employees table.

SELECT MIN(SALARY) FROM hr.employees;

-- 4. Write a query to get the maximum salary of an employee working as a Programmer.

SELECT MAX(SALARY) FROM hr.employees JOIN hr.jobs ON employees.JOB_ID = jobs.JOB_ID WHERE JOB_TITLE = 'Programmer';

-- 5. Write a query to get the average salary and number of employees working the department 90.

SELECT AVG(SALARY), COUNT(*) FROM hr.employees WHERE DEPARTMENT_ID = 90;

-- 6. Write a query to get the highest, lowest, sum, and average salary of all employees.

SELECT MAX(SALARY), MIN(SALARY), SUM(SALARY), AVG(SALARY) FROM hr.employees;

-- 7. Write a query to get the number of employees with the same job.

SELECT COUNT(jobs.JOB_TITLE), jobs.JOB_TITLE FROM hr.employees JOIN hr.jobs ON employees.JOB_ID = jobs.JOB_ID GROUP BY JOB_TITLE; 

-- 8. Write a query to get the difference between the highest and lowest salaries.

SELECT (MAX(SALARY) - MIN(SALARY)) as diff FROM hr.employees;

-- 9. Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.

SELECT MANAGER_ID, MIN(SALARY) FROM hr.employees GROUP BY MANAGER_ID

-- 10. Write a query to get the department ID and the total salary payable in each department.

SELECT DEPARTMENT_ID, SUM(SALARY) FROM hr.employees GROUP BY DEPARTMENT_ID;

-- 11. Write a query to get the average salary for each job ID excluding programmer

SELECT jobs.JOB_TITLE, AVG(SALARY) as MEDIA FROM hr.employees JOIN hr.jobs ON employees.JOB_ID = jobs.JOB_ID GROUP BY jobs.JOB_TITLE;

-- 12. Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department ID 90 only.

SELECT JOB_ID, MAX(SALARY), MIN(SALARY), SUM(SALARY), AVG(SALARY) FROM hr.employees WHERE DEPARTMENT_ID = 90 GROUP BY JOB_ID;

-- 13. Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to $4000.

SELECT JOB_ID, MAX(SALARY) FROM hr.employees GROUP BY JOB_ID HAVING MAX(SALARY) >=4000;

-- 14. Write a query to get the average salary for all departments employing more than 10 employees.

SELECT DEPARTMENT_ID, AVG(SALARY), COUNT(*) FROM hr.employees GROUP BY DEPARTMENT_ID HAVING COUNT(*) > 10;

-------- subqueries

-- 1. Write a query to find the name (first_name, last_name) and the salary of the employees who have a higher salary than 
-- the employee whose last_name='Bull'.

SELECT FIRST_NAME, LAST_NAME, SALARY FROM hr.employees WHERE employees.SALARY > (SELECT SALARY FROM hr.employees WHERE LAST_NAME = 'Bull')

-- 2. Write a query to find the name (first_name, last_name) of all employees who works in the IT department.

SELECT FIRST_NAME, LAST_NAME FROM hr.employees JOIN hr.departments ON employees.DEPARTMENT_ID = departments.DEPARTMENT_ID WHERE departments.DEPARTMENT_NAME = 'IT';

-- 3. Write a query to find the name (first_name, last_name) of the employees who worked in a USA based department.

SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID FROM hr.employees WHERE DEPARTMENT_ID 
IN (SELECT DEPARTMENT_ID FROM hr.departments WHERE LOCATION_ID 
IN (SELECT LOCATION_ID FROM hr.locations WHERE COUNTRY_ID='US'));

-- 4. Write a query to find the name (first_name, last_name) of the employees who are managers.

SELECT FIRST_NAME, LAST_NAME FROM hr.employees WHERE EMPLOYEE_ID IN
(SELECT MANAGER_ID FROM hr.employees);

-- 5. Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary.

SELECT FIRST_NAME, LAST_NAME, SALARY FROM hr.employees WHERE SALARY > (SELECT AVG(SALARY) FROM hr.employees);

-- 6. Write a query to find the name (first_name, last_name), and salary of the employees whose salary is equal to the minimum 
-- salary for their job grade.

SELECT FIRST_NAME, LAST_NAME, SALARY FROM hr.employees WHERE SALARY = (SELECT MIN_SALARY FROM hr.jobs WHERE employees.JOB_ID = jobs.JOB_ID);

-- 7. Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the average salary 
-- and works in any of the IT departments.

SELECT FIRST_NAME, LAST_NAME, SALARY FROM hr.employees WHERE SALARY > (SELECT AVG(SALARY) FROM hr.employees JOIN hr.departments ON 
employees.DEPARTMENT_ID = departments.DEPARTMENT_ID WHERE departments.DEPARTMENT_NAME LIKE 'IT%')

-- 8. Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the earning of Mr. Bell.

SELECT FIRST_NAME, LAST_NAME, SALARY FROM hr.employees WHERE SALARY > (SELECT SALARY FROM hr.employees WHERE LAST_NAME = 'Bell')

-- 9. Write a query to find the name (first_name, last_name), and salary of the employees who earn the same salary as the minimum 
-- salary for all departments.

SELECT FIRST_NAME, LAST_NAME, SALARY FROM hr.employees WHERE SALARY = (SELECT MIN(SALARY) FROM hr.employees); 

-- 10. Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the 
-- average salary of all departments.

SELECT FIRST_NAME, LAST_NAME, SALARY FROM hr.employees WHERE SALARY > (SELECT AVG(SALARY) FROM hr.employees);

-- 11. Write a query to find the name (first_name, last_name) and salary of the employees who earn a salary that is higher than 
-- the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results of the salary of the lowest to highest.

SELECT FIRST_NAME, LAST_NAME, SALARY FROM hr.employees WHERE SALARY > (SELECT MAX(SALARY) FROM hr.employees WHERE JOB_ID = 'SH_CLERK') ORDER BY SALARY ASC;

-- 12. Write a query to find the name (first_name, last_name) of the employees who are not supervisors.

SELECT FIRST_NAME, LAST_NAME FROM hr.employees WHERE EMPLOYEE_ID NOT IN (SELECT MANAGER_ID FROM hr.employees)

-- 13. Write a query to display the employee ID, first name, last name, and department names of all employees.

SELECT employees.FIRST_NAME, employees.LAST_NAME, employees.EMPLOYEE_ID, departments.DEPARTMENT_NAME FROM hr.employees 
JOIN hr.departments ON employees.DEPARTMENT_ID = departments.DEPARTMENT_ID;

--14. Write a query to display the employee ID, first name, last name, salary of all employees whose salary is above average 
-- for their departments.


SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY FROM hr.employees AS A 
WHERE SALARY > (SELECT AVG(SALARY) FROM hr.employees WHERE DEPARTMENT_ID = A.DEPARTMENT_ID);


-- 16. Write a query to find the 5th maximum salary in the employees table.

SELECT DISTINCT(SALARY) FROM hr.employees ORDER BY SALARY DESC OFFSET 4 ROWS FETCH FIRST 1 ROWS ONLY;

-- 17. Write a query to find the 4th minimum salary in the employees table.

SELECT DISTINCT(SALARY) FROM hr.employees ORDER BY SALARY ASC OFFSET 3 ROWS FETCH FIRST 1 ROWS ONLY;

-- 18. Write a query to select last 10 records from a table.

SELECT COUNT(*) FROM hr.employees;
SELECT * FROM hr.employees ORDER BY EMPLOYEE_ID ASC OFFSET 97 ROWS;

-- 19. Write a query to list the department ID and name of all the departments where no employee is working.

SELECT DEPARTMENT_ID, DEPARTMENT_NAME FROM hr.departments WHERE DEPARTMENT_ID NOT IN (SELECT DEPARTMENT_ID FROM hr.employees)

-- 20. Write a query to get 3 maximum salaries.

SELECT TOP 3 SALARY FROM hr.employees;

-- 21. Write a query to get 3 minimum salaries.

SELECT TOP 3 SALARY FROM hr.employees ORDER BY SALARY ASC;

------------ esercizi join

-- 1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments.

SELECT departments.DEPARTMENT_NAME, locations.STREET_ADDRESS, locations.CITY, locations.STATE_PROVINCE, countries.COUNTRY_NAME
FROM hr.locations JOIN hr.departments on departments.LOCATION_ID = locations.LOCATION_ID JOIN hr.countries ON
locations.COUNTRY_ID = countries.COUNTRY_ID

-- 2. Write a query to find the name (first_name, last name), department ID and name of all the employees.

SELECT employees.FIRST_NAME, employees.LAST_NAME, employees.DEPARTMENT_ID, departments.DEPARTMENT_NAME FROM hr.employees 
JOIN hr.departments ON employees.DEPARTMENT_ID = departments.DEPARTMENT_ID

-- 3. Write a query to find the name (first_name, last_name), job, department ID and name of the employees who works in London.

SELECT employees.FIRST_NAME, employees.LAST_NAME, jobs.JOB_TITLE, employees.DEPARTMENT_ID, departments.DEPARTMENT_NAME 
FROM hr.employees JOIN hr.jobs ON employees.JOB_ID = jobs.JOB_ID JOIN hr.departments 
ON employees.DEPARTMENT_ID = departments.DEPARTMENT_ID JOIN hr.locations ON departments.LOCATION_ID = locations.LOCATION_ID 
WHERE locations.CITY = 'London'

-- 4. Write a query to find the employee id, name (last_name) along with their manager_id and name (last_name).

SELECT employees.EMPLOYEE_ID, employees.LAST_NAME, employees.MANAGER_ID, managers.LAST_NAME FROM hr.employees 
JOIN (SELECT * FROM hr.employees) AS managers ON employees.MANAGER_ID = managers.EMPLOYEE_ID

SELECT employees.EMPLOYEE_ID, employees.LAST_NAME, managers.EMPLOYEE_ID, managers.LAST_NAME FROM hr.employees 
JOIN (SELECT * FROM hr.employees) AS managers ON employees.MANAGER_ID = managers.EMPLOYEE_ID

-- 5. Write a query to find the name (first_name, last_name) and hire date of the employees who was hired after 'Jones'.

SELECT employees.FIRST_NAME, employees.LAST_NAME, employees.HIRE_DATE FROM hr.employees 
WHERE employees.HIRE_DATE > (SELECT HIRE_DATE FROM hr.employees WHERE LAST_NAME = 'Jones')

SELECT employees.FIRST_NAME, employees.LAST_NAME, employees.HIRE_DATE FROM hr.employees JOIN hr.employees as jones 
ON (jones.LAST_NAME = 'Jones') WHERE jones.HIRE_DATE < employees.HIRE_DATE;

-- 6. Write a query to get the department name and number of employees in the department.

SELECT departments.DEPARTMENT_NAME, COUNT(*) AS 'N_Employees' FROM hr.departments JOIN hr.employees 
ON employees.department_id = departments.department_id GROUP BY departments.department_id, department_name ORDER BY department_name;

-- 7. Write a query to find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90.

SELECT employees.EMPLOYEE_ID, jobs.JOB_TITLE, (job_history.END_DATE - employees.HIRE_DATE) Days 
FROM hr.employees JOIN hr.jobs ON employees.JOB_ID = jobs.JOB_ID 
JOIN hr.job_history ON employees.JOB_ID = job_history.JOB_ID

-- 8. Write a query to display the department ID and name and first name of manager.

SELECT departments.DEPARTMENT_ID, departments.DEPARTMENT_NAME, employees.LAST_NAME FROM hr.departments LEFT JOIN hr.employees 
ON departments.MANAGER_ID = employees.EMPLOYEE_ID

-- 9. Write a query to display the department name, manager name, and city.

SELECT departments.DEPARTMENT_NAME, employees.LAST_NAME, locations.CITY FROM hr.departments LEFT JOIN hr.employees 
ON departments.MANAGER_ID = employees.EMPLOYEE_ID JOIN hr.locations ON departments.LOCATION_ID = locations.LOCATION_ID

-- 10. Write a query to display the job title and average salary of employees.

SELECT AVG(employees.SALARY) as MEDIA, employees.JOB_ID FROM hr.employees GROUP BY employees.JOB_ID

---------- prove

-- viste

CREATE VIEW hr.ricchi AS
SELECT TOP 5 PERCENT employees.SALARY FROM hr.employees;

SELECT * FROM hr.ricchi;

DROP VIEW hr.ricchi;

ALTER VIEW hr.ricchi AS
SELECT TOP 10 PERCENT employees.SALARY FROM hr.employees;

SELECT * FROM hr.ricchi;

-- stored procedures

CREATE PROCEDURE mediaaa AS
BEGIN
SELECT AVG(SALARY) FROM hr.employees
END;

mediaaa
EXECUTE mediaaa

CREATE PROCEDURE stipendio @cap INT AS
BEGIN
SELECT EMPLOYEE_ID, SALARY FROM hr.employees WHERE SALARY < @CAP
END;

EXECUTE stipendio @cap=3000

-- indice

CREATE INDEX ID_EMPLOYEE_ID
ON hr.employees (EMPLOYEE_ID);

SELECT * FROM hr.employees

CREATE INDEX ID_JOB_ID
ON hr.employees (JOB_ID);

SELECT * FROM hr.employees

SELECT ID_JOB_ID FROM hr.employees

DROP INDEX ID_JOB_ID ON hr.employees;

DROP INDEX ID_JOB_ID ON hr.employees;

--  date

SELECT DAY(employees.HIRE_DATE) FROM hr.employees
SELECT MONTH(employees.HIRE_DATE) FROM hr.employees
SELECT YEAR(employees.HIRE_DATE) FROM hr.employees

SELECT DATEDIFF(DAY, employees.HIRE_DATE, employees.HIRE_DATE) FROM hr.employees
SELECT DATEDIFF(MONTH, employees.HIRE_DATE, employees.HIRE_DATE) FROM hr.employees
SELECT DATEDIFF(YEAR, employees.HIRE_DATE, employees.HIRE_DATE) FROM hr.employees

-- 

ALTER TABLE hr.employees
ADD PROVIAMO int NOT NULL IDENTITY(1,1);

SELECT * FROM hr.employees

ALTER TABLE hr.employees
DROP COLUMN PROVIAMO;

SELECT * FROM hr.employees

ALTER TABLE hr.employees
ADD PROVIAMO int NOT NULL IDENTITY(1,1);

SELECT * FROM hr.employees

-- funzioni scalari

CREATE FUNCTION hr.guadagnonetto(
  @SALARY DEC(8,2),
  @COMMISSION_PCT DEC(2,2)
)
RETURNS DEC(8,2)
AS 
BEGIN
    RETURN @SALARY * (1 - @COMMISSION_PCT);
END;

SELECT hr.guadagnonetto(1000,0.1) AS net_sale;

SELECT hr.guadagnonetto(SALARY, COMMISSION_PCT) FROM hr.employees

SELECT *, ROW_NUMBER() OVER (ORDER BY EMPLOYEE_ID) AS rn FROM hr.employees;
SELECT *, ROW_NUMBER() OVER (ORDER BY EMPLOYEE_ID) AS rn FROM hr.employees;
