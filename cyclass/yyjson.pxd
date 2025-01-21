from libc.stdint cimport int16_t as int16_t
from libc.stdint cimport int32_t as int32_t
from libc.stdint cimport int64_t as int64_t
from libc.stdint cimport int8_t as int8_t
from libc.stdint cimport uint16_t as uint16_t
from libc.stdint cimport uint32_t as uint32_t
from libc.stdint cimport uint64_t as uint64_t
from libc.stdint cimport uint8_t as uint8_t
from libc.stdio cimport FILE as FILE

cdef extern from "cyclass/yyjson/yyjson.h":
    uint32_t yyjson_version()
    ctypedef uint8_t yyjson_type
    ctypedef uint8_t yyjson_subtype
    struct yyjson_alc:
        void* (*malloc)(void*, size_t)
        void* (*realloc)(void*, void*, size_t, size_t)
        void (*free)(void*, void*)
        void* ctx
    ctypedef yyjson_alc yyjson_alc
    bint yyjson_alc_pool_init(yyjson_alc*, void*, size_t)
    yyjson_alc* yyjson_alc_dyn_new()
    void yyjson_alc_dyn_free(yyjson_alc*)
    ctypedef yyjson_doc yyjson_doc
    ctypedef yyjson_val yyjson_val
    ctypedef yyjson_mut_doc yyjson_mut_doc
    ctypedef yyjson_mut_val yyjson_mut_val
    ctypedef uint32_t yyjson_read_flag
    yyjson_read_flag YYJSON_READ_NOFLAG
    yyjson_read_flag YYJSON_READ_INSITU
    yyjson_read_flag YYJSON_READ_STOP_WHEN_DONE
    yyjson_read_flag YYJSON_READ_ALLOW_TRAILING_COMMAS
    yyjson_read_flag YYJSON_READ_ALLOW_COMMENTS
    yyjson_read_flag YYJSON_READ_ALLOW_INF_AND_NAN
    yyjson_read_flag YYJSON_READ_NUMBER_AS_RAW
    yyjson_read_flag YYJSON_READ_ALLOW_INVALID_UNICODE
    yyjson_read_flag YYJSON_READ_BIGNUM_AS_RAW
    ctypedef uint32_t yyjson_read_code
    yyjson_read_code YYJSON_READ_SUCCESS
    yyjson_read_code YYJSON_READ_ERROR_INVALID_PARAMETER
    yyjson_read_code YYJSON_READ_ERROR_MEMORY_ALLOCATION
    yyjson_read_code YYJSON_READ_ERROR_EMPTY_CONTENT
    yyjson_read_code YYJSON_READ_ERROR_UNEXPECTED_CONTENT
    yyjson_read_code YYJSON_READ_ERROR_UNEXPECTED_END
    yyjson_read_code YYJSON_READ_ERROR_UNEXPECTED_CHARACTER
    yyjson_read_code YYJSON_READ_ERROR_JSON_STRUCTURE
    yyjson_read_code YYJSON_READ_ERROR_INVALID_COMMENT
    yyjson_read_code YYJSON_READ_ERROR_INVALID_NUMBER
    yyjson_read_code YYJSON_READ_ERROR_INVALID_STRING
    yyjson_read_code YYJSON_READ_ERROR_LITERAL
    yyjson_read_code YYJSON_READ_ERROR_FILE_OPEN
    yyjson_read_code YYJSON_READ_ERROR_FILE_READ
    struct yyjson_read_err:
        yyjson_read_code code
        const char* msg
        size_t pos
    ctypedef yyjson_read_err yyjson_read_err
    yyjson_doc* yyjson_read_opts(char*, size_t, yyjson_read_flag, yyjson_alc*, yyjson_read_err*)
    yyjson_doc* yyjson_read_file(const char*, yyjson_read_flag, yyjson_alc*, yyjson_read_err*)
    yyjson_doc* yyjson_read_fp(FILE*, yyjson_read_flag, yyjson_alc*, yyjson_read_err*)
    yyjson_doc* yyjson_read(const char*, size_t, yyjson_read_flag)
    size_t yyjson_read_max_memory_usage(size_t, yyjson_read_flag)
    const char* yyjson_read_number(const char*, yyjson_val*, yyjson_read_flag, yyjson_alc*, yyjson_read_err*)
    const char* yyjson_mut_read_number(const char*, yyjson_mut_val*, yyjson_read_flag, yyjson_alc*, yyjson_read_err*)
    ctypedef uint32_t yyjson_write_flag
    yyjson_write_flag YYJSON_WRITE_NOFLAG
    yyjson_write_flag YYJSON_WRITE_PRETTY
    yyjson_write_flag YYJSON_WRITE_ESCAPE_UNICODE
    yyjson_write_flag YYJSON_WRITE_ESCAPE_SLASHES
    yyjson_write_flag YYJSON_WRITE_ALLOW_INF_AND_NAN
    yyjson_write_flag YYJSON_WRITE_INF_AND_NAN_AS_NULL
    yyjson_write_flag YYJSON_WRITE_ALLOW_INVALID_UNICODE
    yyjson_write_flag YYJSON_WRITE_PRETTY_TWO_SPACES
    yyjson_write_flag YYJSON_WRITE_NEWLINE_AT_END
    ctypedef uint32_t yyjson_write_code
    yyjson_write_code YYJSON_WRITE_SUCCESS
    yyjson_write_code YYJSON_WRITE_ERROR_INVALID_PARAMETER
    yyjson_write_code YYJSON_WRITE_ERROR_MEMORY_ALLOCATION
    yyjson_write_code YYJSON_WRITE_ERROR_INVALID_VALUE_TYPE
    yyjson_write_code YYJSON_WRITE_ERROR_NAN_OR_INF
    yyjson_write_code YYJSON_WRITE_ERROR_FILE_OPEN
    yyjson_write_code YYJSON_WRITE_ERROR_FILE_WRITE
    yyjson_write_code YYJSON_WRITE_ERROR_INVALID_STRING
    struct yyjson_write_err:
        yyjson_write_code code
        const char* msg
    ctypedef yyjson_write_err yyjson_write_err
    char* yyjson_write_opts(yyjson_doc*, yyjson_write_flag, yyjson_alc*, size_t*, yyjson_write_err*)
    bint yyjson_write_file(const char*, yyjson_doc*, yyjson_write_flag, yyjson_alc*, yyjson_write_err*)
    bint yyjson_write_fp(FILE*, yyjson_doc*, yyjson_write_flag, yyjson_alc*, yyjson_write_err*)
    char* yyjson_write(yyjson_doc*, yyjson_write_flag, size_t*)
    char* yyjson_mut_write_opts(yyjson_mut_doc*, yyjson_write_flag, yyjson_alc*, size_t*, yyjson_write_err*)
    bint yyjson_mut_write_file(const char*, yyjson_mut_doc*, yyjson_write_flag, yyjson_alc*, yyjson_write_err*)
    bint yyjson_mut_write_fp(FILE*, yyjson_mut_doc*, yyjson_write_flag, yyjson_alc*, yyjson_write_err*)
    char* yyjson_mut_write(yyjson_mut_doc*, yyjson_write_flag, size_t*)
    char* yyjson_val_write_opts(yyjson_val*, yyjson_write_flag, yyjson_alc*, size_t*, yyjson_write_err*)
    bint yyjson_val_write_file(const char*, yyjson_val*, yyjson_write_flag, yyjson_alc*, yyjson_write_err*)
    bint yyjson_val_write_fp(FILE*, yyjson_val*, yyjson_write_flag, yyjson_alc*, yyjson_write_err*)
    char* yyjson_val_write(yyjson_val*, yyjson_write_flag, size_t*)
    char* yyjson_mut_val_write_opts(yyjson_mut_val*, yyjson_write_flag, yyjson_alc*, size_t*, yyjson_write_err*)
    bint yyjson_mut_val_write_file(const char*, yyjson_mut_val*, yyjson_write_flag, yyjson_alc*, yyjson_write_err*)
    bint yyjson_mut_val_write_fp(FILE*, yyjson_mut_val*, yyjson_write_flag, yyjson_alc*, yyjson_write_err*)
    char* yyjson_mut_val_write(yyjson_mut_val*, yyjson_write_flag, size_t*)
    yyjson_val* yyjson_doc_get_root(yyjson_doc*)
    size_t yyjson_doc_get_read_size(yyjson_doc*)
    size_t yyjson_doc_get_val_count(yyjson_doc*)
    void yyjson_doc_free(yyjson_doc*)
    bint yyjson_is_raw(yyjson_val*)
    bint yyjson_is_null(yyjson_val*)
    bint yyjson_is_true(yyjson_val*)
    bint yyjson_is_false(yyjson_val*)
    bint yyjson_is_bool(yyjson_val*)
    bint yyjson_is_uint(yyjson_val*)
    bint yyjson_is_sint(yyjson_val*)
    bint yyjson_is_int(yyjson_val*)
    bint yyjson_is_real(yyjson_val*)
    bint yyjson_is_num(yyjson_val*)
    bint yyjson_is_str(yyjson_val*)
    bint yyjson_is_arr(yyjson_val*)
    bint yyjson_is_obj(yyjson_val*)
    bint yyjson_is_ctn(yyjson_val*)
    yyjson_type yyjson_get_type(yyjson_val*)
    yyjson_subtype yyjson_get_subtype(yyjson_val*)
    uint8_t yyjson_get_tag(yyjson_val*)
    const char* yyjson_get_type_desc(yyjson_val*)
    const char* yyjson_get_raw(yyjson_val*)
    bint yyjson_get_bool(yyjson_val*)
    uint64_t yyjson_get_uint(yyjson_val*)
    int64_t yyjson_get_sint(yyjson_val*)
    int yyjson_get_int(yyjson_val*)
    double yyjson_get_real(yyjson_val*)
    double yyjson_get_num(yyjson_val*)
    const char* yyjson_get_str(yyjson_val*)
    size_t yyjson_get_len(yyjson_val*)
    bint yyjson_equals_str(yyjson_val*, const char*)
    bint yyjson_equals_strn(yyjson_val*, const char*, size_t)
    bint yyjson_equals(yyjson_val*, yyjson_val*)
    bint yyjson_set_raw(yyjson_val*, const char*, size_t)
    bint yyjson_set_null(yyjson_val*)
    bint yyjson_set_bool(yyjson_val*, bint)
    bint yyjson_set_uint(yyjson_val*, uint64_t)
    bint yyjson_set_sint(yyjson_val*, int64_t)
    bint yyjson_set_int(yyjson_val*, int)
    bint yyjson_set_real(yyjson_val*, double)
    bint yyjson_set_str(yyjson_val*, const char*)
    bint yyjson_set_strn(yyjson_val*, const char*, size_t)
    size_t yyjson_arr_size(yyjson_val*)
    yyjson_val* yyjson_arr_get(yyjson_val*, size_t)
    yyjson_val* yyjson_arr_get_first(yyjson_val*)
    yyjson_val* yyjson_arr_get_last(yyjson_val*)
    struct yyjson_arr_iter:
        size_t idx
        size_t max
        yyjson_val* cur
    ctypedef yyjson_arr_iter yyjson_arr_iter
    bint yyjson_arr_iter_init(yyjson_val*, yyjson_arr_iter*)
    yyjson_arr_iter yyjson_arr_iter_with(yyjson_val*)
    bint yyjson_arr_iter_has_next(yyjson_arr_iter*)
    yyjson_val* yyjson_arr_iter_next(yyjson_arr_iter*)
    size_t yyjson_obj_size(yyjson_val*)
    yyjson_val* yyjson_obj_get(yyjson_val*, const char*)
    yyjson_val* yyjson_obj_getn(yyjson_val*, const char*, size_t)
    struct yyjson_obj_iter:
        size_t idx
        size_t max
        yyjson_val* cur
        yyjson_val* obj
    ctypedef yyjson_obj_iter yyjson_obj_iter
    bint yyjson_obj_iter_init(yyjson_val*, yyjson_obj_iter*)
    yyjson_obj_iter yyjson_obj_iter_with(yyjson_val*)
    bint yyjson_obj_iter_has_next(yyjson_obj_iter*)
    yyjson_val* yyjson_obj_iter_next(yyjson_obj_iter*)
    yyjson_val* yyjson_obj_iter_get_val(yyjson_val*)
    yyjson_val* yyjson_obj_iter_get(yyjson_obj_iter*, const char*)
    yyjson_val* yyjson_obj_iter_getn(yyjson_obj_iter*, const char*, size_t)
    yyjson_mut_val* yyjson_mut_doc_get_root(yyjson_mut_doc*)
    void yyjson_mut_doc_set_root(yyjson_mut_doc*, yyjson_mut_val*)
    bint yyjson_mut_doc_set_str_pool_size(yyjson_mut_doc*, size_t)
    bint yyjson_mut_doc_set_val_pool_size(yyjson_mut_doc*, size_t)
    void yyjson_mut_doc_free(yyjson_mut_doc*)
    yyjson_mut_doc* yyjson_mut_doc_new(yyjson_alc*)
    yyjson_mut_doc* yyjson_doc_mut_copy(yyjson_doc*, yyjson_alc*)
    yyjson_mut_doc* yyjson_mut_doc_mut_copy(yyjson_mut_doc*, yyjson_alc*)
    yyjson_mut_val* yyjson_val_mut_copy(yyjson_mut_doc*, yyjson_val*)
    yyjson_mut_val* yyjson_mut_val_mut_copy(yyjson_mut_doc*, yyjson_mut_val*)
    yyjson_doc* yyjson_mut_doc_imut_copy(yyjson_mut_doc*, yyjson_alc*)
    yyjson_doc* yyjson_mut_val_imut_copy(yyjson_mut_val*, yyjson_alc*)
    bint yyjson_mut_is_raw(yyjson_mut_val*)
    bint yyjson_mut_is_null(yyjson_mut_val*)
    bint yyjson_mut_is_true(yyjson_mut_val*)
    bint yyjson_mut_is_false(yyjson_mut_val*)
    bint yyjson_mut_is_bool(yyjson_mut_val*)
    bint yyjson_mut_is_uint(yyjson_mut_val*)
    bint yyjson_mut_is_sint(yyjson_mut_val*)
    bint yyjson_mut_is_int(yyjson_mut_val*)
    bint yyjson_mut_is_real(yyjson_mut_val*)
    bint yyjson_mut_is_num(yyjson_mut_val*)
    bint yyjson_mut_is_str(yyjson_mut_val*)
    bint yyjson_mut_is_arr(yyjson_mut_val*)
    bint yyjson_mut_is_obj(yyjson_mut_val*)
    bint yyjson_mut_is_ctn(yyjson_mut_val*)
    yyjson_type yyjson_mut_get_type(yyjson_mut_val*)
    yyjson_subtype yyjson_mut_get_subtype(yyjson_mut_val*)
    uint8_t yyjson_mut_get_tag(yyjson_mut_val*)
    const char* yyjson_mut_get_type_desc(yyjson_mut_val*)
    const char* yyjson_mut_get_raw(yyjson_mut_val*)
    bint yyjson_mut_get_bool(yyjson_mut_val*)
    uint64_t yyjson_mut_get_uint(yyjson_mut_val*)
    int64_t yyjson_mut_get_sint(yyjson_mut_val*)
    int yyjson_mut_get_int(yyjson_mut_val*)
    double yyjson_mut_get_real(yyjson_mut_val*)
    double yyjson_mut_get_num(yyjson_mut_val*)
    const char* yyjson_mut_get_str(yyjson_mut_val*)
    size_t yyjson_mut_get_len(yyjson_mut_val*)
    bint yyjson_mut_equals_str(yyjson_mut_val*, const char*)
    bint yyjson_mut_equals_strn(yyjson_mut_val*, const char*, size_t)
    bint yyjson_mut_equals(yyjson_mut_val*, yyjson_mut_val*)
    bint yyjson_mut_set_raw(yyjson_mut_val*, const char*, size_t)
    bint yyjson_mut_set_null(yyjson_mut_val*)
    bint yyjson_mut_set_bool(yyjson_mut_val*, bint)
    bint yyjson_mut_set_uint(yyjson_mut_val*, uint64_t)
    bint yyjson_mut_set_sint(yyjson_mut_val*, int64_t)
    bint yyjson_mut_set_int(yyjson_mut_val*, int)
    bint yyjson_mut_set_real(yyjson_mut_val*, double)
    bint yyjson_mut_set_str(yyjson_mut_val*, const char*)
    bint yyjson_mut_set_strn(yyjson_mut_val*, const char*, size_t)
    bint yyjson_mut_set_arr(yyjson_mut_val*)
    bint yyjson_mut_set_obj(yyjson_mut_val*)
    yyjson_mut_val* yyjson_mut_raw(yyjson_mut_doc*, const char*)
    yyjson_mut_val* yyjson_mut_rawn(yyjson_mut_doc*, const char*, size_t)
    yyjson_mut_val* yyjson_mut_rawcpy(yyjson_mut_doc*, const char*)
    yyjson_mut_val* yyjson_mut_rawncpy(yyjson_mut_doc*, const char*, size_t)
    yyjson_mut_val* yyjson_mut_null(yyjson_mut_doc*)
    yyjson_mut_val* yyjson_mut_true(yyjson_mut_doc*)
    yyjson_mut_val* yyjson_mut_false(yyjson_mut_doc*)
    yyjson_mut_val* yyjson_mut_bool(yyjson_mut_doc*, bint)
    yyjson_mut_val* yyjson_mut_uint(yyjson_mut_doc*, uint64_t)
    yyjson_mut_val* yyjson_mut_sint(yyjson_mut_doc*, int64_t)
    yyjson_mut_val* yyjson_mut_int(yyjson_mut_doc*, int64_t)
    yyjson_mut_val* yyjson_mut_real(yyjson_mut_doc*, double)
    yyjson_mut_val* yyjson_mut_str(yyjson_mut_doc*, const char*)
    yyjson_mut_val* yyjson_mut_strn(yyjson_mut_doc*, const char*, size_t)
    yyjson_mut_val* yyjson_mut_strcpy(yyjson_mut_doc*, const char*)
    yyjson_mut_val* yyjson_mut_strncpy(yyjson_mut_doc*, const char*, size_t)
    size_t yyjson_mut_arr_size(yyjson_mut_val*)
    yyjson_mut_val* yyjson_mut_arr_get(yyjson_mut_val*, size_t)
    yyjson_mut_val* yyjson_mut_arr_get_first(yyjson_mut_val*)
    yyjson_mut_val* yyjson_mut_arr_get_last(yyjson_mut_val*)
    struct yyjson_mut_arr_iter:
        size_t idx
        size_t max
        yyjson_mut_val* cur
        yyjson_mut_val* pre
        yyjson_mut_val* arr
    ctypedef yyjson_mut_arr_iter yyjson_mut_arr_iter
    bint yyjson_mut_arr_iter_init(yyjson_mut_val*, yyjson_mut_arr_iter*)
    yyjson_mut_arr_iter yyjson_mut_arr_iter_with(yyjson_mut_val*)
    bint yyjson_mut_arr_iter_has_next(yyjson_mut_arr_iter*)
    yyjson_mut_val* yyjson_mut_arr_iter_next(yyjson_mut_arr_iter*)
    yyjson_mut_val* yyjson_mut_arr_iter_remove(yyjson_mut_arr_iter*)
    yyjson_mut_val* yyjson_mut_arr(yyjson_mut_doc*)
    yyjson_mut_val* yyjson_mut_arr_with_bool(yyjson_mut_doc*, const bint*, size_t)
    yyjson_mut_val* yyjson_mut_arr_with_sint(yyjson_mut_doc*, int64_t*, size_t)
    yyjson_mut_val* yyjson_mut_arr_with_uint(yyjson_mut_doc*, uint64_t*, size_t)
    yyjson_mut_val* yyjson_mut_arr_with_real(yyjson_mut_doc*, const double*, size_t)
    yyjson_mut_val* yyjson_mut_arr_with_sint8(yyjson_mut_doc*, int8_t*, size_t)
    yyjson_mut_val* yyjson_mut_arr_with_sint16(yyjson_mut_doc*, int16_t*, size_t)
    yyjson_mut_val* yyjson_mut_arr_with_sint32(yyjson_mut_doc*, int32_t*, size_t)
    yyjson_mut_val* yyjson_mut_arr_with_sint64(yyjson_mut_doc*, int64_t*, size_t)
    yyjson_mut_val* yyjson_mut_arr_with_uint8(yyjson_mut_doc*, uint8_t*, size_t)
    yyjson_mut_val* yyjson_mut_arr_with_uint16(yyjson_mut_doc*, uint16_t*, size_t)
    yyjson_mut_val* yyjson_mut_arr_with_uint32(yyjson_mut_doc*, uint32_t*, size_t)
    yyjson_mut_val* yyjson_mut_arr_with_uint64(yyjson_mut_doc*, uint64_t*, size_t)
    yyjson_mut_val* yyjson_mut_arr_with_float(yyjson_mut_doc*, const float*, size_t)
    yyjson_mut_val* yyjson_mut_arr_with_double(yyjson_mut_doc*, const double*, size_t)
    yyjson_mut_val* yyjson_mut_arr_with_str(yyjson_mut_doc*, const char**, size_t)
    yyjson_mut_val* yyjson_mut_arr_with_strn(yyjson_mut_doc*, const char**, size_t*, size_t)
    yyjson_mut_val* yyjson_mut_arr_with_strcpy(yyjson_mut_doc*, const char**, size_t)
    yyjson_mut_val* yyjson_mut_arr_with_strncpy(yyjson_mut_doc*, const char**, size_t*, size_t)
    bint yyjson_mut_arr_insert(yyjson_mut_val*, yyjson_mut_val*, size_t)
    bint yyjson_mut_arr_append(yyjson_mut_val*, yyjson_mut_val*)
    bint yyjson_mut_arr_prepend(yyjson_mut_val*, yyjson_mut_val*)
    yyjson_mut_val* yyjson_mut_arr_replace(yyjson_mut_val*, size_t, yyjson_mut_val*)
    yyjson_mut_val* yyjson_mut_arr_remove(yyjson_mut_val*, size_t)
    yyjson_mut_val* yyjson_mut_arr_remove_first(yyjson_mut_val*)
    yyjson_mut_val* yyjson_mut_arr_remove_last(yyjson_mut_val*)
    bint yyjson_mut_arr_remove_range(yyjson_mut_val*, size_t, size_t)
    bint yyjson_mut_arr_clear(yyjson_mut_val*)
    bint yyjson_mut_arr_rotate(yyjson_mut_val*, size_t)
    bint yyjson_mut_arr_add_val(yyjson_mut_val*, yyjson_mut_val*)
    bint yyjson_mut_arr_add_null(yyjson_mut_doc*, yyjson_mut_val*)
    bint yyjson_mut_arr_add_true(yyjson_mut_doc*, yyjson_mut_val*)
    bint yyjson_mut_arr_add_false(yyjson_mut_doc*, yyjson_mut_val*)
    bint yyjson_mut_arr_add_bool(yyjson_mut_doc*, yyjson_mut_val*, bint)
    bint yyjson_mut_arr_add_uint(yyjson_mut_doc*, yyjson_mut_val*, uint64_t)
    bint yyjson_mut_arr_add_sint(yyjson_mut_doc*, yyjson_mut_val*, int64_t)
    bint yyjson_mut_arr_add_int(yyjson_mut_doc*, yyjson_mut_val*, int64_t)
    bint yyjson_mut_arr_add_real(yyjson_mut_doc*, yyjson_mut_val*, double)
    bint yyjson_mut_arr_add_str(yyjson_mut_doc*, yyjson_mut_val*, const char*)
    bint yyjson_mut_arr_add_strn(yyjson_mut_doc*, yyjson_mut_val*, const char*, size_t)
    bint yyjson_mut_arr_add_strcpy(yyjson_mut_doc*, yyjson_mut_val*, const char*)
    bint yyjson_mut_arr_add_strncpy(yyjson_mut_doc*, yyjson_mut_val*, const char*, size_t)
    yyjson_mut_val* yyjson_mut_arr_add_arr(yyjson_mut_doc*, yyjson_mut_val*)
    yyjson_mut_val* yyjson_mut_arr_add_obj(yyjson_mut_doc*, yyjson_mut_val*)
    size_t yyjson_mut_obj_size(yyjson_mut_val*)
    yyjson_mut_val* yyjson_mut_obj_get(yyjson_mut_val*, const char*)
    yyjson_mut_val* yyjson_mut_obj_getn(yyjson_mut_val*, const char*, size_t)
    struct yyjson_mut_obj_iter:
        size_t idx
        size_t max
        yyjson_mut_val* cur
        yyjson_mut_val* pre
        yyjson_mut_val* obj
    ctypedef yyjson_mut_obj_iter yyjson_mut_obj_iter
    bint yyjson_mut_obj_iter_init(yyjson_mut_val*, yyjson_mut_obj_iter*)
    yyjson_mut_obj_iter yyjson_mut_obj_iter_with(yyjson_mut_val*)
    bint yyjson_mut_obj_iter_has_next(yyjson_mut_obj_iter*)
    yyjson_mut_val* yyjson_mut_obj_iter_next(yyjson_mut_obj_iter*)
    yyjson_mut_val* yyjson_mut_obj_iter_get_val(yyjson_mut_val*)
    yyjson_mut_val* yyjson_mut_obj_iter_remove(yyjson_mut_obj_iter*)
    yyjson_mut_val* yyjson_mut_obj_iter_get(yyjson_mut_obj_iter*, const char*)
    yyjson_mut_val* yyjson_mut_obj_iter_getn(yyjson_mut_obj_iter*, const char*, size_t)
    yyjson_mut_val* yyjson_mut_obj(yyjson_mut_doc*)
    yyjson_mut_val* yyjson_mut_obj_with_str(yyjson_mut_doc*, const char**, const char**, size_t)
    yyjson_mut_val* yyjson_mut_obj_with_kv(yyjson_mut_doc*, const char**, size_t)
    bint yyjson_mut_obj_add(yyjson_mut_val*, yyjson_mut_val*, yyjson_mut_val*)
    bint yyjson_mut_obj_put(yyjson_mut_val*, yyjson_mut_val*, yyjson_mut_val*)
    bint yyjson_mut_obj_insert(yyjson_mut_val*, yyjson_mut_val*, yyjson_mut_val*, size_t)
    yyjson_mut_val* yyjson_mut_obj_remove(yyjson_mut_val*, yyjson_mut_val*)
    yyjson_mut_val* yyjson_mut_obj_remove_key(yyjson_mut_val*, const char*)
    yyjson_mut_val* yyjson_mut_obj_remove_keyn(yyjson_mut_val*, const char*, size_t)
    bint yyjson_mut_obj_clear(yyjson_mut_val*)
    bint yyjson_mut_obj_replace(yyjson_mut_val*, yyjson_mut_val*, yyjson_mut_val*)
    bint yyjson_mut_obj_rotate(yyjson_mut_val*, size_t)
    bint yyjson_mut_obj_add_null(yyjson_mut_doc*, yyjson_mut_val*, const char*)
    bint yyjson_mut_obj_add_true(yyjson_mut_doc*, yyjson_mut_val*, const char*)
    bint yyjson_mut_obj_add_false(yyjson_mut_doc*, yyjson_mut_val*, const char*)
    bint yyjson_mut_obj_add_bool(yyjson_mut_doc*, yyjson_mut_val*, const char*, bint)
    bint yyjson_mut_obj_add_uint(yyjson_mut_doc*, yyjson_mut_val*, const char*, uint64_t)
    bint yyjson_mut_obj_add_sint(yyjson_mut_doc*, yyjson_mut_val*, const char*, int64_t)
    bint yyjson_mut_obj_add_int(yyjson_mut_doc*, yyjson_mut_val*, const char*, int64_t)
    bint yyjson_mut_obj_add_real(yyjson_mut_doc*, yyjson_mut_val*, const char*, double)
    bint yyjson_mut_obj_add_str(yyjson_mut_doc*, yyjson_mut_val*, const char*, const char*)
    bint yyjson_mut_obj_add_strn(yyjson_mut_doc*, yyjson_mut_val*, const char*, const char*, size_t)
    bint yyjson_mut_obj_add_strcpy(yyjson_mut_doc*, yyjson_mut_val*, const char*, const char*)
    bint yyjson_mut_obj_add_strncpy(yyjson_mut_doc*, yyjson_mut_val*, const char*, const char*, size_t)
    yyjson_mut_val* yyjson_mut_obj_add_arr(yyjson_mut_doc*, yyjson_mut_val*, const char*)
    yyjson_mut_val* yyjson_mut_obj_add_obj(yyjson_mut_doc*, yyjson_mut_val*, const char*)
    bint yyjson_mut_obj_add_val(yyjson_mut_doc*, yyjson_mut_val*, const char*, yyjson_mut_val*)
    yyjson_mut_val* yyjson_mut_obj_remove_str(yyjson_mut_val*, const char*)
    yyjson_mut_val* yyjson_mut_obj_remove_strn(yyjson_mut_val*, const char*, size_t)
    bint yyjson_mut_obj_rename_key(yyjson_mut_doc*, yyjson_mut_val*, const char*, const char*)
    bint yyjson_mut_obj_rename_keyn(yyjson_mut_doc*, yyjson_mut_val*, const char*, size_t, const char*, size_t)
    ctypedef uint32_t yyjson_ptr_code
    yyjson_ptr_code YYJSON_PTR_ERR_NONE
    yyjson_ptr_code YYJSON_PTR_ERR_PARAMETER
    yyjson_ptr_code YYJSON_PTR_ERR_SYNTAX
    yyjson_ptr_code YYJSON_PTR_ERR_RESOLVE
    yyjson_ptr_code YYJSON_PTR_ERR_NULL_ROOT
    yyjson_ptr_code YYJSON_PTR_ERR_SET_ROOT
    yyjson_ptr_code YYJSON_PTR_ERR_MEMORY_ALLOCATION
    struct yyjson_ptr_err:
        yyjson_ptr_code code
        const char* msg
        size_t pos
    ctypedef yyjson_ptr_err yyjson_ptr_err
    struct yyjson_ptr_ctx:
        yyjson_mut_val* ctn
        yyjson_mut_val* pre
        yyjson_mut_val* old
    ctypedef yyjson_ptr_ctx yyjson_ptr_ctx
    yyjson_val* yyjson_doc_ptr_get(yyjson_doc*, const char*)
    yyjson_val* yyjson_doc_ptr_getn(yyjson_doc*, const char*, size_t)
    yyjson_val* yyjson_doc_ptr_getx(yyjson_doc*, const char*, size_t, yyjson_ptr_err*)
    yyjson_val* yyjson_ptr_get(yyjson_val*, const char*)
    yyjson_val* yyjson_ptr_getn(yyjson_val*, const char*, size_t)
    yyjson_val* yyjson_ptr_getx(yyjson_val*, const char*, size_t, yyjson_ptr_err*)
    yyjson_mut_val* yyjson_mut_doc_ptr_get(yyjson_mut_doc*, const char*)
    yyjson_mut_val* yyjson_mut_doc_ptr_getn(yyjson_mut_doc*, const char*, size_t)
    yyjson_mut_val* yyjson_mut_doc_ptr_getx(yyjson_mut_doc*, const char*, size_t, yyjson_ptr_ctx*, yyjson_ptr_err*)
    yyjson_mut_val* yyjson_mut_ptr_get(yyjson_mut_val*, const char*)
    yyjson_mut_val* yyjson_mut_ptr_getn(yyjson_mut_val*, const char*, size_t)
    yyjson_mut_val* yyjson_mut_ptr_getx(yyjson_mut_val*, const char*, size_t, yyjson_ptr_ctx*, yyjson_ptr_err*)
    bint yyjson_mut_doc_ptr_add(yyjson_mut_doc*, const char*, yyjson_mut_val*)
    bint yyjson_mut_doc_ptr_addn(yyjson_mut_doc*, const char*, size_t, yyjson_mut_val*)
    bint yyjson_mut_doc_ptr_addx(yyjson_mut_doc*, const char*, size_t, yyjson_mut_val*, bint, yyjson_ptr_ctx*, yyjson_ptr_err*)
    bint yyjson_mut_ptr_add(yyjson_mut_val*, const char*, yyjson_mut_val*, yyjson_mut_doc*)
    bint yyjson_mut_ptr_addn(yyjson_mut_val*, const char*, size_t, yyjson_mut_val*, yyjson_mut_doc*)
    bint yyjson_mut_ptr_addx(yyjson_mut_val*, const char*, size_t, yyjson_mut_val*, yyjson_mut_doc*, bint, yyjson_ptr_ctx*, yyjson_ptr_err*)
    bint yyjson_mut_doc_ptr_set(yyjson_mut_doc*, const char*, yyjson_mut_val*)
    bint yyjson_mut_doc_ptr_setn(yyjson_mut_doc*, const char*, size_t, yyjson_mut_val*)
    bint yyjson_mut_doc_ptr_setx(yyjson_mut_doc*, const char*, size_t, yyjson_mut_val*, bint, yyjson_ptr_ctx*, yyjson_ptr_err*)
    bint yyjson_mut_ptr_set(yyjson_mut_val*, const char*, yyjson_mut_val*, yyjson_mut_doc*)
    bint yyjson_mut_ptr_setn(yyjson_mut_val*, const char*, size_t, yyjson_mut_val*, yyjson_mut_doc*)
    bint yyjson_mut_ptr_setx(yyjson_mut_val*, const char*, size_t, yyjson_mut_val*, yyjson_mut_doc*, bint, yyjson_ptr_ctx*, yyjson_ptr_err*)
    yyjson_mut_val* yyjson_mut_doc_ptr_replace(yyjson_mut_doc*, const char*, yyjson_mut_val*)
    yyjson_mut_val* yyjson_mut_doc_ptr_replacen(yyjson_mut_doc*, const char*, size_t, yyjson_mut_val*)
    yyjson_mut_val* yyjson_mut_doc_ptr_replacex(yyjson_mut_doc*, const char*, size_t, yyjson_mut_val*, yyjson_ptr_ctx*, yyjson_ptr_err*)
    yyjson_mut_val* yyjson_mut_ptr_replace(yyjson_mut_val*, const char*, yyjson_mut_val*)
    yyjson_mut_val* yyjson_mut_ptr_replacen(yyjson_mut_val*, const char*, size_t, yyjson_mut_val*)
    yyjson_mut_val* yyjson_mut_ptr_replacex(yyjson_mut_val*, const char*, size_t, yyjson_mut_val*, yyjson_ptr_ctx*, yyjson_ptr_err*)
    yyjson_mut_val* yyjson_mut_doc_ptr_remove(yyjson_mut_doc*, const char*)
    yyjson_mut_val* yyjson_mut_doc_ptr_removen(yyjson_mut_doc*, const char*, size_t)
    yyjson_mut_val* yyjson_mut_doc_ptr_removex(yyjson_mut_doc*, const char*, size_t, yyjson_ptr_ctx*, yyjson_ptr_err*)
    yyjson_mut_val* yyjson_mut_ptr_remove(yyjson_mut_val*, const char*)
    yyjson_mut_val* yyjson_mut_ptr_removen(yyjson_mut_val*, const char*, size_t)
    yyjson_mut_val* yyjson_mut_ptr_removex(yyjson_mut_val*, const char*, size_t, yyjson_ptr_ctx*, yyjson_ptr_err*)
    bint yyjson_ptr_ctx_append(yyjson_ptr_ctx*, yyjson_mut_val*, yyjson_mut_val*)
    bint yyjson_ptr_ctx_replace(yyjson_ptr_ctx*, yyjson_mut_val*)
    bint yyjson_ptr_ctx_remove(yyjson_ptr_ctx*)
    ctypedef uint32_t yyjson_patch_code
    yyjson_patch_code YYJSON_PATCH_SUCCESS
    yyjson_patch_code YYJSON_PATCH_ERROR_INVALID_PARAMETER
    yyjson_patch_code YYJSON_PATCH_ERROR_MEMORY_ALLOCATION
    yyjson_patch_code YYJSON_PATCH_ERROR_INVALID_OPERATION
    yyjson_patch_code YYJSON_PATCH_ERROR_MISSING_KEY
    yyjson_patch_code YYJSON_PATCH_ERROR_INVALID_MEMBER
    yyjson_patch_code YYJSON_PATCH_ERROR_EQUAL
    yyjson_patch_code YYJSON_PATCH_ERROR_POINTER
    struct yyjson_patch_err:
        yyjson_patch_code code
        size_t idx
        const char* msg
        yyjson_ptr_err ptr
    ctypedef yyjson_patch_err yyjson_patch_err
    yyjson_mut_val* yyjson_patch(yyjson_mut_doc*, yyjson_val*, yyjson_val*, yyjson_patch_err*)
    yyjson_mut_val* yyjson_mut_patch(yyjson_mut_doc*, yyjson_mut_val*, yyjson_mut_val*, yyjson_patch_err*)
    yyjson_mut_val* yyjson_merge_patch(yyjson_mut_doc*, yyjson_val*, yyjson_val*)
    yyjson_mut_val* yyjson_mut_merge_patch(yyjson_mut_doc*, yyjson_mut_val*, yyjson_mut_val*)
    union yyjson_val_uni:
        uint64_t u64
        int64_t i64
        double f64
        const char* str
        void* ptr
        size_t ofs
    ctypedef yyjson_val_uni yyjson_val_uni
    struct yyjson_val:
        uint64_t tag
        yyjson_val_uni uni
    struct yyjson_doc:
        yyjson_val* root
        yyjson_alc alc
        size_t dat_read
        size_t val_read
        char* str_pool
    bint unsafe_yyjson_is_str_noesc(const char*, size_t)
    yyjson_type unsafe_yyjson_get_type(void*)
    yyjson_subtype unsafe_yyjson_get_subtype(void*)
    uint8_t unsafe_yyjson_get_tag(void*)
    bint unsafe_yyjson_is_raw(void*)
    bint unsafe_yyjson_is_null(void*)
    bint unsafe_yyjson_is_bool(void*)
    bint unsafe_yyjson_is_num(void*)
    bint unsafe_yyjson_is_str(void*)
    bint unsafe_yyjson_is_arr(void*)
    bint unsafe_yyjson_is_obj(void*)
    bint unsafe_yyjson_is_ctn(void*)
    bint unsafe_yyjson_is_uint(void*)
    bint unsafe_yyjson_is_sint(void*)
    bint unsafe_yyjson_is_int(void*)
    bint unsafe_yyjson_is_real(void*)
    bint unsafe_yyjson_is_true(void*)
    bint unsafe_yyjson_is_false(void*)
    bint unsafe_yyjson_arr_is_flat(yyjson_val*)
    const char* unsafe_yyjson_get_raw(void*)
    bint unsafe_yyjson_get_bool(void*)
    uint64_t unsafe_yyjson_get_uint(void*)
    int64_t unsafe_yyjson_get_sint(void*)
    int unsafe_yyjson_get_int(void*)
    double unsafe_yyjson_get_real(void*)
    double unsafe_yyjson_get_num(void*)
    const char* unsafe_yyjson_get_str(void*)
    size_t unsafe_yyjson_get_len(void*)
    yyjson_val* unsafe_yyjson_get_first(yyjson_val*)
    yyjson_val* unsafe_yyjson_get_next(yyjson_val*)
    bint unsafe_yyjson_equals_strn(void*, const char*, size_t)
    bint unsafe_yyjson_equals_str(void*, const char*)
    void unsafe_yyjson_set_type(void*, yyjson_type, yyjson_subtype)
    void unsafe_yyjson_set_len(void*, size_t)
    void unsafe_yyjson_inc_len(void*)
    void unsafe_yyjson_set_raw(void*, const char*, size_t)
    void unsafe_yyjson_set_null(void*)
    void unsafe_yyjson_set_bool(void*, bint)
    void unsafe_yyjson_set_uint(void*, uint64_t)
    void unsafe_yyjson_set_sint(void*, int64_t)
    void unsafe_yyjson_set_real(void*, double)
    void unsafe_yyjson_set_str(void*, const char*)
    void unsafe_yyjson_set_strn(void*, const char*, size_t)
    void unsafe_yyjson_set_arr(void*, size_t)
    void unsafe_yyjson_set_obj(void*, size_t)
    yyjson_val* yyjson_doc_get_root(yyjson_doc*)
    size_t yyjson_doc_get_read_size(yyjson_doc*)
    size_t yyjson_doc_get_val_count(yyjson_doc*)
    void yyjson_doc_free(yyjson_doc*)
    bint yyjson_is_raw(yyjson_val*)
    bint yyjson_is_null(yyjson_val*)
    bint yyjson_is_true(yyjson_val*)
    bint yyjson_is_false(yyjson_val*)
    bint yyjson_is_bool(yyjson_val*)
    bint yyjson_is_uint(yyjson_val*)
    bint yyjson_is_sint(yyjson_val*)
    bint yyjson_is_int(yyjson_val*)
    bint yyjson_is_real(yyjson_val*)
    bint yyjson_is_num(yyjson_val*)
    bint yyjson_is_str(yyjson_val*)
    bint yyjson_is_arr(yyjson_val*)
    bint yyjson_is_obj(yyjson_val*)
    bint yyjson_is_ctn(yyjson_val*)
    yyjson_type yyjson_get_type(yyjson_val*)
    yyjson_subtype yyjson_get_subtype(yyjson_val*)
    uint8_t yyjson_get_tag(yyjson_val*)
    const char* yyjson_get_type_desc(yyjson_val*)
    const char* yyjson_get_raw(yyjson_val*)
    bint yyjson_get_bool(yyjson_val*)
    uint64_t yyjson_get_uint(yyjson_val*)
    int64_t yyjson_get_sint(yyjson_val*)
    int yyjson_get_int(yyjson_val*)
    double yyjson_get_real(yyjson_val*)
    double yyjson_get_num(yyjson_val*)
    const char* yyjson_get_str(yyjson_val*)
    size_t yyjson_get_len(yyjson_val*)
    bint yyjson_equals_str(yyjson_val*, const char*)
    bint yyjson_equals_strn(yyjson_val*, const char*, size_t)
    bint unsafe_yyjson_equals(yyjson_val*, yyjson_val*)
    bint yyjson_equals(yyjson_val*, yyjson_val*)
    bint yyjson_set_raw(yyjson_val*, const char*, size_t)
    bint yyjson_set_null(yyjson_val*)
    bint yyjson_set_bool(yyjson_val*, bint)
    bint yyjson_set_uint(yyjson_val*, uint64_t)
    bint yyjson_set_sint(yyjson_val*, int64_t)
    bint yyjson_set_int(yyjson_val*, int)
    bint yyjson_set_real(yyjson_val*, double)
    bint yyjson_set_str(yyjson_val*, const char*)
    bint yyjson_set_strn(yyjson_val*, const char*, size_t)
    size_t yyjson_arr_size(yyjson_val*)
    yyjson_val* yyjson_arr_get(yyjson_val*, size_t)
    yyjson_val* yyjson_arr_get_first(yyjson_val*)
    yyjson_val* yyjson_arr_get_last(yyjson_val*)
    bint yyjson_arr_iter_init(yyjson_val*, yyjson_arr_iter*)
    yyjson_arr_iter yyjson_arr_iter_with(yyjson_val*)
    bint yyjson_arr_iter_has_next(yyjson_arr_iter*)
    yyjson_val* yyjson_arr_iter_next(yyjson_arr_iter*)
    size_t yyjson_obj_size(yyjson_val*)
    yyjson_val* yyjson_obj_get(yyjson_val*, const char*)
    yyjson_val* yyjson_obj_getn(yyjson_val*, const char*, size_t)
    bint yyjson_obj_iter_init(yyjson_val*, yyjson_obj_iter*)
    yyjson_obj_iter yyjson_obj_iter_with(yyjson_val*)
    bint yyjson_obj_iter_has_next(yyjson_obj_iter*)
    yyjson_val* yyjson_obj_iter_next(yyjson_obj_iter*)
    yyjson_val* yyjson_obj_iter_get_val(yyjson_val*)
    yyjson_val* yyjson_obj_iter_get(yyjson_obj_iter*, const char*)
    yyjson_val* yyjson_obj_iter_getn(yyjson_obj_iter*, const char*, size_t)
    struct yyjson_mut_val:
        uint64_t tag
        yyjson_val_uni uni
        yyjson_mut_val* next
    struct yyjson_str_chunk:
        yyjson_str_chunk* next
        size_t chunk_size
    ctypedef yyjson_str_chunk yyjson_str_chunk
    struct yyjson_str_pool:
        char* cur
        char* end
        size_t chunk_size
        size_t chunk_size_max
        yyjson_str_chunk* chunks
    ctypedef yyjson_str_pool yyjson_str_pool
    struct yyjson_val_chunk:
        yyjson_val_chunk* next
        size_t chunk_size
    ctypedef yyjson_val_chunk yyjson_val_chunk
    struct yyjson_val_pool:
        yyjson_mut_val* cur
        yyjson_mut_val* end
        size_t chunk_size
        size_t chunk_size_max
        yyjson_val_chunk* chunks
    ctypedef yyjson_val_pool yyjson_val_pool
    struct yyjson_mut_doc:
        yyjson_mut_val* root
        yyjson_alc alc
        yyjson_str_pool str_pool
        yyjson_val_pool val_pool
    bint unsafe_yyjson_str_pool_grow(yyjson_str_pool*, yyjson_alc*, size_t)
    bint unsafe_yyjson_val_pool_grow(yyjson_val_pool*, yyjson_alc*, size_t)
    char* unsafe_yyjson_mut_str_alc(yyjson_mut_doc*, size_t)
    char* unsafe_yyjson_mut_strncpy(yyjson_mut_doc*, const char*, size_t)
    yyjson_mut_val* unsafe_yyjson_mut_val(yyjson_mut_doc*, size_t)
    yyjson_mut_val* yyjson_mut_doc_get_root(yyjson_mut_doc*)
    void yyjson_mut_doc_set_root(yyjson_mut_doc*, yyjson_mut_val*)
    bint yyjson_mut_is_raw(yyjson_mut_val*)
    bint yyjson_mut_is_null(yyjson_mut_val*)
    bint yyjson_mut_is_true(yyjson_mut_val*)
    bint yyjson_mut_is_false(yyjson_mut_val*)
    bint yyjson_mut_is_bool(yyjson_mut_val*)
    bint yyjson_mut_is_uint(yyjson_mut_val*)
    bint yyjson_mut_is_sint(yyjson_mut_val*)
    bint yyjson_mut_is_int(yyjson_mut_val*)
    bint yyjson_mut_is_real(yyjson_mut_val*)
    bint yyjson_mut_is_num(yyjson_mut_val*)
    bint yyjson_mut_is_str(yyjson_mut_val*)
    bint yyjson_mut_is_arr(yyjson_mut_val*)
    bint yyjson_mut_is_obj(yyjson_mut_val*)
    bint yyjson_mut_is_ctn(yyjson_mut_val*)
    yyjson_type yyjson_mut_get_type(yyjson_mut_val*)
    yyjson_subtype yyjson_mut_get_subtype(yyjson_mut_val*)
    uint8_t yyjson_mut_get_tag(yyjson_mut_val*)
    const char* yyjson_mut_get_type_desc(yyjson_mut_val*)
    const char* yyjson_mut_get_raw(yyjson_mut_val*)
    bint yyjson_mut_get_bool(yyjson_mut_val*)
    uint64_t yyjson_mut_get_uint(yyjson_mut_val*)
    int64_t yyjson_mut_get_sint(yyjson_mut_val*)
    int yyjson_mut_get_int(yyjson_mut_val*)
    double yyjson_mut_get_real(yyjson_mut_val*)
    double yyjson_mut_get_num(yyjson_mut_val*)
    const char* yyjson_mut_get_str(yyjson_mut_val*)
    size_t yyjson_mut_get_len(yyjson_mut_val*)
    bint yyjson_mut_equals_str(yyjson_mut_val*, const char*)
    bint yyjson_mut_equals_strn(yyjson_mut_val*, const char*, size_t)
    bint unsafe_yyjson_mut_equals(yyjson_mut_val*, yyjson_mut_val*)
    bint yyjson_mut_equals(yyjson_mut_val*, yyjson_mut_val*)
    bint yyjson_mut_set_raw(yyjson_mut_val*, const char*, size_t)
    bint yyjson_mut_set_null(yyjson_mut_val*)
    bint yyjson_mut_set_bool(yyjson_mut_val*, bint)
    bint yyjson_mut_set_uint(yyjson_mut_val*, uint64_t)
    bint yyjson_mut_set_sint(yyjson_mut_val*, int64_t)
    bint yyjson_mut_set_int(yyjson_mut_val*, int)
    bint yyjson_mut_set_real(yyjson_mut_val*, double)
    bint yyjson_mut_set_str(yyjson_mut_val*, const char*)
    bint yyjson_mut_set_strn(yyjson_mut_val*, const char*, size_t)
    bint yyjson_mut_set_arr(yyjson_mut_val*)
    bint yyjson_mut_set_obj(yyjson_mut_val*)
    yyjson_mut_val* yyjson_mut_raw(yyjson_mut_doc*, const char*)
    yyjson_mut_val* yyjson_mut_rawn(yyjson_mut_doc*, const char*, size_t)
    yyjson_mut_val* yyjson_mut_rawcpy(yyjson_mut_doc*, const char*)
    yyjson_mut_val* yyjson_mut_rawncpy(yyjson_mut_doc*, const char*, size_t)
    yyjson_mut_val* yyjson_mut_null(yyjson_mut_doc*)
    yyjson_mut_val* yyjson_mut_true(yyjson_mut_doc*)
    yyjson_mut_val* yyjson_mut_false(yyjson_mut_doc*)
    yyjson_mut_val* yyjson_mut_bool(yyjson_mut_doc*, bint)
    yyjson_mut_val* yyjson_mut_uint(yyjson_mut_doc*, uint64_t)
    yyjson_mut_val* yyjson_mut_sint(yyjson_mut_doc*, int64_t)
    yyjson_mut_val* yyjson_mut_int(yyjson_mut_doc*, int64_t)
    yyjson_mut_val* yyjson_mut_real(yyjson_mut_doc*, double)
    yyjson_mut_val* yyjson_mut_str(yyjson_mut_doc*, const char*)
    yyjson_mut_val* yyjson_mut_strn(yyjson_mut_doc*, const char*, size_t)
    yyjson_mut_val* yyjson_mut_strcpy(yyjson_mut_doc*, const char*)
    yyjson_mut_val* yyjson_mut_strncpy(yyjson_mut_doc*, const char*, size_t)
    size_t yyjson_mut_arr_size(yyjson_mut_val*)
    yyjson_mut_val* yyjson_mut_arr_get(yyjson_mut_val*, size_t)
    yyjson_mut_val* yyjson_mut_arr_get_first(yyjson_mut_val*)
    yyjson_mut_val* yyjson_mut_arr_get_last(yyjson_mut_val*)
    bint yyjson_mut_arr_iter_init(yyjson_mut_val*, yyjson_mut_arr_iter*)
    yyjson_mut_arr_iter yyjson_mut_arr_iter_with(yyjson_mut_val*)
    bint yyjson_mut_arr_iter_has_next(yyjson_mut_arr_iter*)
    yyjson_mut_val* yyjson_mut_arr_iter_next(yyjson_mut_arr_iter*)
    yyjson_mut_val* yyjson_mut_arr_iter_remove(yyjson_mut_arr_iter*)
    yyjson_mut_val* yyjson_mut_arr(yyjson_mut_doc*)
    yyjson_mut_val* yyjson_mut_arr_with_bool(yyjson_mut_doc*, const bint*, size_t)
    yyjson_mut_val* yyjson_mut_arr_with_sint(yyjson_mut_doc*, int64_t*, size_t)
    yyjson_mut_val* yyjson_mut_arr_with_uint(yyjson_mut_doc*, uint64_t*, size_t)
    yyjson_mut_val* yyjson_mut_arr_with_real(yyjson_mut_doc*, const double*, size_t)
    yyjson_mut_val* yyjson_mut_arr_with_sint8(yyjson_mut_doc*, int8_t*, size_t)
    yyjson_mut_val* yyjson_mut_arr_with_sint16(yyjson_mut_doc*, int16_t*, size_t)
    yyjson_mut_val* yyjson_mut_arr_with_sint32(yyjson_mut_doc*, int32_t*, size_t)
    yyjson_mut_val* yyjson_mut_arr_with_sint64(yyjson_mut_doc*, int64_t*, size_t)
    yyjson_mut_val* yyjson_mut_arr_with_uint8(yyjson_mut_doc*, uint8_t*, size_t)
    yyjson_mut_val* yyjson_mut_arr_with_uint16(yyjson_mut_doc*, uint16_t*, size_t)
    yyjson_mut_val* yyjson_mut_arr_with_uint32(yyjson_mut_doc*, uint32_t*, size_t)
    yyjson_mut_val* yyjson_mut_arr_with_uint64(yyjson_mut_doc*, uint64_t*, size_t)
    yyjson_mut_val* yyjson_mut_arr_with_float(yyjson_mut_doc*, const float*, size_t)
    yyjson_mut_val* yyjson_mut_arr_with_double(yyjson_mut_doc*, const double*, size_t)
    yyjson_mut_val* yyjson_mut_arr_with_str(yyjson_mut_doc*, const char**, size_t)
    yyjson_mut_val* yyjson_mut_arr_with_strn(yyjson_mut_doc*, const char**, size_t*, size_t)
    yyjson_mut_val* yyjson_mut_arr_with_strcpy(yyjson_mut_doc*, const char**, size_t)
    yyjson_mut_val* yyjson_mut_arr_with_strncpy(yyjson_mut_doc*, const char**, size_t*, size_t)
    bint yyjson_mut_arr_insert(yyjson_mut_val*, yyjson_mut_val*, size_t)
    bint yyjson_mut_arr_append(yyjson_mut_val*, yyjson_mut_val*)
    bint yyjson_mut_arr_prepend(yyjson_mut_val*, yyjson_mut_val*)
    yyjson_mut_val* yyjson_mut_arr_replace(yyjson_mut_val*, size_t, yyjson_mut_val*)
    yyjson_mut_val* yyjson_mut_arr_remove(yyjson_mut_val*, size_t)
    yyjson_mut_val* yyjson_mut_arr_remove_first(yyjson_mut_val*)
    yyjson_mut_val* yyjson_mut_arr_remove_last(yyjson_mut_val*)
    bint yyjson_mut_arr_remove_range(yyjson_mut_val*, size_t, size_t)
    bint yyjson_mut_arr_clear(yyjson_mut_val*)
    bint yyjson_mut_arr_rotate(yyjson_mut_val*, size_t)
    bint yyjson_mut_arr_add_val(yyjson_mut_val*, yyjson_mut_val*)
    bint yyjson_mut_arr_add_null(yyjson_mut_doc*, yyjson_mut_val*)
    bint yyjson_mut_arr_add_true(yyjson_mut_doc*, yyjson_mut_val*)
    bint yyjson_mut_arr_add_false(yyjson_mut_doc*, yyjson_mut_val*)
    bint yyjson_mut_arr_add_bool(yyjson_mut_doc*, yyjson_mut_val*, bint)
    bint yyjson_mut_arr_add_uint(yyjson_mut_doc*, yyjson_mut_val*, uint64_t)
    bint yyjson_mut_arr_add_sint(yyjson_mut_doc*, yyjson_mut_val*, int64_t)
    bint yyjson_mut_arr_add_int(yyjson_mut_doc*, yyjson_mut_val*, int64_t)
    bint yyjson_mut_arr_add_real(yyjson_mut_doc*, yyjson_mut_val*, double)
    bint yyjson_mut_arr_add_str(yyjson_mut_doc*, yyjson_mut_val*, const char*)
    bint yyjson_mut_arr_add_strn(yyjson_mut_doc*, yyjson_mut_val*, const char*, size_t)
    bint yyjson_mut_arr_add_strcpy(yyjson_mut_doc*, yyjson_mut_val*, const char*)
    bint yyjson_mut_arr_add_strncpy(yyjson_mut_doc*, yyjson_mut_val*, const char*, size_t)
    yyjson_mut_val* yyjson_mut_arr_add_arr(yyjson_mut_doc*, yyjson_mut_val*)
    yyjson_mut_val* yyjson_mut_arr_add_obj(yyjson_mut_doc*, yyjson_mut_val*)
    size_t yyjson_mut_obj_size(yyjson_mut_val*)
    yyjson_mut_val* yyjson_mut_obj_get(yyjson_mut_val*, const char*)
    yyjson_mut_val* yyjson_mut_obj_getn(yyjson_mut_val*, const char*, size_t)
    bint yyjson_mut_obj_iter_init(yyjson_mut_val*, yyjson_mut_obj_iter*)
    yyjson_mut_obj_iter yyjson_mut_obj_iter_with(yyjson_mut_val*)
    bint yyjson_mut_obj_iter_has_next(yyjson_mut_obj_iter*)
    yyjson_mut_val* yyjson_mut_obj_iter_next(yyjson_mut_obj_iter*)
    yyjson_mut_val* yyjson_mut_obj_iter_get_val(yyjson_mut_val*)
    yyjson_mut_val* yyjson_mut_obj_iter_remove(yyjson_mut_obj_iter*)
    yyjson_mut_val* yyjson_mut_obj_iter_get(yyjson_mut_obj_iter*, const char*)
    yyjson_mut_val* yyjson_mut_obj_iter_getn(yyjson_mut_obj_iter*, const char*, size_t)
    yyjson_mut_val* yyjson_mut_obj(yyjson_mut_doc*)
    yyjson_mut_val* yyjson_mut_obj_with_str(yyjson_mut_doc*, const char**, const char**, size_t)
    yyjson_mut_val* yyjson_mut_obj_with_kv(yyjson_mut_doc*, const char**, size_t)
    void unsafe_yyjson_mut_obj_add(yyjson_mut_val*, yyjson_mut_val*, yyjson_mut_val*, size_t)
    yyjson_mut_val* unsafe_yyjson_mut_obj_remove(yyjson_mut_val*, const char*, size_t)
    bint unsafe_yyjson_mut_obj_replace(yyjson_mut_val*, yyjson_mut_val*, yyjson_mut_val*)
    void unsafe_yyjson_mut_obj_rotate(yyjson_mut_val*, size_t)
    bint yyjson_mut_obj_add(yyjson_mut_val*, yyjson_mut_val*, yyjson_mut_val*)
    bint yyjson_mut_obj_put(yyjson_mut_val*, yyjson_mut_val*, yyjson_mut_val*)
    bint yyjson_mut_obj_insert(yyjson_mut_val*, yyjson_mut_val*, yyjson_mut_val*, size_t)
    yyjson_mut_val* yyjson_mut_obj_remove(yyjson_mut_val*, yyjson_mut_val*)
    yyjson_mut_val* yyjson_mut_obj_remove_key(yyjson_mut_val*, const char*)
    yyjson_mut_val* yyjson_mut_obj_remove_keyn(yyjson_mut_val*, const char*, size_t)
    bint yyjson_mut_obj_clear(yyjson_mut_val*)
    bint yyjson_mut_obj_replace(yyjson_mut_val*, yyjson_mut_val*, yyjson_mut_val*)
    bint yyjson_mut_obj_rotate(yyjson_mut_val*, size_t)
    bint yyjson_mut_obj_add_null(yyjson_mut_doc*, yyjson_mut_val*, const char*)
    bint yyjson_mut_obj_add_true(yyjson_mut_doc*, yyjson_mut_val*, const char*)
    bint yyjson_mut_obj_add_false(yyjson_mut_doc*, yyjson_mut_val*, const char*)
    bint yyjson_mut_obj_add_bool(yyjson_mut_doc*, yyjson_mut_val*, const char*, bint)
    bint yyjson_mut_obj_add_uint(yyjson_mut_doc*, yyjson_mut_val*, const char*, uint64_t)
    bint yyjson_mut_obj_add_sint(yyjson_mut_doc*, yyjson_mut_val*, const char*, int64_t)
    bint yyjson_mut_obj_add_int(yyjson_mut_doc*, yyjson_mut_val*, const char*, int64_t)
    bint yyjson_mut_obj_add_real(yyjson_mut_doc*, yyjson_mut_val*, const char*, double)
    bint yyjson_mut_obj_add_str(yyjson_mut_doc*, yyjson_mut_val*, const char*, const char*)
    bint yyjson_mut_obj_add_strn(yyjson_mut_doc*, yyjson_mut_val*, const char*, const char*, size_t)
    bint yyjson_mut_obj_add_strcpy(yyjson_mut_doc*, yyjson_mut_val*, const char*, const char*)
    bint yyjson_mut_obj_add_strncpy(yyjson_mut_doc*, yyjson_mut_val*, const char*, const char*, size_t)
    yyjson_mut_val* yyjson_mut_obj_add_arr(yyjson_mut_doc*, yyjson_mut_val*, const char*)
    yyjson_mut_val* yyjson_mut_obj_add_obj(yyjson_mut_doc*, yyjson_mut_val*, const char*)
    bint yyjson_mut_obj_add_val(yyjson_mut_doc*, yyjson_mut_val*, const char*, yyjson_mut_val*)
    yyjson_mut_val* yyjson_mut_obj_remove_str(yyjson_mut_val*, const char*)
    yyjson_mut_val* yyjson_mut_obj_remove_strn(yyjson_mut_val*, const char*, size_t)
    bint yyjson_mut_obj_rename_key(yyjson_mut_doc*, yyjson_mut_val*, const char*, const char*)
    bint yyjson_mut_obj_rename_keyn(yyjson_mut_doc*, yyjson_mut_val*, const char*, size_t, const char*, size_t)
    yyjson_val* unsafe_yyjson_ptr_getx(yyjson_val*, const char*, size_t, yyjson_ptr_err*)
    yyjson_mut_val* unsafe_yyjson_mut_ptr_getx(yyjson_mut_val*, const char*, size_t, yyjson_ptr_ctx*, yyjson_ptr_err*)
    bint unsafe_yyjson_mut_ptr_putx(yyjson_mut_val*, const char*, size_t, yyjson_mut_val*, yyjson_mut_doc*, bint, bint, yyjson_ptr_ctx*, yyjson_ptr_err*)
    yyjson_mut_val* unsafe_yyjson_mut_ptr_replacex(yyjson_mut_val*, const char*, size_t, yyjson_mut_val*, yyjson_ptr_ctx*, yyjson_ptr_err*)
    yyjson_mut_val* unsafe_yyjson_mut_ptr_removex(yyjson_mut_val*, const char*, size_t, yyjson_ptr_ctx*, yyjson_ptr_err*)
    yyjson_val* yyjson_doc_ptr_get(yyjson_doc*, const char*)
    yyjson_val* yyjson_doc_ptr_getn(yyjson_doc*, const char*, size_t)
    yyjson_val* yyjson_doc_ptr_getx(yyjson_doc*, const char*, size_t, yyjson_ptr_err*)
    yyjson_val* yyjson_ptr_get(yyjson_val*, const char*)
    yyjson_val* yyjson_ptr_getn(yyjson_val*, const char*, size_t)
    yyjson_val* yyjson_ptr_getx(yyjson_val*, const char*, size_t, yyjson_ptr_err*)
    yyjson_mut_val* yyjson_mut_doc_ptr_get(yyjson_mut_doc*, const char*)
    yyjson_mut_val* yyjson_mut_doc_ptr_getn(yyjson_mut_doc*, const char*, size_t)
    yyjson_mut_val* yyjson_mut_doc_ptr_getx(yyjson_mut_doc*, const char*, size_t, yyjson_ptr_ctx*, yyjson_ptr_err*)
    yyjson_mut_val* yyjson_mut_ptr_get(yyjson_mut_val*, const char*)
    yyjson_mut_val* yyjson_mut_ptr_getn(yyjson_mut_val*, const char*, size_t)
    yyjson_mut_val* yyjson_mut_ptr_getx(yyjson_mut_val*, const char*, size_t, yyjson_ptr_ctx*, yyjson_ptr_err*)
    bint yyjson_mut_doc_ptr_add(yyjson_mut_doc*, const char*, yyjson_mut_val*)
    bint yyjson_mut_doc_ptr_addn(yyjson_mut_doc*, const char*, size_t, yyjson_mut_val*)
    bint yyjson_mut_doc_ptr_addx(yyjson_mut_doc*, const char*, size_t, yyjson_mut_val*, bint, yyjson_ptr_ctx*, yyjson_ptr_err*)
    bint yyjson_mut_ptr_add(yyjson_mut_val*, const char*, yyjson_mut_val*, yyjson_mut_doc*)
    bint yyjson_mut_ptr_addn(yyjson_mut_val*, const char*, size_t, yyjson_mut_val*, yyjson_mut_doc*)
    bint yyjson_mut_ptr_addx(yyjson_mut_val*, const char*, size_t, yyjson_mut_val*, yyjson_mut_doc*, bint, yyjson_ptr_ctx*, yyjson_ptr_err*)
    bint yyjson_mut_doc_ptr_set(yyjson_mut_doc*, const char*, yyjson_mut_val*)
    bint yyjson_mut_doc_ptr_setn(yyjson_mut_doc*, const char*, size_t, yyjson_mut_val*)
    bint yyjson_mut_doc_ptr_setx(yyjson_mut_doc*, const char*, size_t, yyjson_mut_val*, bint, yyjson_ptr_ctx*, yyjson_ptr_err*)
    bint yyjson_mut_ptr_set(yyjson_mut_val*, const char*, yyjson_mut_val*, yyjson_mut_doc*)
    bint yyjson_mut_ptr_setn(yyjson_mut_val*, const char*, size_t, yyjson_mut_val*, yyjson_mut_doc*)
    bint yyjson_mut_ptr_setx(yyjson_mut_val*, const char*, size_t, yyjson_mut_val*, yyjson_mut_doc*, bint, yyjson_ptr_ctx*, yyjson_ptr_err*)
    yyjson_mut_val* yyjson_mut_doc_ptr_replace(yyjson_mut_doc*, const char*, yyjson_mut_val*)
    yyjson_mut_val* yyjson_mut_doc_ptr_replacen(yyjson_mut_doc*, const char*, size_t, yyjson_mut_val*)
    yyjson_mut_val* yyjson_mut_doc_ptr_replacex(yyjson_mut_doc*, const char*, size_t, yyjson_mut_val*, yyjson_ptr_ctx*, yyjson_ptr_err*)
    yyjson_mut_val* yyjson_mut_ptr_replace(yyjson_mut_val*, const char*, yyjson_mut_val*)
    yyjson_mut_val* yyjson_mut_ptr_replacen(yyjson_mut_val*, const char*, size_t, yyjson_mut_val*)
    yyjson_mut_val* yyjson_mut_ptr_replacex(yyjson_mut_val*, const char*, size_t, yyjson_mut_val*, yyjson_ptr_ctx*, yyjson_ptr_err*)
    yyjson_mut_val* yyjson_mut_doc_ptr_remove(yyjson_mut_doc*, const char*)
    yyjson_mut_val* yyjson_mut_doc_ptr_removen(yyjson_mut_doc*, const char*, size_t)
    yyjson_mut_val* yyjson_mut_doc_ptr_removex(yyjson_mut_doc*, const char*, size_t, yyjson_ptr_ctx*, yyjson_ptr_err*)
    yyjson_mut_val* yyjson_mut_ptr_remove(yyjson_mut_val*, const char*)
    yyjson_mut_val* yyjson_mut_ptr_removen(yyjson_mut_val*, const char*, size_t)
    yyjson_mut_val* yyjson_mut_ptr_removex(yyjson_mut_val*, const char*, size_t, yyjson_ptr_ctx*, yyjson_ptr_err*)
    bint yyjson_ptr_ctx_append(yyjson_ptr_ctx*, yyjson_mut_val*, yyjson_mut_val*)
    bint yyjson_ptr_ctx_replace(yyjson_ptr_ctx*, yyjson_mut_val*)
    bint yyjson_ptr_ctx_remove(yyjson_ptr_ctx*)
    bint yyjson_ptr_get_bool(yyjson_val*, const char*, bint*)
    bint yyjson_ptr_get_uint(yyjson_val*, const char*, uint64_t*)
    bint yyjson_ptr_get_sint(yyjson_val*, const char*, int64_t*)
    bint yyjson_ptr_get_real(yyjson_val*, const char*, double*)
    bint yyjson_ptr_get_num(yyjson_val*, const char*, double*)
    bint yyjson_ptr_get_str(yyjson_val*, const char*, const char**)
    yyjson_val* yyjson_doc_get_pointer(yyjson_doc*, const char*)
    yyjson_val* yyjson_doc_get_pointern(yyjson_doc*, const char*, size_t)
    yyjson_mut_val* yyjson_mut_doc_get_pointer(yyjson_mut_doc*, const char*)
    yyjson_mut_val* yyjson_mut_doc_get_pointern(yyjson_mut_doc*, const char*, size_t)
    yyjson_val* yyjson_get_pointer(yyjson_val*, const char*)
    yyjson_val* yyjson_get_pointern(yyjson_val*, const char*, size_t)
    yyjson_mut_val* yyjson_mut_get_pointer(yyjson_mut_val*, const char*)
    yyjson_mut_val* yyjson_mut_get_pointern(yyjson_mut_val*, const char*, size_t)
    yyjson_val* unsafe_yyjson_get_pointer(yyjson_val*, const char*, size_t)
    yyjson_mut_val* unsafe_yyjson_mut_get_pointer(yyjson_mut_val*, const char*, size_t)


