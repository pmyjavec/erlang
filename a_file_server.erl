-module(a_file_server).
-export([start/1, loop/1]).
start(Dir) -> spawn(a_file_server, loop, [Dir]).
loop(Dir) ->
        receive
                {Client, list_dir} ->
                        Client ! {self(), file:list_dir(Dir)};
                {Client, {put_file, File, Contents}} ->
                        Full = filename:join(Dir, File),
                        Client ! {self(), file:write_file(Full, Contents)};
                {Client, {get_file, File}} ->
                        Full = filename:join(Dir, File),
                        Client ! {self(), file:read_file(Full)}
        end,
        loop(Dir).
