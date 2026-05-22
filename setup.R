# setup.R - Run this first to configure the environment
setup_environment <- function() {
  
  # Load required R packages
  required_packages <- c("reticulate", "Seurat", "tidyverse", "here", "sceasy")
  
  # Install missing R packages
  for (pkg in required_packages) {
    if (!require(pkg, character.only = TRUE, quietly = TRUE)) {
      install.packages(pkg)
      library(pkg, character.only = TRUE)
    }
  }
  
  # Setup Python environment
  setup_python()
}

setup_python <- function() {
  # Check if anndata is available
  anndata_available <- tryCatch({
    reticulate::py_module_available("anndata")
  }, error = function(e) FALSE)
  
  if (!anndata_available) {
    message("Setting up Python environment with anndata...")
    
    # Option 1: Use reticulate's automatic installation (simplest)
    reticulate::py_install("anndata", pip = TRUE)
    
    # Option 2: Install with conda (more stable for complex dependencies)
    # Uncomment if Option 1 doesn't work well
    # reticulate::conda_create("seurat_env", packages = "python=3.10")
    # reticulate::conda_install("seurat_env", c("anndata", "scanpy"), channel = "conda-forge")
    # reticulate::use_condaenv("seurat_env", required = TRUE)
    
    message("Python environment setup complete!")
  } else {
    message("anndata is already available")
  }
}

# Run setup
setup_environment()