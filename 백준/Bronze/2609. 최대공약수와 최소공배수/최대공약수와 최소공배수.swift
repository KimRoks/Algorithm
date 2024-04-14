import Foundation

let ab = readLine()!.split(separator: " ").map{ Int($0)! }

let (a,b) = (ab[0],ab[1])

func gcd(a: Int, b: Int) -> Int {
    var temp = -1
    var a = a
    var b = b
    
    while b != 0 {
        temp = a % b
        a = b
        b = temp
    }
    return a
}

func icm(a: Int, b: Int) -> Int {
    a * b / gcd(a: a, b: b)
}


print("\(gcd(a: a, b: b))\n\(icm(a: a, b: b))")
