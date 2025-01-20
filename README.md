# CyClass
A New Kind of dataclass Library based on the serlization of msgspec and the safety of attrs written in cython.
There's a lot of work to do and I think you're going to like this exciting python library coming soon.

## Goals with this library
- Providing a Baseclass Just like Msgspec does but with better maintainability with the use of cython
- using yyjson to serlize CyClass dataclasses and it's feilds with a fast and memory-safe approch
  to compete with pydantic and orjson.
- Providing ways to bind sqlalchemy and CyClass together.
- Unlike Msgspec, Fields can be (maybe subclassable) and easy to build off of so that sqlalchemy can be easily binded.
- Providing C Libraries to serlize dataclass to different file formats such as csv, json, yaml, toml that all get written as bytes objects.

## Current Agendas
- Hunting down good C Libraries, Luckily I already plan on using yyjson for that seeing how python allocators can be used.
- Pretty much writing this whole library and giving it integrity.
- having less speghetti code than msgspec that documents straight to the point.
