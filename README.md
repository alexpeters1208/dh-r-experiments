# dh-r-experiments
Place for experimenting with R package for DHC.

## Installation

First, ensure that you have R (and preferably RStudio) installed on your machine. You can find the latest installs of R at https://cran.rstudio.com,
and the latest installs of RStudio at https://posit.co/download/rstudio-desktop/.

Any installation of experimental packages should be done in virtual environments. I recommend using RStudio to create a new project and ensure that the
option to create a new virtual environment with the project is selected.

### MacOS and Linux

0. If you are on MacOS, you must have the XCode command line tools installed. You can verify by running `gcc` in a shell - if the command is not recognized,
you need to install the CLI tools. The shell will prompt you to install them if `gcc` is not recognized.
1. From the R console, install `devtools` with `install.packages("devtools")`. Then, load the package with `library(devtools)`.
2. Installing `devtools` should install `Rcpp` as a dependency, but if it does not, install `Rcpp` with `install.packages(Rcpp)`.
3. Install my package with `install_github("alexpeters1208/dh-r-experiments")`. Then, load the package with `library(dhc)`.

### Windows

0. Install RTools from https://cran.r-project.org/bin/windows/Rtools/. The version of RTools that you need depends on your version of R, but I would
install the latest version until you can determine that another version is needed.
1. In order to get R to see my RTools installation, I had to run `writeLines('PATH="${RTOOLS42_HOME}\\usr\\bin;${PATH}"', con = "~/.Renviron")`
(my RTools version is 4.2) in the R console. The appropriate path here will depend on where you've installed RTools.
2. As on MacOS and Linux, install `devtools` and `Rcpp` if it is not installed with `devtools`.
3. Install my package with `install_github("alexpeters1208/dh-r-experiments")`. Then, load the package with `library(dhc)`. If you run into trouble with
the install, R might complain that you do not have a compatible version of RTools installed. If this happens, make note of the RTools version it wants to see,
install it, repeat step 1 accordingly, and try again.
