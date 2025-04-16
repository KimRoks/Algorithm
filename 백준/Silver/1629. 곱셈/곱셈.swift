let input = readLine()!.split(separator: " ").map { Int($0)! }
let (a,b,c) = (input[0],input[1],input[2])

func solution(a: Int, b: Int, c: Int) -> Int {
    if b == 1 {
        return a
    }
    
    if b % 2 != 0 {
        return a * solution(a: a, b: b - 1, c: c)
    }
    
    let half = solution(a: a, b: b / 2, c: c) % c
    return half * half % c
}

print(solution(a: a, b: b, c: c) % c)
