FROM node:20

# Instala dependencias del sistema
RUN apt-get update && apt-get install -y ffmpeg python3 python3-pip curl

# Instala yt-dlp
RUN pip3 install yt-dlp

WORKDIR /app
COPY . .

RUN npm install

CMD ["node", "discord_music_bot.js"]