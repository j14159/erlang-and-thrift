-ifndef(_example_types_included).
-define(_example_types_included, yeah).

%% struct message

-record(message, {id :: integer(),
                  text :: string() | binary()}).

-endif.
