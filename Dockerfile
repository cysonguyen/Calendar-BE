FROM node:18-alpine

WORKDIR /app

# Install pnpm and pm2
RUN npm install -g pnpm pm2

# Copy package files
COPY package.json pnpm-lock.yaml ./

# Install dependencies
RUN pnpm install --frozen-lockfile

# Copy the rest of the application
COPY . .

# Expose the port the app runs on
EXPOSE 5000

# Start the application with PM2
CMD ["pm2-runtime", "start", "index.js", "--name", "backend"] 