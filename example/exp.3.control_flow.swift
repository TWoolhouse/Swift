// =========================Control Flow in Swift=========================

// Control flow is like changing where the program goes and what order it does stuff
// SSI - Sequence, Selection, Iteration

// Sequence - Just stuff that happens in order
// Selection - Like branches and choosing direction
// Iteration - Loops and stuff doing it over again

// =======Sequence=======
// A sequence of operations. It can be anything
// For example:

var var_1: Int = 24
// Declaring & Initialising Variables

var_1 += 4
// In-place addition on a variable

print(var_1)
// Calling a function

// Quite boring nothing fun

// =======Selection=======
// Choosing between 2 things
// Just If statements

// ===If Statements===

// if statements will do one thing if the condition is met
// for a condition to be met, it needs to evaluate to 'true' (the boolean value)

// if condition {
//  	branch
// }

// For example

let cond_1: Bool = true

if cond_1 {
	print("Branch 1")
}

// In this example, as cond_1 is set to 'true'
// it will output "Branch 1"

if false {
	print("Branch 2")
}

// This will never ever ever ever
// output "Branch 2"

var v1: Int = 10
var v2: Int = 3

if v1 < v2 {
	v1 *= 5
}

// Now, instead of using booleans directly
// We can pass it an expression that evaluates
// to a boolean

// In this example we are doing the boolean operator '<'
// so when v1 is less than v2, we reassign v1 to 5 times v1

if v1 >= v2 {
	print(v1)
	v1 = v2 * 2
	v2 -= 5
	print(v2)
}

// We are now using a different boolean operator for funziies
// Also you can see we have lots of stuff in the branch

// ===Else Statements===
// Else happens when not if
// Yeah that made no sense

let cond_2 = false

if cond_2 {
	print("Condition is 'true'")
} else {
	print("Condition is 'false'")
}

// This will execute the else branch
// namely it will output "Condition is 'false'"
// This is because the if statement evaluated to false

var v4: Int = 8
var v5: Int = 10

if v4 > v5 {
	print("Mafs broek")
} else if v5 > v4 {
	print("Nice!!")
} else {
	print("The other conditions were met first so this wont happen")
}

// WOW, and else-if statement (or elif if you're cool)
// Basically its just a change of if-else statements
// Pretty cool right!

if v4 > v5 {
	print("Mafs broek")
} else if v5 > v4 {
	print("Nice!!")
}

// Note: we don't neeeeed to have the trailing else
// It's up to you and whether your program needs that shiz
