REPO    := docker.io/oszi
BASE    := fedora
TAG     := fc23
RELEASE := 23

BUILD   := docker build
DTAG    := docker tag
INSPECT := docker inspect
PULL    := docker pull
PUSH    := docker push

HEAD := $(shell git symbolic-ref -q --short HEAD)
SUBMODULE := git submodule update --init --recursive --checkout
