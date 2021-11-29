// =========================Data Types in Swift=========================

// Everything in Swift has a Data Type

var num: Int = 5
// The 5 is of type 'Int'

var word: String = "Hello World"
// "Hello World" is of type 'String'

var pi: Double = 3.14 // ish
// 3.14 is of type 'Double'

// A variable is just a place we can store values.
// It's like a box we can put a value into,
// then retrieve / use that value later.

// The variables themselves are seperate to the value
// Therefore 'num', 'word' & 'pi' all have the type of 'Int', 'String' & 'Double' respectively

// These are all 'variables' which as the name implies, can change.
// We can 're-assign' the variables value that it stores.
// Change what's in the box.

word = "Goodbye World"

// Here we have reassigned the 'word' variable to "Goodbye World"
// Note that 'word' can only store something of type 'String'
// Also note we do not put the 'var' keyword in, as we are reusing an
// existing variable, not creating a new one.

let const: Int = 7

// This is a constant as denoted by the 'let' keyword.
// It works the same as a variable, but we cannot reassign the value.

const = 3
// This produces an error.
// Build it 'Ctrl+Shift+B' to see.
// We are not allowed to reassign it.

let quirky_number = 4

// We have not assigned the type to the variable explicitly with the : Type syntax.
// However, Swift will set 'quirky_number' to the type of 'Int'
// Because 4 is an 'Int'

// ===============Types====================

let v1: Int = 1
// Stores integers between:
// -9,223,372,036,854,775,808 to +9,223,372,036,854,775,807
// Big big range

let v2: Double = 3.141592
// The allows for numbers with a decimal point in them.
// It has a stupidly large range and precision don't worry.
// OOGA BOOGA weird technical stuff with how they work.

let v3: Float = 1.0
// Floats are a bad version of a double.
// The benifit is they take up exactly half of the memory.
// 32bits vs 64bits. They are less precise, but require less space.
// Basically, never use a float unless you have like trillions and trillions of doubles.
// Even then, probably doesn't matter.

let v4: Bool = true // or false
let v5: Bool = false
// Bool or Booleans can store the value 'true' or 'false'
// And that's it. It's like on or off. Binary 1 or 0.
// It's the simplest data type there is.

let v6: String = "My cool sentance"
let v7: String = "42"
// String is just like a sentance.
// It can have any character in it.
// Note that the 42 is still a string, despite the fact
// it looks like a number, still just a boring old string.

// Cool those were all the basic data types.
// Next: 2 -> Built-in Operators
