jebediah-server
===============

Jebediah HTTP interface


### What does it do?
This is a web frontend to Jebediah. Check out https://github.com/jonasacres/jebediah for more info.

### How does it work?
Check out http://jeb.herokuapp.com to see the web interface in action. It also acts as a RESTful API:

```sh
$ curl -H "Accept: application/json" http://jeb.herokuapp.com/1234abc
{"phrase":["chipperly","divided","snake"],"hash":"1234abc"}

$ curl -H "Accept: application/json" http://jeb.herokuapp.com/rightward/succeeded/seal
{"phrase":["rightward","succeeded","seal"],"hash":"abc4321"}
```
