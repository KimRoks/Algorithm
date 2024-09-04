let n = Int(readLine()!)!

var sizeCount = readLine()!.split(separator: " ").map{Int($0)!}

let tp = readLine()!.split(separator: " ").map{Int($0)!}

let (t,p) = (tp[0],tp[1])

var tResult = 0

for i in sizeCount {
    tResult += i / t
    if i % t > 0 {
        tResult += 1
    }
}

print(tResult)
print(n / p, n % p)
