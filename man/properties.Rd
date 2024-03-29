% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/storage_properties.R
\name{get_storage_properties}
\alias{get_storage_properties}
\alias{get_storage_properties.blob_container}
\alias{get_storage_properties.file_share}
\alias{get_storage_properties.adls_filesystem}
\alias{get_adls_file_acl}
\alias{get_adls_file_status}
\title{Get storage properties for an object}
\usage{
get_storage_properties(object, ...)

\method{get_storage_properties}{blob_container}(object, blob, snapshot = NULL, version = NULL, ...)

\method{get_storage_properties}{file_share}(object, file, isdir, ...)

\method{get_storage_properties}{adls_filesystem}(object, file, ...)

get_adls_file_acl(filesystem, file)

get_adls_file_status(filesystem, file)
}
\arguments{
\item{object}{A blob container, file share, or ADLS filesystem object.}

\item{...}{For compatibility with the generic.}

\item{blob, file}{Optionally the name of an individual blob, file or directory within a container.}

\item{snapshot, version}{For the blob method of \code{get_storage_properties}, optional snapshot and version identifiers. These should be datetime strings, in the format "yyyy-mm-ddTHH:MM:SS.SSSSSSSZ". Ignored if \code{blob} is omitted.}

\item{isdir}{For the file share method, whether the \code{file} argument is a file or directory. If omitted, \code{get_storage_properties} will auto-detect the type; however this can be slow, so supply this argument if possible.}

\item{filesystem}{An ADLS filesystem.}
}
\value{
\code{get_storage_properties} returns a list describing the object properties. If the \code{blob} or \code{file} argument is present for the container methods, the properties will be for the blob/file specified. If this argument is omitted, the properties will be for the container itself.

\code{get_adls_file_acl} returns a string giving the ADLSgen2 ACL for the file.

\code{get_adls_file_status} returns a list of ADLSgen2 system properties for the file.
}
\description{
Get storage properties for an object
}
\examples{
\dontrun{

fs <- storage_container("https://mystorage.dfs.core.windows.net/myshare", key="access_key")
create_storage_dir("newdir")
storage_upload(share, "iris.csv", "newdir/iris.csv")

get_storage_properties(fs)
get_storage_properties(fs, "newdir")
get_storage_properties(fs, "newdir/iris.csv")

# these are ADLS only
get_adls_file_acl(fs, "newdir/iris.csv")
get_adls_file_status(fs, "newdir/iris.csv")

}
}
\seealso{
\link{blob_container}, \link{file_share}, \link{adls_filesystem}

\link{get_storage_metadata} for getting and setting \emph{user-defined} properties (metadata)

\link{list_blob_snapshots} to obtain the snapshots for a blob
}
