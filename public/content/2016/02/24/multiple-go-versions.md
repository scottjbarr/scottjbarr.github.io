+++
Categories = ["Development", "GoLang"]
Description = ""
Tags = ["Development", "Go", "Golang"]
date = "2016-02-25T00:11:26+10:00"
menu = "main"
title = "Multiple Go Versions"
+++

Running multiple versions of Go is simple. I see and hear chatter
about it, and there are a few tools around to handle it for you, but
it is so simple to do yourself that I'm surprised people reach for a
tool to do this for them.

Mostly I run the latest stable version of Go, but for whatever reason
(maybe I want to test out a release candidate), I do have multiple
versions installed, and I don't want multiple installations to clobber
each other.

The following assumes you're on some kind of *nix system, and you're
using Bash. Other OS'es and shells will be able to work as well with
appropriate changes.

I like to keep my Go installations under `~/.go/versions`. You can
choose any location you like though.

```
mkdir -p ~/.go/versions
```

Let's grab the latest version of Go (currently 1.6). I'm downloading
the OS X archive here, but if you're running another OS you would
download the appropriate archive. Take a look at the Go
[Downloads](https://golang.org/dl/) page.

```
cd ~/.go/versions
wget https://storage.googleapis.com/golang/go1.6.darwin-amd64.tar.gz
tar -zxf go1.6.darwin-amd64.tar.gz
mv go go1.6
rm go1.6.darwin-amd64.tar.gz
```

Add the following environment variables to your `~/.bash_profile`.

```
export GOPATH=~/p/go
export GOROOT=~/.go/versions/go1.6
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH
```

This is where I set my default version of Go.

__Note__ : `GOPATH` is where your Go projects will live, and `GOROOT`
is where the Go installation lives. Don't confuse the two.

Start a new shell and you should have `go` on your path.

```
$ go version
go version go1.6 darwin/amd64
```

Success!

So for whatever reason I also want an older version of Go installed.

```
cd ~/.go/versions
wget https://storage.googleapis.com/golang/go1.5.3.darwin-amd64.tar.gz
tar -zxf go1.5.3.darwin-amd64.tar.gz
mv go go1.5.3
```

Too easy. You must be getting bored.

Now I can temporarily switch to the another version by exporting the
desired `GOROOT` and prefixing my current `$PATH` with `$GOROOT/bin`. In this case I am switching to the freshly installed GO 1.5.3.

```
$ export GOROOT=~/.go/versions/go1.5.3
$ export PATH=$GOROOT/bin:$PATH
$ go version
go version go1.5.3 darwin/amd64
```

![Great Success!](/images/great-success.jpg)
