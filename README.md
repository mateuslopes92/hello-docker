# Docker

## What is docker?
- Platform to consistently build, run and ship applications in a consistent matter(run on same way on diff machines)
- Package with defined versions
- Isolated environments

## Container vs Virtual Machine
- Container is an isolated environment for running application
    - Containers are lightweight and
    - allow running multiple apps in isolation
    - Start faster as use the OS of the host
    - Need less hardware resources
- Virtual Machine is abstraction of a machine or physical hardware (Hypervisor like Virtualbox VMware and Hyper-V for windows)
    - Slow startup

## Docker Architecture
- Use Client - Server architecture
- Uses rest api to talk with docker engine
- Containers are process and share kernel of the host

## Registry (Docker Hub)
- Is like a github to git
- All is written in the docker file
- We can push image to docker hub in the registry then we can put on any machine to run like prod or test and have same image as dev
- Have a lot of images published

## Development workflow
### Real example

Creating folder project and opening on vscode
```
mkdir hello-docker
cd hello-docker
code .
```

Creating an simple js application:
The application only have the file: app.js with the code:
```
console.log("Hello docker!");
```

Steps to deploy the program:
* Start with an OS
* Install Node
* Copy app files
* Run node app.js

We can have those instructions handled by docker :)

First we need to create a Dockerfile:
```
# using node image from alpine distribution of linux
FROM node:alpine

# using '.' will copy all the files to a new directory called /app in docker image file system
COPY . /app

# To know we are inside of app directory and we dont need to prefix the below commands with /app/app.js for example
WORKDIR /app

# CMD run a command, here is the command to node run our app
CMD node app.js

```

To package our application:
docker command: `docker`
tag: `-t`
tag-name: `hello-docker`
if inside the directory that have dockerfile use the period to reference current directory: `.`
``` docker build -t hello-docker . ```

To see the image status:
```docker image ls```

To run the application in docker:
```docker run hello-docker```
output: the console log inside app.js