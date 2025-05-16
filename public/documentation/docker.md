# docker image push to docker hub

- step1 : docker build -t --name <name> .
- step2 : docker login
- step3 : docker tag <tagname> <username>/<imagename>:<version>
- step4: docker push <username>/<imagename>:<version>