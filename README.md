# CyClass
A New Kind of dataclass Library based on the serlization of msgspec and the safety of attrs written in cython.
There's a lot of work to do and I think you're going to like this exciting python library coming soon.

## Goals with this library
- Providing a Baseclass Just like Msgspec does but with better maintainability with the use of cython
- The Ability of being able to develop extensions such as SQLAlchemy which I am already commited to just building in as a bonus.
- 
## Current Agendas
- Hunting down good C Libraries, Luckily I already plan on using yyjson for that seeing how python allocators can be used.
- Pretty much writing this whole library and giving it integrity.
- having less speghetti code than msgspec that documents straight to the point.

As of making this repo I've hit a few roadbumps that need solving 

## Updates
- I am resuming this project but it will be massively rewritten.
- `__cinit__` is python's `__new__` method (Shocking, I know...) so metaclasses can be made with high performance.
- CWPack is going to be the new json serlizer and deserlizer and I modified a few things to make it "cython-acceptable"
- Fields will be written in the same format as Msgspec only this time they are subclassable...
- CodeWriter will use aiohttp's httpwriter's implementation
- __SQLTable__ Extension is now going to be built-in with this project by checking if sqlalchemy was installed.
- `Msgspec.Struct` , `dataclass`, `attrs` (maybe), `NamedTuple` support. Which means they all get serlized.
