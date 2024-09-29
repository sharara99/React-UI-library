FROM node:18-alpine

WORKDIR /app

# Copy package.json and pnpm-lock.yaml to the container
COPY package.json pnpm-lock.yaml ./

RUN npm install -g pnpm

RUN pnpm install

# Copy all source files to the working directory
COPY . .

# Build the React UI library
RUN pnpm run build

# Build the documentation site
RUN pnpm run build:site

EXPOSE 3000

ENV PORT=3000

# Define the command to start the app
CMD ["pnpm", "start"]