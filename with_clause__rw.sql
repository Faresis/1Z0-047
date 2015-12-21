/* reference subqueries from up to down is not allowed */
with
  high_tests as (
    select * from test where test_id > all (select test_id from low_tests)
  ),
  low_tests as (
    select * from test where test_id < 3
  )
select * from high_tests;

/* reference subqueries from down to up is allowed */
with
  low_tests as (
    select * from test where test_id < 3
  ),
  high_tests as (
    select * from test where test_id > all (select test_id from low_tests)
  )
select * from high_tests;