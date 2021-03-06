% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/blob_client_funcs.R
\name{blob_container}
\alias{blob_container}
\alias{blob_container.character}
\alias{blob_container.blob_endpoint}
\alias{print.blob_container}
\alias{list_blob_containers}
\alias{list_blob_containers.character}
\alias{list_blob_containers.blob_endpoint}
\alias{create_blob_container}
\alias{create_blob_container.character}
\alias{create_blob_container.blob_container}
\alias{create_blob_container.blob_endpoint}
\alias{delete_blob_container}
\alias{delete_blob_container.character}
\alias{delete_blob_container.blob_container}
\alias{delete_blob_container.blob_endpoint}
\title{Operations on a blob endpoint}
\usage{
blob_container(endpoint, ...)

\method{blob_container}{character}(endpoint, key = NULL, token = NULL,
  sas = NULL, api_version = getOption("azure_storage_api_version"), ...)

\method{blob_container}{blob_endpoint}(endpoint, name, ...)

\method{print}{blob_container}(x, ...)

list_blob_containers(endpoint, ...)

\method{list_blob_containers}{character}(endpoint, key = NULL,
  token = NULL, sas = NULL,
  api_version = getOption("azure_storage_api_version"), ...)

\method{list_blob_containers}{blob_endpoint}(endpoint, ...)

create_blob_container(endpoint, ...)

\method{create_blob_container}{character}(endpoint, key = NULL,
  token = NULL, sas = NULL,
  api_version = getOption("azure_storage_api_version"), ...)

\method{create_blob_container}{blob_container}(endpoint, ...)

\method{create_blob_container}{blob_endpoint}(endpoint, name,
  public_access = c("none", "blob", "container"), ...)

delete_blob_container(endpoint, ...)

\method{delete_blob_container}{character}(endpoint, key = NULL,
  token = NULL, sas = NULL,
  api_version = getOption("azure_storage_api_version"), ...)

\method{delete_blob_container}{blob_container}(endpoint, ...)

\method{delete_blob_container}{blob_endpoint}(endpoint, name, confirm = TRUE, lease = NULL, ...)
}
\arguments{
\item{endpoint}{Either a blob endpoint object as created by \link{storage_endpoint}, or a character string giving the URL of the endpoint.}

\item{...}{Further arguments passed to lower-level functions.}

\item{key, token, sas}{If an endpoint object is not supplied, authentication credentials: either an access key, an Azure Active Directory (AAD) token, or a SAS, in that order of priority. If no authentication credentials are provided, only public (anonymous) access to the share is possible.}

\item{api_version}{If an endpoint object is not supplied, the storage API version to use when interacting with the host. Currently defaults to \code{"2019-07-07"}.}

\item{name}{The name of the blob container to get, create, or delete.}

\item{x}{For the print method, a blob container object.}

\item{public_access}{For creating a container, the level of public access to allow.}

\item{confirm}{For deleting a container, whether to ask for confirmation.}

\item{lease}{For deleting a leased container, the lease ID.}
}
\value{
For \code{blob_container} and \code{create_blob_container}, an S3 object representing an existing or created container respectively.

For \code{list_blob_containers}, a list of such objects.
}
\description{
Get, list, create, or delete blob containers.
}
\details{
You can call these functions in a couple of ways: by passing the full URL of the share, or by passing the endpoint object and the name of the container as a string.

If authenticating via AAD, you can supply the token either as a string, or as an object of class AzureToken, created via \link[AzureRMR:reexports]{AzureRMR::get_azure_token}. The latter is the recommended way of doing it, as it allows for automatic refreshing of expired tokens.
}
\examples{
\dontrun{

endp <- blob_endpoint("https://mystorage.blob.core.windows.net/", key="access_key")

# list containers
list_blob_containers(endp)

# get, create, and delete a container
blob_container(endp, "mycontainer")
create_blob_container(endp, "newcontainer")
delete_blob_container(endp, "newcontainer")

# alternative way to do the same
blob_container("https://mystorage.blob.core.windows.net/mycontainer", key="access_key")
create_blob_container("https://mystorage.blob.core.windows.net/newcontainer", key="access_key")
delete_blob_container("https://mystorage.blob.core.windows.net/newcontainer", key="access_key")

# authenticating via AAD
token <- AzureRMR::get_azure_token(resource="https://storage.azure.com/",
    tenant="myaadtenant",
    app="myappid",
    password="mypassword")
blob_container("https://mystorage.blob.core.windows.net/mycontainer", token=token)

}
}
\seealso{
\link{storage_endpoint}, \link{az_storage}, \link{storage_container}
}
