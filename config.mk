REPO    := docker.io/oszi
BASE    := fedora
RELEASE := 23
DIST    := fc$(RELEASE)

VARS    := REPO BASE RELEASE DIST
DOCKER  := docker
GIT     := git
SED     := sed

BFLAGS  := $(if $(findstring B,$(MAKEFLAGS)),--no-cache)
HEAD    := $(shell $(GIT) symbolic-ref --short HEAD)
SEDVARS  = $(SED) '$(foreach x,$(VARS),s!$${$(x)}!$($(x))!g;)'
