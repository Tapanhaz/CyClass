# cython: language_level = 3

cimport cython

from cpython.dict cimport PyDict_GetItemString
from cpython.exc cimport PyErr_Format

from dataclasses import is_dataclass
from typing import NamedTuple


# Unlike msgspec Fields are subclassable making it easier to port to other librarys
# One example is sqlalchemy,

@cython.final
@cython.internal
cdef class NoDefaultType():
    pass


NODEFAULT = NoDefaultType()


# The one concept that was kept however is that the attributes from there have been preserved
cdef class Field:
    """
    Build the same as a msgspec field but unlike msgspec Fields can be subclassed for other purposes such as 
    merging with other libraries.
    """
    cdef:
        str name
        object default
        object default_factory
    
    def __init__(self, *, default=NODEFAULT, default_factory=NODEFAULT, name = None) -> None:
        if default is not NODEFAULT and default_factory is not NODEFAULT:
            raise ValueError("default and default_factory can not be defined at the same time")
        
        self.default = default
        self.default_factory = default_factory
        self.name = name
    




# cdef class CyMemberTable:
#     """CyClass Member Table Stores Information about Fields 
#     and members and information about how the variables will get encoded..."""





cdef class CyMeta(type):
    """Inspired by msgspec.StructMeta
    A CyMeta is the interanals for making a CyClass Object.
    Unlike msgspec however, CyMeta is subclassable.
    """

    # TODO: Allow __cinit__ to override if required under a new methodname 
    # Such as __pre_new__ or __post_new__ maybe?
    
    cdef int _check_namespace(cls, dict namespaces, bint init) except -1:
        
        # NOTE: init is allowed to be overidden for use with sqlalchemy
        # However other than that make sure you know what your doing 
        # otherwise bad things can happen...

        # NOTE: We are less strict than msgspec is but    
        # We should still check to see that some of the
        # rules set are not being violated.
        
        # Did we enable init or new to be overidden?
        if init and (PyDict_GetItemString(namespaces, "__init__") != NULL):
            PyErr_Format(TypeError, "CyClass cannot define __init__ because it was set to be overwritten")
            return -1
        
        cdef const char** attrs = ["__new__", "__slots__"]
        cdef Py_ssize_t i
        for i in range(2):
            if PyDict_GetItemString(namespaces, attrs[i]) != NULL:
                PyErr_Format(TypeError, "CyClass types Cannot define %s", attrs[i])
                return -1

        return 0



            



    # @classmethod
    # def __prepare__(metacls, name, bases):
    #     return


