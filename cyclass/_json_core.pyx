# cython: language_level = 3
from cpython.mem cimport PyMem_RawFree, PyMem_RawRealloc, PyMem_RawMalloc
cimport yyjson
cimport cython




cdef void* __yymalloc(void* ctx, size_t size):
    return PyMem_RawMalloc(size)

cdef void* __yyrealloc(void* ctx, void* ptr, size_t old_size, size_t size):
    return PyMem_RawRealloc(ptr, size)

cdef void __yyfree(void* ctx, void* ptr):
    return PyMem_RawFree(ptr)



# @cython.no_gc_clear(True)
# cdef class JsonEncoder:
#     """simillar to msgspec's encoder tool made with yyjson"""
#     cdef:
#         yyjson.yyjson_alc alc
#         yyjson.yyjson_mut_doc* doc
#         yyjson.yyjson_mut_val* root

#     # TODO: Custom yyjson flags simillar to one of my older libraries maybe?

#     def __cinit__(self, yyjson.yyjson_write_flag flags):
#         # Use Python's Allocators so that memory can be shared safely...
#         self.alc.malloc = __yymalloc
#         self.alc.realloc = __yyrealloc
#         self.alc.free = __yyfree
#         self.alc.ctx = NULL

#         self.doc = yyjson.yyjson_mut_doc_new(self.alc)
#         if self.doc == NULL:
#             raise MemoryError
#         yyjson.yyjson_mut_write_opts(self.doc, flags, &self.alc, )
#         yyjson.yyjson_mut_doc_set_root(self.doc , self.root)

#     def __dealloc__(self):
#         if self.doc != NULL:
#             yyjson.yyjson_doc_free(self.doc)

#     cdef bint __write_bool(self,const char* key, bint v):
#         return yyjson.yyjson_mut_obj_add_bool(self.doc, self.root, key, v)
    
#     cdef bint __write_none(self, const char* key):
#         return yyjson.yyjson_mut_obj_add_null(self.doc, self.root, key)
    
#     cdef bint __write_float(self, const char* key):
#         pass
    

