# Usar Node.js 18 Alpine para imagen más ligera
FROM node:18-alpine

# Instalar FFmpeg y otras dependencias necesarias
RUN apk add --no-cache ffmpeg python3 make g++

# Crear directorio de trabajo
WORKDIR /app

# Copiar archivos de configuración
COPY package*.json ./

# Instalar dependencias
RUN npm ci --only=production

# Copiar código fuente
COPY . .

# Crear usuario no-root por seguridad
RUN addgroup -g 1001 -S nodejs
RUN adduser -S discord -u 1001

# Cambiar propietario de archivos
RUN chown -R discord:nodejs /app
USER discord

# Exponer puerto (si necesitas webhook)
EXPOSE 3000

# Comando para ejecutar el bot
CMD ["node", "discord_music_bot.js"]