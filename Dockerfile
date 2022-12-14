FROM public.ecr.aws/lambda/nodejs:16

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./

RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 8080

ENTRYPOINT ["node"]
CMD ["index.js"]
