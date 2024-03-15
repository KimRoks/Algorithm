let first = readLine()!.split(separator: " ").map{ Int($0)! }
let last = readLine()!.split(separator: " ").map{ Int($0)! }

var jeminy = 0
var gulibus = 0

var turnAround = false

for i in 0..<first.count {
    
    jeminy += first[i]
    if jeminy > gulibus {
        turnAround = true
    }
    gulibus += last[i]
}

if jeminy >= gulibus {
    print("No")
} else if jeminy < gulibus {
    turnAround == true ? print("Yes") : print("No")
}
