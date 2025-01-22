# cython: language_level = 3

cimport cython
from types import GenericAlias
from cpython.object cimport PyCallable_Check, PyObject
from cpython.unicode cimport PyUnicode_Check
from cpython.dict cimport PyDict_Check
from cpython.exc cimport PyErr_NoMemory
from cpython.mem cimport PyMem_Malloc, PyMem_Realloc, PyMem_Free


@cython.internal
cdef class _MISSING:
    pass

cdef MISSING = _MISSING



# Based off msgspec's field implementation as a cython object
# However one addition I am making is adding in the ability
# To add metadata to the object so that tools such as sqlalchemy 
# can be embedded with CyClass. 

# In Fact I will be taking some snippets from from Msgspec's C code. 
# So I want to give a shoutout to the devs over there for 
# inspiring me to attempt to use some of their designs here.

# This was something I was hoping to accomplish in 2025 - Vizonex


# The Differences with msgspec fields vs ours
# 1. written in Cython and not in C For a reason which was for making this code easy as possible to maintain
# 2. metadata variable was added to allow for other features to be added onto the fields for friendlier 
#    customization this lack of customization as well as ease of mergability within msgspec kinda pissed me off.

# 3. To use metadata direcly, I added in a new protocol which is called
# __post_new__(cls, ...) To Allow you to make custom classes at your own discreation.

# I give you these features if or incase you wanted to get more creative than me.


# For Some Dammed Reason, Cython will soon not allow __new__ as a method in the future so we need to stick 
# with __cinit__ and __init_subclass__ for now but my idea of a __post_creation__ protocol will not die... 
# https://stackoverflow.com/questions/75608936/subclassing-int-in-a-cython-extension-type-using-new

# I may need to throw an issue with the Cython devs about some of this...


cdef class Field:
    cdef:
        object default
        object factory
        object name # in typing this will be Optional[str] or str | None
        readonly object metadata # To allow/enable customization of inits such as merging with sqlalchemy

    def __cinit__(
        self, 
        object default = MISSING, 
        object factory = MISSING, 
        object name = None,
        object metadata = None
        ):

        if default != MISSING and factory != MISSING:
            raise TypeError("Cannot set both `default` and `factory`")

        if factory and not PyCallable_Check(factory):
            raise TypeError("`factory` must be callable")

        if (metadata is not None) and not PyDict_Check(metadata):
            raise TypeError("`metadata` must be a dictionary")

        self.default = default
        self.factory = factory
        self.name = name
        self.metadata = metadata





cdef class BaseClass:
    """A BaseClass for writing New Structures with"""
    cdef:
        dict __dataclass_fields__ 

    def __init_subclass__(cls) -> None:
        pass



