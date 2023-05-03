test_that("5 + 1 = 6", {
  expect_equal(dhc::add_one(5), 6)
})

test_that("-17 + 1 = -16", {
  expect_equal(dhc::add_one(-17), -16)
})

test_that("0 + 1 = 1", {
  expect_equal(dhc::add_one(0), 1)
})

test_that("4.876 + 1 = 5.876", {
  expect_equal(dhc::add_one(4.876), 5.876)
})

test_that("-11.778 + 1 = -10.778", {
  expect_equal(dhc::add_one(-11.778), -10.778)
})

test_that("String input throws an error", {
  expect_error(dhc::add_one("Hello!"))
})
