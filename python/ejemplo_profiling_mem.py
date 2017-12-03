@profile
def my_func():
    a = [1] * (10 * 6)
    b = [2] * (2 * 10 ** 7)
    del b
    return a

my_func()

@profile
def otra():
    my_func()
    print('hola')

# python -m memory_profiler ejemplo_profiling_mem.py
