FROM node:20-alpine

# Instala dependencias del sistema y yt-dlp (usando solo apk)
RUN apk add --no-cache ffmpeg python3 py3-pip curl py3-yt-dlp

# Crea el directorio de trabajo
WORKDIR /app

# Copia los archivos del proyecto
COPY . .

# Instala dependencias de Node.js
RUN npm install

# Exponer puerto (si lo necesitas)
EXPOSE 3000

# Comando por defecto
CMD ["node", "discord_music_bot.js"]