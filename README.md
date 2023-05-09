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

## Building the Deephaven C++ Library

If you're here, you might have reason to want to build Deephaven's C++ library from source. You may be able to build this library on Windows or Intel Mac (don't try ARM Mac), but I would suggest using a Linux machine. Here, I will outline the steps I took to build our C++ library.

#### 1. Getting an Ubuntu Shell via Docker

There are many options for using a Linux machine from non-Linux hardware, like local emulators, cloud-based machines, Docker images, and more. I find it easiest to use Docker to run an image of an Ubuntu instance with all of the prerequesites for building C++ already installed. This way, the Linux machine you get will be invariant to the host OS, you will be guaranteed to have the tools required to build and run Deephaven C++, and the library will be easily reproducible. Obviously, you will need Docker installed for this, and you may want some additional tooling around Docker to make life a little easier. For example, on MacOS, I'm also using Docker Desktop, and I believe other operating systems have similar tools.

1. Download the Dockerfile here (). This will build our Docker image and ensure that it contains all of the tools needed to build C++. Save it somewhere that you can easily access or remember.
2. Open the Dockerfile in a text editor of your choice.
3. Open a terminal (or command prompt on Windows) and navigate to the directory where the Dockerfile is housed.
4. There are six commented Docker commands at the top of the Dockerfile, the first two being `docker build ...` and `docker run ...`. Copy, paste, and run each of these commands in your terminal. The first command uses the Dockerfile to build an image of an Ubuntu instance with necessary C++ tooling installed, and the second command runs the image in a container on localhost and exposes it to port 2222.
5. Run the command `docker ps`, which should list the ID of the container you just created along with some other information about the container.
6. Now, we need a shell into this Docker container. This can be easily accomplished by running the third commented command in the Dockerfile `docker exec ...`, which will bring up a shell as root in the container. If you need the ability to SSH into the container for any reason (maybe you want to connect a locally-hosted IDE like CLion), then you should run the fourth and fifth commands `ssh-keygen ...` and `docker exec ...`, change the root user password, and then use the sixth command `ssh ...` to ssh into the shell as root using the password that you just set. Either way, you should now have a working Ubuntu instance running in Docker that you can use to download, build, and install the Deephaven C++ library.

#### 2. Building DH C++

1. In your new Linux shell, follow the instructions at https://github.com/deephaven/deephaven-core/tree/main/cpp-client closely. I've observed that you can skip step 2 in the beginning and come back to it later if need be - much of what happens in step 2 is redundant in the context of this document. Pay careful attention to where you create your directories in following this document. I did not want to create any new directories at the root level of my Linux instance, so I created a directory called `dh` in `/home/user` and followed these instructions from there.
