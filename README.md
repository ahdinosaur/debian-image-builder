# debian-image-builder

build Debian disk images (with Docker)

## background

i want to build a standalone Debian image for [Scuttlebutt](https://scuttlebutt.nz) pubs, which we can write to an SD card to boot local Arm Linux devices like the Raspberry Pi, as well as use as a bootable disk on a remote cloud platform.

i notice that every project that needs disk images has their own hand-rolled way to create disk images (e.g. Raspberry Pi project, BeagleBone project, etc). i also notice `vmdb2` is a re-write of `vmdebootstrap`, which is the most common way to build images. so to support my own project, i combined some learnings into a standalone script that can be used in any project, hope it's useful to someone else! :)

## example

with Docker installed:

```
git clone https://github.com/ahdinosaur/debian-image-builder
cd debian-image-builder
npm run example
```

see more example inputs in [`./examples`](./examples)

## install

```
npm install -g debian-image-builder
```

## usage

```
Usage:
  debian-image-builder [options]

  Arguments:

    --input <path>: required directory of input image spec
    --output <path>: required directory to output build results
    --name <name>: optional name of image

  Flags:

    -h, --help: show this usage
    -d, --docker: build image using docker

  Examples:

    debian-image-builder --docker --input ./examples/simple --output ./output
```

if using `--docker`, you need Docker installed.

if not using `--docker`, you need the following packages installed:

- `qemu-user-static`
- `qemu-utils`
- `dosfstools`
- `vmdb2`

## thanks

<3

- [pi-gen](https://github.com/RPi-Distro/pi-gen)
- [raspi3-image-spec](https://github.com/Debian/raspi3-image-spec)
- [vmdb2](http://git.liw.fi/vmdb2)

## license

GPL-3.0
