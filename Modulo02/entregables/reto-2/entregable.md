# Entregable Reto 2: Dockerizar el Backend

## 1. Dockerfile del backend

Ubicación: `node-stack/backend/Dockerfile`

```dockerfile
FROM node:20-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install --omit=dev

COPY app.js .

EXPOSE 5000

CMD ["node", "app.js"]
```

## 2. Comando para construir la imagen

```bash
docker build -t topics-api .
```

## 3. Comando para ejecutar el contenedor del backend

```bash
docker run -d \
  --name topics-api \
  --network lemoncode-network \
  -e DATABASE_URL=mongodb://admin:password@mongo:27017 \
  -e DATABASE_NAME=LemoncodeCourseDb \
  -p 5000:5000 \
  topics-api
```

## 4. Prueba REST Client - API responde correctamente

Output del contenedor obtenido con `docker logs topics-api`, mostrando conexión a MongoDB y CRUD funcionando:

```
══════════════════════════════════════════════════════════════════════
🍋 LEMONCODE CALENDAR - BACKEND (Node.js + Express)
══════════════════════════════════════════════════════════════════════
🔄 Conectando a MongoDB...
✅ Conexión a MongoDB exitosa
📚 Colección Classes cargada
🚀 Servidor ejecutándose en: http://localhost:5000
📚 API: http://localhost:5000/api/classes
⏰ Hora: 20/4/2026, 14:28:18
══════════════════════════════════════════════════════════════════════

📍 [14:29:30] GET /api/classes
✅ Se obtuvieron 11 clases
📍 [14:29:45] POST /api/classes
📝 Creando clase: Contenedores I
✅ Clase creada: Contenedores I
📍 [14:29:46] POST /api/classes
📝 Creando clase: Contenedores II
✅ Clase creada: Contenedores II
📍 [14:29:48] POST /api/classes
📝 Creando clase: Contenedores III
✅ Clase creada: Contenedores III
📍 [14:29:49] POST /api/classes
📝 Creando clase: Contenedores IV
✅ Clase creada: Contenedores IV
📍 [14:29:51] POST /api/classes
📝 Creando clase: Contenedores V
✅ Clase creada: Contenedores V
📍 [14:29:52] POST /api/classes
📝 Creando clase: Contenedores VI
✅ Clase creada: Contenedores VI
📍 [14:29:54] POST /api/classes
📝 Creando clase: Azure Web Services I
✅ Clase creada: Azure Web Services I
📍 [14:29:55] POST /api/classes
📝 Creando clase: Azure Web Services II
✅ Clase creada: Azure Web Services II
📍 [14:29:56] POST /api/classes
📝 Creando clase: Kubernetes AKS
✅ Clase creada: Kubernetes AKS
📍 [14:29:58] POST /api/classes
📝 Creando clase: SESIÓN IA I
✅ Clase creada: SESIÓN IA I
📍 [14:29:59] POST /api/classes
📝 Creando clase: SESIÓN IA II
✅ Clase creada: SESIÓN IA II
📍 [14:30:01] POST /api/classes
📝 Creando clase: SESIÓN IA III
✅ Clase creada: SESIÓN IA III
📍 [14:30:07] PUT /api/classes/69e638694a2ffac26ac372ab
📝 Actualizando clase 69e638694a2ffac26ac372ab
✅ Clase 69e638694a2ffac26ac372ab actualizada
📍 [14:30:08] DELETE /api/classes/69e638694a2ffac26ac372ab
🗑️  Eliminando clase 69e638694a2ffac26ac372ab
✅ Clase 69e638694a2ffac26ac372ab eliminada
```
