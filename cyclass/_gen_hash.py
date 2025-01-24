from dataclasses import _hash_action


EQ = 1 << 2
UNSAFE_HASH = 1 << 4
FROZEN = 1 << 5 
EXPLICIT_HASH = 1 << 6


def build_value_from_tuple(t:tuple[bool, bool, bool, bool]):
    flag = 0
    if t[0]:
        flag |= UNSAFE_HASH
    if t[1]:
        flag |= EQ
    if t[2]:
        flag |= FROZEN
    if t[3]:
        flag |= EXPLICIT_HASH
    return flag

def build_hint_from_tuple(t:tuple[bool, bool, bool, bool]):
    flag = []
    if t[0]:
        flag.append("UNSAFE_HASH")
    if t[1]:
        flag.append("EQ")
    if t[2]:
        flag.append("FROZEN")
    if t[3]:
        flag.append("EXPLICIT_HASH")
    if not flag:
        flag.append("NONE")
    return f"    /* {' | '.join(flag)} */\n"



def build_C_Actions_code():
    code = """

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
"""
    end = """
    /* UNREACHABLE BUT IN THE LIKELY EVENT THAT IT DOES HAPPEN... */
    return __CYCLS_HASH_ACTION_NONE;
};
#endif /* _CYCLS_HASH_ACTION_H_ */
"""
    for k, v in _hash_action.items():
        action_value = build_value_from_tuple(k)
        if v:
            name = v.__name__.replace("_hash", "").upper()
        else:
            name = "_NONE"
        code += build_hint_from_tuple(k)
        code += f"    if (action & {action_value}) return __CYCLS_HASH_ACTION{name};\n\n"
    
    code += end
    with open("_cycls_hash_action.h", "w") as w:
        w.write(code)

if __name__ == "__main__":
    
    build_C_Actions_code()