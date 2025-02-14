import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    
    var dict: [String: [(Int, Int)]] = [:]
    var playCount: [String: Int] = [:]

    for i in 0..<genres.count {
        dict[genres[i], default: []].append((plays[i], i))
        playCount[genres[i], default: 0] += plays[i]
    }

    let sortedArr = playCount.sorted { $0.value > $1.value }.map { $0.key }

    var result: [Int] = []

    for item in sortedArr {
        let sortedSongs = dict[item]!.sorted {
            if $0.0 == $1.0 {
                return $0.1 < $1.1
            }
            return $0.0 > $1.0
        }
        
        result.append(contentsOf: sortedSongs.prefix(2).map { $0.1 })
    }
    
    return result
}
