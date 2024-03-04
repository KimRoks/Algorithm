let n = Int(readLine()!)!
var button = readLine()!.split(separator: " ").map{Int($0)!}
let studentCount = Int(readLine()!)!


for _ in 0..<studentCount {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    let (gender, count) = (input[0], input[1])
    
    //남자애일때
    if gender == 1 {
        
        for i in 0..<button.count {
            if (i + 1).isMultiple(of: count) {
                button[i] = button[i] == 0 ? 1 : 0
            }
        }
    }
    //여자애일때
    else if gender == 2 {
        let index = count - 1 // 배열 index는 0부터 시작하므로 -1
        button[index] = button[index] == 0 ? 1 : 0 // 여학생의 번호 위치 스위치 상태 변경
        var i = 1
        while index - i >= 0 && index + i < n {
            if button[index - i] == button[index + i] {
                button[index - i] = button[index - i] == 0 ? 1 : 0
                button[index + i] = button[index + i] == 0 ? 1 : 0
            } else {
                break
            }
            i += 1
        }
        
    }
}

for i in 0..<n {
    print(button[i], terminator: " ")
    if (i + 1) % 20 == 0 {
        print()
    }
}
