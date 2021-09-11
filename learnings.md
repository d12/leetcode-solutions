# Learnings

### General

### Cycles

Tortise and the hare / fast-slow algorithm (Floyd's cycle finding algorithm) can solve lots of cycle problems.

### Majority

Boyer-Moore voting algorithm is handy for majority questions https://en.wikipedia.org/wiki/Boyer%E2%80%93Moore_majority_vote_algorithm

### O(1) space

An O(1) space requirement means no trees, graphs, linked lists, queues or stacks, unless they're bounded in size by some constant. It also means no recursion that's bounded by the input size or the log of the input size.

### Pairs and XOR

a XOR a == 0, so any problem that works with pairs may be solvable using XOR. E.g., Two unsorted lists have the same elements, but one new char has been added to one list. Find the added char. Just XOR all the chars together and since all the pairs cancel out, and a XOR 0 == a, you'll be left with just the char that was added. O(n) time, O(1) space which beats using a hash map.
