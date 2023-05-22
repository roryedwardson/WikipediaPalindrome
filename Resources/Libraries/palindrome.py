# Iterate through characters in a given word,
# and return True if the word is a palindrome.
# Return False if the word is not a palindrome.

def is_palindrome(word):
    # Check that "word" argument is string.
    if isinstance(word, str):

        #  Exclude single-letter words.
        if len(word) == 1:
            return False

        # Create a list of characters in the word in order.
        forward_list = []
        for letter in word:
            letter = letter.upper()
            forward_list.append(letter)

        # Save backward_list as a reversed copy of forward_list.
        backward_list = forward_list[::-1]

        # If the forward and backward lists are equal, the word is palindromic.
        if forward_list == backward_list:
            return True
        else:
            return False

    else:
        raise TypeError

# # Test cases to check functionality, in case there are any changes:
#
# # Should return True:
# print(is_palindrome("Madam, I'm Adam"))
# print(is_palindrome("no way, Jose"))
# print(is_palindrome("aha"))
# print(is_palindrome("12321"))
#
# # Should return False:
# print(is_palindrome("a"))
# print(is_palindrome("This is a test"))
# print(is_palindrome("2167826172186"))
#
# # Should fail with TypeError:
# print(is_palindrome(123))
# print(is_palindrome(4.355562))
# print(is_palindrome(0))
# print(is_palindrome(None))

