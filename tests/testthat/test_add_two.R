test_that("5 + 2 = 7", {
  expect_equal(dhc::add_two(5), 7)
})

test_that("-17 + 2 = -15", {
  expect_equal(dhc::add_two(-17), -15)
})

test_that("0 + 2 = 2", {
  expect_equal(dhc::add_two(0), 2)
})

test_that("4.876 + 2 = 6.876", {
  expect_equal(dhc::add_two(4.876), 6.876)
})

test_that("-11.778 + 2 = -9.778", {
  expect_equal(dhc::add_two(-11.778), -9.778)
})

test_that("String input throws an error", {
  expect_error(dhc::add_two("Hello!"))
})
