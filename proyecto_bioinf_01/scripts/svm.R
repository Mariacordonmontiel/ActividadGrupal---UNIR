# Cargar las librerías necesarias
install.packages("caret")
install.packages("e1071")
install.packages("vegan")
library(caret)
library(e1071)
library(vegan)

# Establecer la semilla para reproducibilidad
set.seed(123)

# Cargar los datos de microbioma
# Para este ejemplo, vamos a simular algunos datos
# Normalmente, cargarías los datos desde un archivo con la función read.csv() o similar
# microbiome_data <- read.csv("ruta/a/tus_datos.csv")
# Simulamos una matriz de datos de microbioma con 100 muestras y 50 OTUs
n_samples <- 100
n_otus <- 50
microbiome_data <- matrix(runif(n_samples * n_otus, min = 0, max = 100), ncol = n_otus)
rownames(microbiome_data) <- paste0("Sample", 1:n_samples)
colnames(microbiome_data) <- paste0("OTU", 1:n_otus)

# Normalizar los datos de microbioma (transformación Hellinger)
hellinger_data <- decostand(microbiome_data, method = "hellinger")

# Dividir los datos en conjunto de entrenamiento y prueba
set.seed(123)  # Para reproducibilidad
trainIndex <- createDataPartition(rownames(hellinger_data), p = .8, 
                                  list = FALSE, 
                                  times = 1)
trainData <- hellinger_data[trainIndex,]
testData <- hellinger_data[-trainIndex,]

# Etiquetas de las clases (simulamos dos clases)
trainLabels <- factor(sample(c("Class1", "Class2"), nrow(trainData), replace = TRUE))
testLabels <- factor(sample(c("Class1", "Class2"), nrow(testData), replace = TRUE))

# Definir el modelo SVM
svm_model <- train(trainData, trainLabels, method = "svmLinear", tuneLength = 10)

# Predecir con el modelo SVM
predictions <- predict(svm_model, testData)

# Evaluar el modelo
confusionMatrix(predictions, testLabels)

# Guardar el modelo entrenado en un archivo
saveRDS(svm_model, "svm_model_microbiome.rds")

# Imprimir resultados
print(confusionMatrix(predictions, testLabels))
