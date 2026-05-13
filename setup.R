if (!require("renv")) install.packages("renv")
renv::restore()  # Installs everything from renv.lock

# Verify
if (!file.exists("renv.lock")) {
  stop("No renv.lock found. Run renv::snapshot() on source machine.")
}