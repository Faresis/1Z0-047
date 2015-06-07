/* to_number */
SELECT TO_NUMBER('$17,000.23','$999,999.99'),
       TO_NUMBER('17000.23'),
       TO_NUMBER('-17,000.23','999G999D99'),
       TO_NUMBER('-17,000.23','S999G999D99'),
       TO_NUMBER('€17,000.23','L999,999.99', 'nls_currency=''€'''),
       TO_NUMBER('$17,000.23','$999G999D99'),
       TO_NUMBER('$17,000.23','$999G999D99','nls_numeric_characters=''.,'' ')
FROM
DUAL;