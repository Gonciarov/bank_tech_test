
A program that allows deposits or withdrawals from a bank account from command line, and gives a statement for the transactions.

To download dependencies, clone this repo and run:

```
bundle install
```

To run a programm in command line, cd to this repo on your computer and run:

```
ruby './lib/menu.rb'
```
For tests, run:

```
rspec

```
(Be prepared to press 'x' a few times while running tests).

APPROACH

- My initial decision was to create a Menu class for interacting with Customer, and Account class to run all account operations.

- On later stage, I decided to add Statement class to store all statement display functions in it.

- The code is test-driven.
