FROM node:20.19.5-alpine3.22 AS build
WORKDIR /opt/server
COPY package.json .
COPY *.js .
# This may add extra cache memory
RUN npm install


FROM node:20.19.5-alpine3.22 
# Create a group and user
WORKDIR /opt/server
# RUN apk update && \
#     apk upgrade --no-cache
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop && \
    chown -R roboshop:roboshop /opt/server
EXPOSE 8080
LABEL com.project="BotMart" \
      component="catalogue" \
      createdby="KARUNAKAR" 
ENV MONGO="true"  \
    MONGO_URL="mongodb://mongodb:27017/catalogue"
COPY --from=build --chown=roboshop:roboshop /opt/server /opt/server/
USER roboshop
ENTRYPOINT ["node"]
CMD ["server.js"]
