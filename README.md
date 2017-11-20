# Reverse-Polish Notation calculator implementation

This implementation currently consists of two classes, `Calculator` which
performs the actual calculations by

1. accepting space-separated string input which is broken into parts
2. a match on one of integer, float or operator is attempted
3. if integer or float is matched, the value is pushed onto the stack
4. if operator is matched, the operation is run on the stack and the output returned

and `CLI` which provides the command-line interface.

The calculation is separated from the IO interface in order that any interface
can easily interact with the calculator by simply passing input to `handle_input`.

A known issue is the calculator's handling of integer values and division,
for example, `> 10 90 /` will return 0, whereas `> 10.0 90 /` will return 0.1111111111111111.
This could be solved by casting all inputs as float values or specifically handing division differently.


### To Run

From the command-line run:

```
./bin/calculator
```

### Example Usage

Input can be given on separate lines
```
> 900
> 5
> /
180
> 45.59
> 59
> *
2689.8100000000004
```

Or on the same line
```
> 23 90 +
113
> 34 99 - 44 4 -
-65
40
```


