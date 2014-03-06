-module(example_client).

%% need this to get access to the records representing Thrift message
%% defined in thrift/example.thrift:
-include("example_constants.hrl").

-export([request/4]).

request(Host, Port, Id, Msg) ->
    Req = #message{id = Id, text = Msg},
    {ok, Client} = thrift_client_util:new(Host, Port, exampleService_thrift, []),

    %% "hello" function per our service definition in thrift/example.thrift:
    {ClientAgain, {ok, Response}} = thrift_client:call(Client, hello, [Req]),
    thrift_client:close(ClientAgain),
    Response.
