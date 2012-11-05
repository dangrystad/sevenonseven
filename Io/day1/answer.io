"Hello world!" println

// Produces 2
1+1

// Produces an exception
try(1+"one") println

// Also produces an exception, indicating a strongly typed language
try(1+"1") println

// Produces true -> 0 = true
true and 0

// Show all slots for Object
Object slotNames

// operator    action
// ::=     Creates slot, creates setter, assigns value
// :=  Creates slot, assigns value
// =   Assigns value to slot if it exists, otherwise raises exception

Foo := Object clone do (
    foo ::= nil
)

Bar := Object clone do (
    bar := nil
)

Baz := Foo clone setFoo(1)

Qux := Bar clone do (bar = 1)

