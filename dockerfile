FROM node:20-slim

# Set working directory
WORKDIR /app

# Copy only package files and install dependencies first for caching
COPY package*.json turbo.json tsconfig.json ./

# Use production install to reduce image size, if it's a production build
RUN npm ci --only=production

# Copy the rest of the application files
COPY . .

# Ensure proper permissions
RUN chown -R node:node /app

# Use non-root user for security
USER node

# Expose port
EXPOSE 3000

# Start the application
CMD ["npm", "run", "start-user-app"]
