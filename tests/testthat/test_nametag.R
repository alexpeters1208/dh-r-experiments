test_that("My nametag gives correct age in months", {
  my_nametag <- new(Nametag, name="Alex", age=24)
  expect_equal(my_nametag$get_age_in_months(), 288)
})

test_that("Nametag cannot handle int for name", {
  expect_error(my_nametag <- new(Nametag, name=33, age=24))
})

test_that("Nametag cannot handle string for age", {
  expect_error(my_nametag <- new(Nametag, name="Alex", age="24"))
})