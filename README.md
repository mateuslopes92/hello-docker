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


## Linux Command Line
- Docker is built on basic Linux concepts

### Linux Distributions
- Ubuntu
- Debian
- Alpine (Very small)
- Fedora
- CentOS
- more and more

#### Running Linux
- We can find a distribution in https://hub.docker.com i will use ubuntu
- To install the dist we can run `docker pull ubuntu` to get the image
- But i will use `docker run ubuntu`, if have the image will use if not will pull and then run
- `docker ps` list the containers but ubuntu is stoped
- `docker ps -a` show also stoped containers
- `docker run -it ubuntu` this start the container in interact mode with the shell
- with this we are able to run Linux commands

### Package Managers
- Like we have yarn, npm, pip and so on.
- On linux we have `apt (advanced package tool)`
- As we have a fresh new ubuntu we need to update our apt package list, this also need to be done when want to install a lib to make sure apt will have it
- The command to update is `apt update`
- With this we can try install nano for example `apt install nano`
- To remove we run `apt remove nano`

### Linux File System
On linux everything is a file
On linux the folder structure is like this:
- bin -> binaries and programs
- boot -> files related to booting
- dev -> short for devices (files needed to access devices)
- etc -> short for editable techs configuration (configuration files)
- home -> home directors for users
- root -> home director for the root user, only root user can access
- lib -> library files like software files dependencies
- var -> short for variable (files which are updated frequently like log files or application data)
- proc -> files that represent running processes

### Navigating the File System
Here i will cover only few helpful commands to navigate on terminal with Linux
- `pwd` - print work directory
- `ls` - short for list(list files in current directory)
- `cd` - to change current directory
- `mkdir` - create a directory
- `touch` - create a file
- `mv` - move or rename files and directories
- `rm` to remove files or directory

