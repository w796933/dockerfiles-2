REPO    := docker.io/oszi
BASE    := fedora
TAG     := fc23
RELEASE := 23

GIT     := git
BUILD   := docker build
DTAG    := docker tag
INSPECT := docker inspect
PULL    := docker pull
PUSH    := docker push

BFLAGS  := $(if $(findstring B,$(MAKEFLAGS)),--no-cache)
HEAD    := $(shell git symbolic-ref -q --short HEAD)
