t<-proc.time() #determines the start time of code execution

#route selection with CSV listing for each subject and each task 
setwd("C:/Users/ingme/Desktop/HEART DIASES") 

#open document
documentos<-  read.csv(file="dataset_transformado_FINAL.csv", header = TRUE, sep = ";", quote="\"", dec=".", fill = TRUE);

#variable declaration that returns the created final csv
resultado<-data.frame(documentos)#creacion de data frame con los datos del csv
matriz_correlacion<-cor(resultado)
#matriz_correlacion[1,2]

#plot(resultado[,1], resultado[,2], main="Diagrama de Dispersión")
#abline(lm(resultado[,1] ~ resultado[,2]), col="red")

save(matriz_correlacion, file="matriz_correlacion.rda") #save csv in format R.
write.csv(matriz_correlacion, file="matriz_correlacion.csv") #save csv in format CSV.
mensaje<-"Dataset Creado Exitosamente"

proc.time()-t #time of finish the execution