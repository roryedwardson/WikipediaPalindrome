# Remove punctuation from a given word,
# using the string.punctuation constant: !"#$%&'()*+, -./:;<=>?@[\]^_`{|}~

def strip_punctuation(word):
    import string

    if isinstance(word, str):
        word = word.translate(str.maketrans('', '', string.punctuation))
    else:
        raise TypeError

