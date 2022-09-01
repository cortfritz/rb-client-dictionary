# rb-client-dictionary
rosebud dictionary take home test 

## assignment
as described by Alexandru:

> implement an in-memory dictionary database with a corresponding client. The database stores ASCII encoded english words and needs to support at least the following operations:
> - Insert a word (i.e. `$ client insert <word>` which exits with 0 to confirm the word is now present in the database).
> - Search for a word (i.e. `$ client search <word>` which exits with 0 if the word is found in the database).
> - Remove a word (i.e. `$ client remove <word>` which exits with 0 to confirm the word is no longer present in the database).
>
> The database and clients will be run on a single machine. The database needs to store up to 1 million unique words at any time and the clients should be able to run concurrently. You can use any language or libraries you want as long as I can run everything on an x86_64 Linux machine after following any setup instructions.

## approach
I'm going to use elixir and first attempt with erlang's disk based term storage, which I've never used, barring that I'll use postgres, barring that i'll use mongo.

I intend to implement the minimal solution as specified, then enhance until I'm bored or run out of reasonable alloc of time.

## log
- 2022 09 01 10:58 - got horked environment probably working: erlang, elixir, git/ssh
- 2022 09 01 11:11 - running into build issues of stub with escript.build
- 2022 09 01 11:30 - shower
- 2022 09 01 13:00 - baby time
- 2022 09 01 13:50 - first draft complete






