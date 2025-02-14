import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var progresses = progresses
    var speeds = speeds
    var result = [Int]()
    
    var count = 0
    
    while !progresses.isEmpty {
        for i in 0..<progresses.count {
            progresses[i] += speeds[i]
        }
        
        while !progresses.isEmpty && progresses[0] >= 100 {
            progresses.removeFirst()
            speeds.removeFirst()
            count += 1
        }
        
        if count > 0 {
            result.append(count)
            count = 0 
        }
    }
    
    return result
}
