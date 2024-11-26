let input = readLine()!

var openCount = 0 
var closeCount = 0

for char in input {
    if char == "(" {
        openCount += 1
    } else if char == ")" {
        if openCount > 0 {
            openCount -= 1
        } else {
            closeCount += 1
        }
    }
}

print(openCount + closeCount)
