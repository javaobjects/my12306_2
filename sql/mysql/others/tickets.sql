
SELECT * FROM tickets_certtype;

SELECT * FROM tickets_city

SELECT * FROM tickets_province;

SELECT * FROM tickets_user;

SELECT * FROM tickets_usertype;

SELECT USERTYPE_ID,USERTYPE_CONTENT FROM tickets_usertype  WHERE  USERTYPE_ID = ?

SELECT PROVINCE_ID,PROVINCE_NUM,PROVINCE_NAME FROM tickets_province WHERE PROVINCE_NUM = ?

SELECT CERTTYPE_ID,CERTTYPE_CONTENT FROM tickets_certtype WHERE CERTTYPE_ID = ?

SELECT CITY_ID,CITY_NUM,CITY_NAME,CITY_FATHER from tickets_city where CITY_NUM=110100

SELECT PROVINCE_ID,PROVINCE_NUM,PROVINCE_NAME FROM tickets_province WHERE PROVINCE_NUM = 110000

SELECT PROVINCE_ID,PROVINCE_NUM,PROVINCE_NAME FROM tickets_province WHERE PROVINCE_NUM = ?


INSERT INTO tickets_user (
tickets_user.USER_ID,
tickets_user.USER_NAME,
tickets_user.USER_PASSWORD,
tickets_user.USER_RULE,
tickets_user.USER_REAL_NAME,
tickets_user.USER_SEX,
tickets_user.USER_CITY_ID,
tickets_user.USER_CERTTYPE_ID,
tickets_user.USER_CERT,
tickets_user.USER_BIRTHDAY,
tickets_user.USER_USERTYPE_ID,
tickets_user.USER_CONTENT,
tickets_user.USER_STATUS,
tickets_user.USER_LOGIN_IP,
tickets_user.USER_IMAGE_PATH 
)
VALUES
	(NULL,
	'xx35',
	'e10adc3949ba59abbe56e057f20f883e',
	'1',
	'涎涎',
	'1',
	'1',
	'1',
	'411506199302303215',
	'2012-02-02',
	'1',
	'测试',
	'1',
	'192.168.1.1',
	'1.png' )


	
	
UPDATE tickets_user 
SET tickets_user.USER_REAL_NAME =?,
tickets_user.USER_SEX =?,
tickets_user.USER_CITY_ID =?,
tickets_user.USER_CERTTYPE_ID =?,
tickets_user.USER_CERT =?,
tickets_user.USER_BIRTHDAY =?,
tickets_user.USER_USERTYPE_ID =?,
tickets_user.USER_CONTENT =? 
WHERE
	tickets_user.USER_ID =?

SELECT CITY_ID,CITY_NUM,CITY_NAME from tickets_city where CITY_FATHER=130000

SELECT VERSION() FROM DUAL

SELECT CITY_ID,CITY_NUM,CITY_NAME from tickets_city where CITY_FATHER=



SELECT
	USER_ID,
	USER_NAME,
	USER_PASSWORD,
	USER_RULE,
	USER_REAL_NAME,
	USER_SEX,
	USER_CITY_ID,
	USER_CERTTYPE_ID,
	USER_CERT,
	USER_BIRTHDAY,
	USER_USERTYPE_ID,
	USER_CONTENT,
	USER_STATUS,
	USER_LOGIN_IP,
	USER_IMAGE_PATH
FROM
	tickets_user
WHERE
	USER_NAME = "xx"
	AND USER_PASSWORD = "e10adc3949ba59abbe56e057f20f883e"
	
	
	
	
SELECT
	tickets_user.USER_ID,
	tickets_user.USER_NAME,
	tickets_user.USER_PASSWORD,
	tickets_user.USER_RULE,
	tickets_user.USER_REAL_NAME,
	tickets_user.USER_SEX,
	tickets_user.USER_CITY_ID,
	tickets_user.USER_CERTTYPE_ID,
	tickets_user.USER_CERT,
	tickets_user.USER_BIRTHDAY,
	tickets_user.USER_USERTYPE_ID,
	tickets_user.USER_CONTENT,
	tickets_user.USER_STATUS,
	tickets_user.USER_LOGIN_IP,
	tickets_user.USER_IMAGE_PATH,
	tickets_city.CITY_ID,
	tickets_city.CITY_NUM,
	tickets_city.CITY_NAME,
	tickets_city.CITY_FATHER,
	tickets_province.PROVINCE_ID,
	tickets_province.PROVINCE_NUM,
	tickets_province.PROVINCE_NAME,
	tickets_certtype.CERTTYPE_CONTENT,
	tickets_usertype.USERTYPE_CONTENT
FROM
	tickets_user,
	tickets_city,
	tickets_province,
	tickets_certtype,
	tickets_usertype
WHERE
	tickets_user.USER_CITY_ID = tickets_city.CITY_ID 
	AND tickets_user.USER_USERTYPE_ID = tickets_usertype.USERTYPE_ID
	AND tickets_user.USER_CERTTYPE_ID = tickets_certtype.CERTTYPE_ID
	AND tickets_city.CITY_FATHER = tickets_province.PROVINCE_NUM
	AND tickets_user.USER_NAME = "xx"
	AND tickets_user.USER_PASSWORD = "e10adc3949ba59abbe56e057f20f883e"
	

	
SELECT * FROM tickets_user;
  
SELECT
	u.USER_ID,
	u.USER_NAME,
	u.USER_SEX,
	u.USER_CERTTYPE_ID,
	u.USER_CERT,
	ct.CERTTYPE_CONTENT,
	u.USER_USERTYPE_ID,
	ut.USERTYPE_CONTENT 
FROM
	tickets_user u,
	tickets_certtype ct,
	tickets_usertype ut 
WHERE
	u.USER_CERTTYPE_ID = ct.CERTTYPE_ID 
	AND u.USER_USERTYPE_ID = ut.USERTYPE_ID 
	AND u.USER_SEX = 1 
	AND u.USER_CERTTYPE_ID = 1 
	AND u.USER_USERTYPE_ID = 1
	
UPDATE tickets_user SET USER_REAL_NAME = '涎涎' WHERE	USER_ID =1
 

