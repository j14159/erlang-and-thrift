-module(example_service).

%% Thrift needs this for the message types:
-include("exampleService_thrift.hrl").

%% Just for tests:
-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

-export([
         start/1,  % I use this to start the Thrift service
         stop/1,   % Should be obvious from above
         handle_function/2  % Erlang Thrift will call this with new messages.
        ]).

start(Port) ->
    thrift_socket_server:start([{handler, ?MODULE},  % this module
                                {port, Port},
                                {service, exampleService_thrift},  % as generated from thrift/example.thrift
                                {name, exampleService_thrift}]).

stop(Server) ->
    thrift_socket_server:stop(Server).

handle_function(hello, {TheMessageRecord}) ->
    %% unpack these or not, whatever.  Point is it's a record:
    _Id = TheMessageRecord#message.id,
    _Msg = TheMessageRecord#message.text,

    %% at this point you probably want to talk to a pool of gen_servers
    %% or something like that.

    %% send a reply per the service definition in thrift/example.thrift:
    {reply, #message{id = 1, text = <<"Thanks!">>}}.

-ifdef(TEST).

simple_test() ->
    {ok, Server} = start(9000),
    Res = example_client:request("localhost", 9000, 12345, <<"Hello, service">>),
    stop(Server),
    ?assert(Res#message.text =:= <<"Thanks!">>).

-endif.
        
