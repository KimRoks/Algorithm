import Foundation

// 학점 등급을 enum으로 정의
enum Grade: String {
    case aPlus = "A+"
    case aZero = "A0"
    case bPlus = "B+"
    case bZero = "B0"
    case cPlus = "C+"
    case cZero = "C0"
    case dPlus = "D+"
    case dZero = "D0"
    case f = "F"
    case pass = "P"
    
    // 등급에 따른 점수 반환
    var score: Double {
        switch self {
        case .aPlus: return 4.5
        case .aZero: return 4.0
        case .bPlus: return 3.5
        case .bZero: return 3.0
        case .cPlus: return 2.5
        case .cZero: return 2.0
        case .dPlus: return 1.5
        case .dZero: return 1.0
        case .f: return 0.0
        case .pass: return 0.0 // P는 계산에서 제외
        }
    }
}

var lecScoreTotal = 0.0
var scoreSum = 0.0

for _ in 0..<20 {
    guard let input = readLine() else { continue }
    let scoreArr = input.components(separatedBy: " ")
    
    // 학점과 등급 추출
    let credit = Double(scoreArr[1]) ?? 0.0
    let grade = Grade(rawValue: scoreArr[2]) ?? .pass
    
    // P 등급은 계산에서 제외
    if grade != .pass {
        lecScoreTotal += credit
        scoreSum += credit * grade.score
    }
}

// 최종 평균 계산
if lecScoreTotal > 0 {
    print(scoreSum / lecScoreTotal)
} else {
    print("0.0") // 학점 총합이 0인 경우
}
