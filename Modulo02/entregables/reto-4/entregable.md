# Entregable Reto 4: Docker Compose

## 1. Archivo compose.yml

Ubicación: `node-stack/compose.yml`

```yaml
services:

  # Base de datos MongoDB con persistencia
  mongo:
    image: mongo:6
    container_name: mongo
    networks:
      - lemoncode-network
    environment:
      MONGO_INITDB_ROOT_USERNAME: admin
      MONGO_INITDB_ROOT_PASSWORD: password
    ports:
      - "27017:27017"
    volumes:
      - mongo-data:/data/db

  # Backend Node.js conectado a MongoDB
  topics-api:
    build: ./backend
    container_name: topics-api
    networks:
      - lemoncode-network
    environment:
      DATABASE_URL: mongodb://admin:password@mongo:27017
      DATABASE_NAME: LemoncodeCourseDb
    ports:
      - "5000:5000"
    depends_on:
      - mongo

  # Frontend Node.js conectado al backend
  lemoncode-frontend:
    build: ./frontend
    container_name: lemoncode-frontend
    networks:
      - lemoncode-network
    environment:
      API_URL: http://topics-api:5000/api/classes
    ports:
      - "3000:3000"
    depends_on:
      - topics-api

networks:
  lemoncode-network:

volumes:
  mongo-data:
```

## 2. Variables de entorno

Las variables de entorno están definidas directamente en el `compose.yml` para cada servicio, por lo que no se necesita un archivo `.env` separado.

## 3. Comando para levantar la aplicación

```bash
docker compose up -d
```

## 4. Servicios corriendo y aplicación en http://localhost:3000

![Docker Compose - Servicios corriendo y aplicación](app-screenshot.png)
