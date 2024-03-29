make_name <- function(n=20)
{
    paste0(sample(letters, n, TRUE), collapse="")
}

write_file <- function(dir, size=1000)
{
    fname <- tempfile(tmpdir=dir)
    bytes <- openssl::rand_bytes(size)
    writeBin(bytes, fname)
    basename(fname)
}

files_identical <- function(set1, set2)
{
    all(mapply(function(f1, f2)
    {
        s1 <- file.size(f1)
        s2 <- file.size(f2)
        s1 == s2 && identical(readBin(f1, "raw", s1), readBin(f2, "raw", s2))
    }, set1, set2))
}

## no longer works with testthat v3?
# # keep core count down for R CMD check
# multiupload_blob <- function(...)
# AzureStor::multiupload_blob(..., max_concurrent_transfers=2)

# multidownload_blob <- function(...)
# AzureStor::multidownload_blob(..., max_concurrent_transfers=2)

# multiupload_azure_file <- function(...)
# AzureStor::multiupload_azure_file(..., max_concurrent_transfers=2)

# multidownload_azure_file <- function(...)
# AzureStor::multidownload_azure_file(..., max_concurrent_transfers=2)

# multiupload_adls_file <- function(...)
# AzureStor::multiupload_adls_file(..., max_concurrent_transfers=2)

# multidownload_adls_file <- function(...)
# AzureStor::multidownload_adls_file(..., max_concurrent_transfers=2)

# multicopy_url_to_blob <- function(...)
# AzureStor::multicopy_url_to_blob(..., max_concurrent_transfers=2)

# multicopy_url_to_storage <- function(...)
# AzureStor::multicopy_url_to_storage(..., max_concurrent_transfers=2)

# storage_multiupload <- function(...)
# AzureStor::storage_multiupload(..., max_concurrent_transfers=2)

# storage_multidownload <- function(...)
# AzureStor::storage_multidownload(..., max_concurrent_transfers=2)

