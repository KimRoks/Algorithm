import Foundation

var agents = [String]()

for _ in 0..<5 {
    let input = readLine()!
    agents.append(input)
}

var result = [Int]()

for (index, agent) in agents.enumerated() {
    if agent.range(of: "FBI", options: .regularExpression) != nil {
        result.append(index + 1)
    }
}

if result.isEmpty {
    print("HE GOT AWAY!")
} else {
    print(result.map { String($0) }.joined(separator: " "))
}
