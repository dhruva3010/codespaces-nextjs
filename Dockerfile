# Use Node.js 20 as the base image
FROM node:20-alpine AS development

# Set the environment to development
ENV NODE_ENV=development

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json or yarn.lock
COPY package.json yarn.lock* ./

# Install dependencies
RUN yarn install --frozen-lockfile

# Copy all the project files
COPY . .

# Expose the Next.js dev server port
EXPOSE 3000

# Run the Next.js development server
CMD ["yarn", "next", "dev"]
