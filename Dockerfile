#Ver versão do alpine ou mudar para outro cara.
FROM minutrade/tiny-node:14.17.5
LABEL maintainer="Minu"

COPY . /opt/application
WORKDIR /opt/application

RUN export NODE_ENV=production \
  && npm ci --production 

RUN chown node /opt/application
USER node

ENTRYPOINT ["./entrypoint.sh"]
CMD ["start"]