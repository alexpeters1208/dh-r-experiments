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

## Building the Arrow C++ Library

If you're here, you might have reason to want to build Arrow's C++ library from source. You may be able to build this library on Windows or Intel Mac (don't try ARM Mac),
but I would suggest using a Linux machine for this task. Of course, how you do so is up to you, but I've found it easiest to run the relevant VSCode project in a Docker container running an Ubuntu image. You can find the Docker file I used at https://github.com/JetBrains/clion-remote/blob/master/Dockerfile.remote-cpp-env (this is from CLion, but their IDE gave me problems and the docker image it builds is independent of CLion), and the walkthrough for running VSCode in Docker containers at https://code.visualstudio.com/docs/devcontainers/containers. Once you've decided on and set up a dev environment, you can build Arrow's C++ library as follows:

1. Follow the instructions outlined here: https://arrow.apache.org/docs/developers/cpp/building.html. I used the `ninja-release` build preset, but you can use whichever you see fit.

    * You may have to set `-DARROW_CUDA=OFF`, as I had to do when I was working on Mac, but this problem did not resurface on Linux.
    * If you run into errors that start to look like (paraphrasing) `utf8proc not found - require at least version 2.2.0 but found UTF8PROC-NOTFOUND`, this is bad news. Fixing this on Mac required installing the relevant package via `brew`, finding the install path for the package, finding the relevant `PKG_LIB` and `PKG_INCLUDE_DIR` variables in the `arrow/cpp/build/CMakeCache.txt` file, and changing them from `PKG_NOTFOUND` to the filepaths containing the package's `.dynlib` file and `include` directory, respectively. You then have to do this for every missing package. This is painful and I would not recommend it. I did not have to do this in the Linux container.
2. Once you get the library built, there are a few extra things you need to do to actually run code. If you're in VSCode, navigate to `.vscode/tasks.json` and change
  ```
  "args": [
      "-fdiagnostics-color=always",
      "-g",
      "${file}",
      "-o",
      "${fileDirname}/${fileBasenameNoExtension}"
  ],
  ```

  to 

  ```
  "args": [
      "-fdiagnostics-color=always",
      "-I${workspaceFolder}/arrow/cpp/src",
      "-std=c++17",
      "-g",
      "${file}",
      "-o",
      "${fileDirname}/${fileBasenameNoExtension}"
  ],
  ```
This does two things. First, `"-I${workspaceFolder}/arrow/cpp/src"` tells the compiler to consider `${workspaceFolder}/arrow/cpp/src` a valid pathway for header files, and enables the project to reference that directory for header file inclusion without needing the full path name. This is important, because the many hundreds of C++ files in this library use header files defined in this directory. It seems like you can change this in the C/C++ extension configuration file, but the path you add there does not actually get passed to the compiler, so it has no real effect. Second, `-std=c++17` tells the compiler to compile with a C++17 standard, which is what this library is written in.
  
3. Next (this is a weird one), you need to change every instance of `#include "arrow/util/config.h"` in the entire project to `#include "arrow/config.h"`. The `config.h` file got moved out of the `util` directory, but none of the `#include` references were updated. I worry this would also be required for many other such header files that are sitting in `arrow/` that may have been moved from `arrow/dir`, but the code I ran only depended on `config.h`, so that's the only one I saw problems with.
