FROM node:16-alpine3.12 as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .
RUN npm run build

FROM nginx
# AWS elasticbeanstalk expose ports
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

# Command start nginx is default
# docker run -p 8080:80 ae45e6266a2794ddd