# Tcl/Tk in a Docker container
Dockerized [Tcl/Tk](https://tcl.tk) for interactive development and experiments.

*Currently beta*

## Usage

Build:
```
docker build -t vasilev/tcl-tk .
```

Run (make sure `tk-wrapper` has executable bit set):
```
./tk-wrapper
```
and then you have the shell to invoke `wish` there.

## Credits

This project is based on code from [docker-image-palemoon](https://github.com/vasilev/docker-image-palemoon). Which, in turn, is based on:

* [mdouchement/docker-zoom-us](https://github.com/mdouchement/docker-zoom-us)
* [sameersbn/docker-skype](https://github.com/sameersbn/docker-skype)
