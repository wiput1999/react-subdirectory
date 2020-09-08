FROM node:alpine as build
WORKDIR /app
COPY package.json .
COPY yarn.lock .
RUN yarn
COPY . .
RUN yarn build

FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html/ui
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf.template /etc/nginx/conf.d

CMD /bin/sh -c "envsubst '\$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'