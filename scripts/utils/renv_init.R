# Initialize a new R project with renv
# 
# This file will:
# 
# 1. Set up renv project infrastructure in the current directory
# 2. Discover packages that are currently being used in your project, and install them into the project library.
# 3. Create a lockfile that records the state of the project library so it can be restored by others.
# 4. Restart R (if running inside RStudio)


# disable automatic snapshots
options(renv.config.auto.snapshot = FALSE)

# Install renv if not already installed
if (!requireNamespace("renv", quietly = TRUE)) {
  install.packages("renv")
}

init(
    bare = FALSE,
    force = FALSE,
    repos = NULL,
    bioconductor = NULL, # set this to TRUE if you intend to use bioconductor packages
    load = TRUE,
    restart = interactive()
)