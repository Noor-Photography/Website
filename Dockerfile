FROM nginx:stable-alpine

LABEL maintainer="info@arash-hatami.ir"

ARG BUILD_DATE
ARG PORT

LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name="hatamiarash7/noorphoto"
LABEL org.label-schema.description="Noor Photography Website"
LABEL org.label-schema.url="https://noor-photo.ir"
LABEL org.label-schema.vcs-url="https://github.com/Noor-Photography/Website"

COPY . /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE $PORT

CMD sed -i -e 's/$PORT/'"$PORT"'/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'