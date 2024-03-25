FROM node:21.3.0 AS build

WORKDIR /app

COPY package.json .
COPY package-lock.json .

RUN npm install

COPY . .

# Pre-commit checks (assuming you have pre-commit hooks configured)
# Run Prettier
RUN npm run prettier
# Run ESLint
RUN npm run lint
# Run Tests
RUN npm test

RUN npm run build

FROM nginx:alpine

# Create working directory
WORKDIR /usr/share/nginx/html

COPY --from=build /app/build .

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
