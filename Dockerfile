# Stage 1: Build Stage
FROM node:21-alpine AS build

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the Next.js application
RUN npm run build

# Stage 2: Production Stage
FROM node:21-alpine AS production

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy built assets from the build stage
COPY --from=build /usr/src/app/dist ./dist

# Start the Next.js application
CMD ["npm", "start"]