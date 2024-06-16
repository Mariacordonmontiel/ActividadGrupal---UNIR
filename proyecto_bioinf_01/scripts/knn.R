# Obtener la ruta del script actual si se está ejecutando en RStudio
library(rstudioapi)
if (rstudioapi::isAvailable()) {
  script.dir <- dirname(rstudioapi::getActiveDocumentContext()$path)
  setwd(script.dir)
}