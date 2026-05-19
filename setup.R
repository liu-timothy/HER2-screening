# setup.R

# 1. Install renv if needed
if (!require("renv", character.only = TRUE, quietly = TRUE)) {
  install.packages("renv")
}

# 2. Verify renv.lock exists BEFORE trying to restore
if (!file.exists("renv.lock")) {
  stop("No renv.lock found. Run renv::snapshot() on source machine.")
}

# 3. Restore packages from lockfile
renv::restore()