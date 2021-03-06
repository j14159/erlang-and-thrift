erlang-and-thrift
=================

Dirt-simple example project showing [Apache Thrift](http://thrift.apache.org/) server and client in Erlang.

# What
This is about as simple as an example project can get for using Thrift in both server- and client-side Erlang.

There are only three files that I wrote (everything else generated by Thrift) that you should care about:

* [example_service.erl](https://github.com/j14159/erlang-and-thrift/blob/master/src/example_service.erl) - the server side stuff.
* [example_client.erl](https://github.com/j14159/erlang-and-thrift/blob/master/src/example_client.erl) - the client side stuff.
* [example.thrift](https://github.com/j14159/erlang-and-thrift/blob/master/thrift/example.thrift) - the definition of the single Thrift message and service.

To compile `example.thrift`, you'll need to download the necessary binary/source/whatever from the [Thrift page](http://thrift.apache.org/).  I'm on OSX and thus used [homebrew](http://brew.sh/) to install it and this project assumes Thrift version 0.9.1.

This is nothing more than one service/function, one client function and a single unit test showing how it fits together.

# Why
I spent an embarassingly long time this morning trying to brain how this all fits together and assumed that since I had trouble finding clear and concise examples on the interwebs, others might too.  This is my minimal attempt to address that.

# How
Clone the repo and make sure you have [rebar](https://github.com/basho/rebar) installed:

    rebar get-deps compile
    rebar euint skip_deps=true

Corrections/improvements in the spirit of keeping things simple and complete most welcome.
