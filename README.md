# Openfire IM Server 4.6.0 Beta

Image based on **Linux Alpine** with **OpenJDK 8** and the 4.6.0 Beta version of **Openfire**.

It supports custom **openfire.xml** file with **<autosetup>** tag - **thanks to it manual wizard setup is no longer necessary**.

It automatically creates **admin** account with password **admin** and 3 users from **openfire.xml**.

I needed it for e2e tests using docker test containers for app from book **"Growing Object-Oriented Software, Guided by Tests"**.

# Getting started

Pull image in your host
```sh
# docker pull celebez/openfire
```
Or build your own image based in my dockerfile

```sh
# docker build -t celebez/openfire github.com/Celebes/openfire-docker
```
# Quickstart

Start Openfire in docker

```sh
docker container run -d -p 9090:9090 -p 5222:5222 -p 7777:7777 celebez/openfire -v /your-localvolume/:/var/lib/openfire
```
Access your brownser http://localhost:9090/ and follow the setup procedure to complete the installation

# References

http://www.igniterealtime.org/projects/openfire/documentation.jsp

https://github.com/gizmotronic/docker-openfire

https://github.com/igniterealtime/Openfire

https://github.com/QuantumObject/docker-openfire
