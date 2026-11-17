t<-proc.time() #determines the start time of code execution

#route selection with CSV listing for each subject and each task 
setwd("C:/Users/ingme/Desktop/HEART DIASES") 

#lista_archivos contains csv document information
lista_archivos<-list.files(pattern = 'csv')

#variable declaration that returns the created final csv
resultado<-data.frame()

x<-1

while(x<=length(lista_archivos)) #cycle for each row containing the ss#
{
      #open document
      documentos<-  read.csv(file=lista_archivos[x], header = FALSE, sep = ",", quote="\"", dec=".", fill = TRUE);
      y<-1
      #if the documento has more than one row
      while(y<=nrow(documentos))    
      {
        if(nrow(documentos)!= 0)
          {
            #extraccion de caracteristicas
            AGE<-documentos[y,1]
            SEXO<-documentos[y,2]
            CP<-documentos[y,3]
            trestbps<-documentos[y,4]
            chol<-documentos[y,5]
            fbs<-documentos[y,6]
            restecg<-documentos[y,7]
            thalach<-documentos[y,8]
            exang<-documentos[y,9]
            oldpeak<-documentos[y,10]
            slope<-documentos[y,11]
            ca<-documentos[y,12]
            thal<-documentos[y,13]
            num_the_predicted_attribute<-documentos[y,14]
          
            
            #create data frame
            data<-data.frame(AGE,SEXO,CP,trestbps,chol,fbs,restecg,thalach,exang,oldpeak,slope,ca,thal,num_the_predicted_attribute)
            
            #add the information in rows
            resultado<-rbind(resultado,data)
            y<-y+1
            }
      }
            
            x<-x+1 #change of rows in document ss#
        
}
    
proc.time()-t #time of finish the execution

save(resultado, file="dataset.rda") #save csv in format R.
write.csv(resultado, file="dataset.csv") #save csv in format CSV.
mensaje<-"Dataset Creado Exitosamente"

