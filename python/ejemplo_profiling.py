from numpy import random

# @profile
def write_sorted_letters(nb_letters=10**5):
    letters = tuple('abcdfghijklmnopqrstuvwxy')

    random_letters = random.choice(letters, nb_letters)
    random_letters.sort()

    # import ipdb; ipdb.set_trace();
    sorted_string = random_letters.tostring()

    with open('sorted_text.txt', 'w') as sorted_text:
        for character in sorted_string:
            sorted_text.write(str(sorted_string))

write_sorted_letters()

# kernprof --line-by-line ejemplo_profiling.py
# python -m line_profiler ejemplo_profiling.py.lprof
