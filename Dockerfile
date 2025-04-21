# Use a small base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy rest of the app
COPY . .

# Expose port (adjust if app uses another)
EXPOSE 3000

# Start app
CMD ["npm", "start"]
