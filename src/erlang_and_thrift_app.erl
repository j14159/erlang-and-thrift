-module(erlang_and_thrift_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    erlang_and_thrift_sup:start_link().

stop(_State) ->
    ok.
