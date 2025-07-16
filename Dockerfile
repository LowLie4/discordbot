FROM node:20

# Instala dependencias del sistema
RUN apt-get update && apt-get install -y ffmpeg python3 python3-pip curl

# Instala yt-dlp
RUN pip3 install yt-dlp

# Instalar FFmpeg y otras dependencias necesarias
RUN apk add --no-cache ffmpeg python3 make g++

# Crear directorio de trabajo
WORKDIR /app
COPY . .

# Cambiar propietario de archivos
RUN chown -R discord:nodejs /app
USER discord

# Exponer puerto (si necesitas webhook)
EXPOSE 3000
RUN npm install

CMD ["node", "discord_music_bot.js"]