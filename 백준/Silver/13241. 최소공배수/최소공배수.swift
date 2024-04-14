import Foundation

let ab = readLine()!.split(separator: " ").map{ Int64($0)! }

let (a,b) = (ab[0],ab[1])

//최대 공약수
func gcd(a: Int64, b: Int64) -> Int64 {
    if b == 0 {
        return a
    }
    return gcd(a: b, b: a % b)
}

//최소 공배수
func icm(a: Int64, b: Int64) -> Int64 {
    a * b / gcd(a: a, b: b)
}


print(icm(a: a, b: b))
