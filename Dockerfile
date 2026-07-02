FROM node:20-alpine
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
WORKDIR /app
COPY package*.json ./
RUN npm install --ignore-scripts
COPY app.js ./
COPY app.test.js ./
COPY sonar-project.properties ./
USER appuser
CMD ["node", "app.js"]
