

# This will be Inspired by msgspec's Info Fields...

# Unlike how msgspec run/behaves
# We plan to change how it's core functionality works in the future to save memory.

# One such option would be tagged pointers
# https://coredumped.dev/2024/09/09/what-is-the-best-pointer-tagging-method/

# We may not use these yet however but that idea would increase performance at runtime.

# We also use FNV Hashing on all keys to speedup performance at runtime 
# (If were not worried about ddos attack)


cimport cython

from dataclasses import is_dataclass, dataclass



cpdef enum TN:
    TN_BOOL = 1
    TN_SINT = 2
    TN_UINT = 2
    TN_ARRAY = 3 





cdef class TypeNode:
    """A Baseline Node for carrying basic/complex type objects"""

    



