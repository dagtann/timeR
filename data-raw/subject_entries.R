## code to prepare `subject_entries` dataset goes here
subject_entries = list(
        `Wood Pecker` = c("foo", "bar"),
        `Lumber Jack` = c("cherry", "pie")
    )
usethis::use_data(subject_entries, overwrite = TRUE)
