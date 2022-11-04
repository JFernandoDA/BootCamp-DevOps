# Ejercicios módulo contenedores

## Ejercicio 1

### Crear la red

```bash
docker network create lemoncode-challenge
```

### Crear el contenedor MongoDB
```bash
    docker run -d --name some-mongo -p 27017:27017 --network lemoncode-challenge -v my-data:/data/db mongo
```

### Contenedor backend
- Se cambia en el fichero backend/appsettings.json
```diff
{
  "TopicstoreDatabaseSettings": {
-   "ConnectionString": "mongodb://localhost:27017",
+   "ConnectionString": "mongodb://some-mongo:27017",
    "TopicsCollectionName": "Topics",
    "DatabaseName": "TopicstoreDb"
  },
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft": "Warning",
      "Microsoft.Hosting.Lifetime": "Information"
    }
  },
  "AllowedHosts": "*"
}
```

- Se cambia en backend/Properties/launchSettingsjson
```diff
"backend": {
      "commandName": "Project",
      "launchBrowser": true,
      "launchUrl": "weatherforecast",
-     "applicationUrl": "http://localhost:5000",
+     "applicationUrl": "http://0.0.0.0:5000",
      "environmentVariables": {
        "ASPNETCORE_ENVIRONMENT": "Development"
      }
```

- Creamos la imagen para el contenedor de backend a partir del dockerfile
```bash
    docker build . --tag backend_image
```

- Creamos dicho contenedor
```bash
    docker run -d --name topics-api --network lemoncode-challenge backend_image
```


### Contenedor frontend
- Construir la imágen a partir del dockerFile de frontEnd
  ```bash
    docker build . --tag front-end_image
  ```

- Ejecutar la imagen front-end creada en el paso anterior
  ```bash
    docker run -d -p 8080:3000 --name front-end --network lemoncode-challenge -e API_URI=http://topics-api:5000/api/topics front-end_image

  ```  


## Ejercicio 2

```yml
{
    
}
```