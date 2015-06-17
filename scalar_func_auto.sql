SELECT 'Chapter ' || 1 || ' . . . I am born.' FROM DUAL;
SELECT SYSDATE,
      ADD_MONTHS(SYSDATE,
                 SUBSTR('plus 3 months',6,1)) PLUS_THREE
FROM
DUAL;