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

As of making this repo I've hit a few roadbumps that need solving 

## Current Issues
- MetaClasses would immeditately have performance degeradation due to `__new__` method not being usable when `cdef class` is applied
(This may require new proposals to the cython langauge itself to fix it). If I write this in C It will be very difficult to override
these previous issues/restraints. 

- I haven't found any clean ways to generate the `__init__` functions yet as attrs/msgspec are not super helpful at
explaining how dataclass creation of the init-functions exaclty work. However my research is ongoing and I haven't given up yet however
cleaner examples would be nice and helpful for me to find a correct solution

- I did attempt to bind msgspec to sqlalchemy (Maybe I'll dump this code on github somewhere else idk-yet) as a backup-plan but none of my works have been successful for that yet.
The closest I got was taking the `Meta` objects and binding sqlalchemy args to them from there the system for building a table is difficult and just leads to errors/dead-ends msgspec
is very restrictive when it comes to what methods your allowed to use.
