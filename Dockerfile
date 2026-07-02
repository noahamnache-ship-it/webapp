FROM node:20-alpine
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
WORKDIR /app
COPY package*.json package-lock.json ./
RUN npm ci --ignore-scripts
COPY app.js app.test.js sonar-project.properties ./
USER appuser
CMD ["node", "app.js"]
