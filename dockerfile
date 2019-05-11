#1. Define the base image
FROM node:10.5
#2. Create /app/src folder
RUN mkdir -p /app/src
#3. Copy from local files to the built image
COPY ["package.json", "package-lock.json", "./"]
#4. Run the node package manager's install command (npm)
RUN npm install
#5. Move dependencies to the stored source code folder
RUN mv node_modules /app/src
#6. cd /app/src
WORKDIR /app/src
#7. Copy source code to the built image
COPY [".", "./"]
#8. Specify that containers from built image should listen on this port
EXPOSE 4000
#9. Sepcify which command will be run on startup
CMD ["npm", "start"]