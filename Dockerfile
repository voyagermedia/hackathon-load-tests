FROM node:5.7.1

RUN npm install -g artillery
ADD ./run_artillery.sh /bin/
ADD ./vmLoadTestScript.json /tmp/

VOLUME /artillery
WORKDIR /artillery

ENTRYPOINT ["/bin/run_artillery.sh"]
