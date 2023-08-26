import csv
import sys
from textwrap import wrap


def main():
    mylist = []
    current_sequence = ""
    # TODO: Check for command-line usage
    if len(sys.argv) != 3:
        sys.exit("Command arg error!")
    else:
        with open(sys.argv[1]) as file:
            reader = csv.reader(file)
            for column in reader:
                mylist.append(column)

    # TODO: Read database file into a variable
    values = []
    # TODO: Read DNA sequence file into a variable
    with open(sys.argv[2]) as file:
        current_sequence = file.readline()
    # TODO: Find longest match of each STR in DNA sequence
    for j in range(1, len(mylist[0])):
        values.append(longest_match(current_sequence, mylist[0][j]))
    # TODO: Check database for matching profiles
    found_index = 0
    for i in range(1, len(mylist)):
        equal_check = 0
        for k in range(1, len(mylist[i])):
            if int(values[k - 1]) == int(mylist[i][k]):
                equal_check += 1
                if equal_check == int(len(mylist[i]) - 1):
                    found_index = i

    if found_index != 0:
        print(mylist[found_index][0])
    else:
        print("No match")


def longest_match(sequence, subsequence):
    """Returns length of longest run of subsequence in sequence."""

    # Initialize variables
    longest_run = 0
    subsequence_length = len(subsequence)
    sequence_length = len(sequence)

    # Check each character in sequence for most consecutive runs of subsequence
    for i in range(sequence_length):
        # Initialize count of consecutive runs
        count = 0

        # Check for a subsequence match in a "substring" (a subset of characters) within sequence
        # If a match, move substring to next potential match in sequence
        # Continue moving substring and checking for matches until out of consecutive matches
        while True:
            # Adjust substring start and end
            start = i + count * subsequence_length
            end = start + subsequence_length

            # If there is a match in the substring
            if sequence[start:end] == subsequence:
                count += 1

            # If there is no match in the substring
            else:
                break

        # Update most consecutive matches found
        longest_run = max(longest_run, count)

    # After checking for runs at each character in seqeuence, return longest run found
    return longest_run


main()
