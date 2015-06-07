/* round */
SELECT ROUND(12.355143, 2), ROUND(259.99,-1) FROM DUAL;
SELECT ROUND(12.355143, 2), ROUND(12.355143, 3), ROUND(12.355143, -1), ROUND(512.355143, -2), ROUND(1512.355143, -3) FROM DUAL;

/* trunc */
SELECT TRUNC(12.355143, 2), TRUNC(12.355143, 3), TRUNC(12.355143, -1), TRUNC(512.355143, -2), TRUNC(1512.355143, -3) FROM DUAL;

/* remainder */
SELECT REMAINDER(9,3), REMAINDER(10,3), REMAINDER(11,3), REMAINDER(12,3) FROM DUAL;
SELECT REMAINDER(-9,3), REMAINDER(-10,3), REMAINDER(-11,3), REMAINDER(-12,3) FROM DUAL;
SELECT REMAINDER(12, 0) FROM DUAL;

/* mod */
SELECT MOD(9,3), MOD(10,3), MOD(11,3), MOD(12,3) FROM DUAL;
SELECT MOD(-9,3), MOD(-10,3), MOD(-11,3), MOD(-12, 3) FROM DUAL;
SELECT MOD(-12, 0), MOD(12,0), MOD(12, NULL) FROM DUAL;