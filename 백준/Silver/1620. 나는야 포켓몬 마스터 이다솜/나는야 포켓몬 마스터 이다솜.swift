let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

// 포켓몬 번호에 따른 이름을 저장할 배열
var poketmons = [String](repeating: "", count: n + 1)

// 포켓몬 이름에 따른 번호를 저장할 딕셔너리
var poketmonDict = [String: Int]()

// 포켓몬 정보를 입력받아서 배열과 딕셔너리에 저장
for i in 1...n {
    let name = readLine()!
    poketmons[i] = name
    poketmonDict[name] = i
}

for _ in 0..<m {
    let input = readLine()!
    
    // input이 숫자인지 확인
    if let number = Int(input) {
        // 숫자일 경우 해당 번호의 포켓몬 이름 출력
        print(poketmons[number])
    } else {
        // 문자열일 경우 해당 이름의 포켓몬 번호 출력
        if let number = poketmonDict[input] {
            print(number)
        }
    }
}
