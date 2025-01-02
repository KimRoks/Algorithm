import Foundation

var recursionCount = 0

func recursion(_ input: [Character], _ leftIndex: Int, _ rightIndex: Int) -> Int {
    recursionCount += 1 // 함수 호출 시마다 증가
    if leftIndex >= rightIndex {
        return 1
    } else if input[leftIndex] != input[rightIndex] {
        return 0
    } else {
        return recursion(input, leftIndex + 1, rightIndex - 1)
    }
}

func isPalindrome(_ input: String) -> (Int, Int) {
    recursionCount = 0 // 호출 횟수 초기화
    let characters = Array(input) // 문자열을 배열로 변환
    let result = recursion(characters, 0, characters.count - 1)
    return (result, recursionCount) // 결과와 호출 횟수 반환
}

let testCaseCount = Int(readLine()!)!

for _ in 0..<testCaseCount {
    let input = readLine()! // 검사할 문자열 입력
    let (result, count) = isPalindrome(input)
    print("\(result) \(count)")
}