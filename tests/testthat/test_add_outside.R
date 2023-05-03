test_that("5 + 8 = 13", {
  expect_equal(dhc::add_outside(5), 13)
})

test_that("-17 + 8 = -9", {
  expect_equal(dhc::add_outside(-17), -9)
})

test_that("0 + 8 = 8", {
  expect_equal(dhc::add_outside(0), 8)
})

test_that("4.876 + 8 = 12.876", {
  expect_equal(dhc::add_outside(4.876), 12.876)
})

test_that("-11.778 + 8 = -3.778", {
  expect_equal(dhc::add_outside(-11.778), -3.778)
})

test_that("String input throws an error", {
  expect_error(dhc::add_outside("Hello!"))
})
