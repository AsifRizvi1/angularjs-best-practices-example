# Use Node.js 18 as the base image
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy only the necessary package files to install dependencies
COPY package.json package-lock.json ./

# Clean npm cache to ensure a fresh installation
RUN npm cache clean --force

# Install dependencies without using bower and suppress peer dependency warnings
RUN npm install --legacy-peer-deps --silent

# Copy the rest of the application code
COPY . .

# Expose the port the app will run on (change this if needed)
EXPOSE 3000

# Run the application (adjust the start command based on your app)
CMD ["npm", "start"]

