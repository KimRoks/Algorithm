import Foundation

let nl = readLine()!.split(separator: " ").map { Int($0)! }
let (n, l) = (nl[0], nl[1])

var trafficLights = [[Int]]()

for _ in 0..<n {
    let drg = readLine()!.split(separator: " ").map { Int($0)! }
    trafficLights.append(drg)
}

var currentTime = 0
var previousPosition = 0

for light in trafficLights {
    let (d,r,g) = (light[0], light[1], light[2])
    if d == 1 {
        continue
    }
    
    currentTime += d - previousPosition
    previousPosition = d
    
    let cycle = r + g
    let breakZone = currentTime % cycle
    
    if breakZone < r {
        let waitTime = r - breakZone
        currentTime += waitTime
    }
}
currentTime += l - previousPosition

print(currentTime)
