import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result = [Int]()
    for item in commands {
        let arr = array
        let (i,j,k) = (item[0] - 1, item[1] - 1, item[2] - 1)
        
        var slicedArr = Array(arr[i...j])
        
        slicedArr.sort()
        
        result.append(slicedArr[k])
    }
    
    return result
}