let ab = readLine()!.split(separator: " ").map{Int($0)!}

var (a,b) = (ab[0], ab[1])

func division2(_ input: Int) -> Int {
    return input / 2
}
func subtract1(_ input: Int) -> Int {
    var strInput = String(input)
    strInput.removeLast()
    
    return Int(strInput)!
}

var count = 1
var falseCount = 0

while a != b {
    if b % 2 == 0 && b / 2 >= a {
        b = division2(b)
        count += 1
    } else if String(b).last == "1" {
        let temp = subtract1(b)
        if temp < a {
            falseCount += 1
            break
        }
        b = temp
        count += 1
    } else {
        falseCount += 1
        break
    }
}
falseCount >= 1 ? print(-1) : print(count)

