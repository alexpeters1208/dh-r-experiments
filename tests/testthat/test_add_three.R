test_that("5 + 3 = 8", {
  expect_equal(dhc::add_three(5), 8)
})

test_that("-17 + 3 = -14", {
  expect_equal(dhc::add_three(-17), -14)
})

test_that("0 + 3 = 3", {
  expect_equal(dhc::add_three(0), 3)
})

test_that("4.876 + 3 = 7.876", {
  expect_equal(dhc::add_three(4.876), 7.876)
})

test_that("-11.778 + 3 = -8.778", {
  expect_equal(dhc::add_three(-11.778), -8.778)
})

test_that("String input throws an error", {
  expect_error(dhc::add_three("Hello!"))
})
