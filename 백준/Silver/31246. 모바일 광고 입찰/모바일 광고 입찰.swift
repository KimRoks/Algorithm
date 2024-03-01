let nk = readLine()!.split(separator: " ").map{Int($0)!}
let (n,k) = (nk[0],nk[1])

//낙찳받으려면 올려야하는 금액
var x = 0
//낙찰 받은 수
var count = 0
var minus = [Int]()

// n 반복 , k 는 받아야하는 낙찰 수

for _ in 0..<n {
    let ab = readLine()!.split(separator: " ").map{Int($0)!}
    // a는 내 가격 b는 상대가격
    let (a,b) = (ab[0], ab[1])
    if b - a > 0 {
        minus.append(b - a)
    } else {
        count += 1
    }
}

minus.sort()

if count >= k {
    print(0)
} else {
    // -1 하는 이유는 k-count는 내가 더 가져와야 할 낙찰인데 그걸 인덱스에 대입해야하므로
    print(minus[k - count - 1])
}

