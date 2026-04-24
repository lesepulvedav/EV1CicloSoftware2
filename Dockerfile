# Usamos una imagen ligera de Node.js
FROM node:20-alpine

# Directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiamos el package.json e instalamos dependencias
COPY package*.json ./
RUN npm install

# Copiamos el resto del código
COPY . .

# Exponemos un puerto (solo como buena práctica)
EXPOSE 3000

# Comando para iniciar la app
CMD ["npm", "start"]
