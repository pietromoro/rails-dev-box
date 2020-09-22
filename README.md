# A docker machine designed for Ruby on Rails Core development

This project is inspired from the official rails-dev-box, but revisited as
a docker app.

Automatically set up a development environment for working with Ruby on Rails
itself. You can use this docker to work on pull requests with everything ready
for hacking and testing and running your tests suits.

## Usage
Setup the development environment:
```
$ rake setup
```

Then you can run test:
```
$ rake test
```
Or to specifically run test for (e.g.) activestorage:
```
$ rake test -s activestorage
```

Then when you are done you can:
```
$ rake teardown
```
