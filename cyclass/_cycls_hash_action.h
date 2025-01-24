

#ifndef _CYCLS_HASH_ACTION_H_
#define _CYCLS_HASH_ACTION_H_

/* WARNING CODE IS AUTO-GENERATED, PLEASE DO NOT EDIT!!! */

typedef enum __CYCLS_HASH_ACTION {
    __CYCLS_HASH_ACTION_NONE = 0,
    __CYCLS_HASH_ACTION_SET_NONE = 1,
    __CYCLS_HASH_ACTION_ADD = 2,
    __CYCLS_HASH_ACTION_EXCEPTION = 3
} __CYCLS_HASH_ACTION;

/* We do something a bit more optimized than a hash-table
 * However We Want to stay true to the python dataclass library 
 * So lets be sure we don't end up like this issue: 
 *    https://bugs.python.org/issue32929#msg312829
 */

__CYCLS_HASH_ACTION __Lookup_Action(int action){
    /* NONE */
    if (action & 0) return __CYCLS_HASH_ACTION_NONE;

    /* EXPLICIT_HASH */
    if (action & 64) return __CYCLS_HASH_ACTION_NONE;

    /* FROZEN */
    if (action & 32) return __CYCLS_HASH_ACTION_NONE;

    /* FROZEN | EXPLICIT_HASH */
    if (action & 96) return __CYCLS_HASH_ACTION_NONE;

    /* EQ */
    if (action & 4) return __CYCLS_HASH_ACTION_SET_NONE;

    /* EQ | EXPLICIT_HASH */
    if (action & 68) return __CYCLS_HASH_ACTION_NONE;

    /* EQ | FROZEN */
    if (action & 36) return __CYCLS_HASH_ACTION_ADD;

    /* EQ | FROZEN | EXPLICIT_HASH */
    if (action & 100) return __CYCLS_HASH_ACTION_NONE;

    /* UNSAFE_HASH */
    if (action & 16) return __CYCLS_HASH_ACTION_ADD;

    /* UNSAFE_HASH | EXPLICIT_HASH */
    if (action & 80) return __CYCLS_HASH_ACTION_EXCEPTION;

    /* UNSAFE_HASH | FROZEN */
    if (action & 48) return __CYCLS_HASH_ACTION_ADD;

    /* UNSAFE_HASH | FROZEN | EXPLICIT_HASH */
    if (action & 112) return __CYCLS_HASH_ACTION_EXCEPTION;

    /* UNSAFE_HASH | EQ */
    if (action & 20) return __CYCLS_HASH_ACTION_ADD;

    /* UNSAFE_HASH | EQ | EXPLICIT_HASH */
    if (action & 84) return __CYCLS_HASH_ACTION_EXCEPTION;

    /* UNSAFE_HASH | EQ | FROZEN */
    if (action & 52) return __CYCLS_HASH_ACTION_ADD;

    /* UNSAFE_HASH | EQ | FROZEN | EXPLICIT_HASH */
    if (action & 116) return __CYCLS_HASH_ACTION_EXCEPTION;


    /* UNREACHABLE BUT IN THE LIKELY EVENT THAT IT DOES HAPPEN... */
    return __CYCLS_HASH_ACTION_NONE;
};
#endif /* _CYCLS_HASH_ACTION_H_ */
