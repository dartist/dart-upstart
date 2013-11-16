dart-upstart
============

[Upstart](http://upstart.ubuntu.com) configuration file (my-server.conf) and setup instructions (below) for spawning a Dart server.

### Why? 

[Dart](https://www.dartlang.org) supports server-side development. See for instance [HttpServer](http://api.dartlang.org/docs/channels/stable/latest/dart_io/HttpServer.html).

Creating an [Upstart](http://upstart.ubuntu.com) config is an easy and lightweight way to spawn your server-side Dart app. It'll also respawn if necessary, e.g. in case of an uncaught exception.

There's also [mod\_dart](https://github.com/sam-mccall/mod_dart) for hosting in Apache.


### Setup instructions

* Download and unzip [Dart SDK](http://storage.googleapis.com/dart-archive/channels/stable/release/latest/editor/darteditor-linux-x64.zip):

```
wget http://storage.googleapis.com/dart-archive/channels/stable/release/latest/editor/darteditor-linux-x64.zip

unzip darteditor-linux-x64.zip

cp dart/dart-sdk/bin/dart /usr/bin
```

* Install [Upstart](http://upstart.ubuntu.com), if necessary

* Copy my-server.conf to /etc/init (edit it beforehand and make sure it points to your .dart file)

* To start the service now:

```
start my-server
```
That's it!

### Acknowledgment

Thanks to [Guy](http://stackoverflow.com/users/41576/guy) for answering my [question](http://stackoverflow.com/questions/19896836) on Stack Overflow!




