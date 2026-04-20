# Entregable Reto 1: MongoDB en Contenedor

## 1. Comandos para crear la red Docker

```bash
docker network create lemoncode-network
```

## 2. Comando para ejecutar el contenedor de MongoDB

```bash
docker run -d \
  --name mongo \
  --network lemoncode-network \
  -e MONGO_INITDB_ROOT_USERNAME=admin \
  -e MONGO_INITDB_ROOT_PASSWORD=password \
  -p 27017:27017 \
  -v mongo-data:/data/db \
  mongo:6
```

## 3. Configuración de conexión del backend a MongoDB

Archivo `.env` en `node-stack/backend/`:

```
DATABASE_URL=mongodb://admin:password@localhost:27017
DATABASE_NAME=LemoncodeCourseDb
HOST=localhost
PORT=5000
```

El backend se ejecuta localmente con:

```bash
npm install
npm start
```

## 4. Prueba REST Client - Peticiones exitosas

Output del backend durante las pruebas con `client.http`, mostrando GET, POST, PUT y DELETE funcionando correctamente:

```
══════════════════════════════════════════════════════════════════════
🍋 LEMONCODE CALENDAR - BACKEND (Node.js + Express)
══════════════════════════════════════════════════════════════════════
🔄 Conectando a MongoDB...
✅ Conexión a MongoDB exitosa
📚 Colección Classes cargada
🚀 Servidor ejecutándose en: http://localhost:5000
📚 API: http://localhost:5000/api/classes
⏰ Hora: 10/4/2026, 16:05:26
══════════════════════════════════════════════════════════════════════

📍 [16:06:10] GET /api/classes
✅ Se obtuvieron 0 clases
📍 [16:06:16] POST /api/classes
📝 Creando clase: Contenedores I
✅ Clase creada: Contenedores I
📍 [16:06:19] POST /api/classes
📝 Creando clase: Contenedores II
✅ Clase creada: Contenedores II
📍 [16:06:21] POST /api/classes
📝 Creando clase: Contenedores III
✅ Clase creada: Contenedores III
📍 [16:06:24] POST /api/classes
📝 Creando clase: Contenedores IV
✅ Clase creada: Contenedores IV
📍 [16:06:25] POST /api/classes
📝 Creando clase: Contenedores V
✅ Clase creada: Contenedores V
📍 [16:06:27] POST /api/classes
📝 Creando clase: Contenedores VI
✅ Clase creada: Contenedores VI
📍 [16:06:28] POST /api/classes
📝 Creando clase: Azure Web Services I
✅ Clase creada: Azure Web Services I
📍 [16:06:30] POST /api/classes
📝 Creando clase: Azure Web Services II
✅ Clase creada: Azure Web Services II
📍 [16:06:32] POST /api/classes
📝 Creando clase: Kubernetes AKS
✅ Clase creada: Kubernetes AKS
📍 [16:06:33] POST /api/classes
📝 Creando clase: SESIÓN IA I
✅ Clase creada: SESIÓN IA I
📍 [16:06:34] POST /api/classes
📝 Creando clase: SESIÓN IA II
✅ Clase creada: SESIÓN IA II
📍 [16:06:36] POST /api/classes
📝 Creando clase: SESIÓN IA III
✅ Clase creada: SESIÓN IA III
📍 [16:06:44] PUT /api/classes/69e632eccaaed19f83599247
📝 Actualizando clase 69e632eccaaed19f83599247
✅ Clase 69e632eccaaed19f83599247 actualizada
📍 [16:06:46] DELETE /api/classes/69e632eccaaed19f83599247
🗑️  Eliminando clase 69e632eccaaed19f83599247
✅ Clase 69e632eccaaed19f83599247 eliminada
```
