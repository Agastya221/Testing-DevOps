FROM node:20

WORKDIR /app

COPY package* turbo.json tsconfig.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "run" "start-user-app"]

