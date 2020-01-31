FROM node:11-alpine as builder

WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn
COPY . .
RUN yarn build

FROM nginx:1.15-alpine

COPY --from=builder /app/build /usr/share/nginx/html
EXPOSE 80
