
import Foundation

struct Heap {
    private var array = [Int]()
    var isEmtpy: Bool { array.isEmpty }
    
    mutating func enheap(_ newElement: Int) {
        var childIndex = array.count
        var parentIndex = (childIndex - 1) / 2
        array.append(newElement)
        
        while childIndex > 0 && array[parentIndex] < array[childIndex] {
            array.swapAt(parentIndex, childIndex)
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
    }
    
    mutating func deheap() -> Int {
        if array.isEmpty {
            return -1
        }
        
        if array.count == 1 {
            return array.removeLast()
        }
        
        let value = array[0]
        array[0] = array.removeLast()
        
        moveDown(0)
        
        return value
    }
    
    mutating private func moveDown(_ index: Int) {
        let leftChildIndex = index * 2 + 1
        let rightChildIndex = leftChildIndex + 1
        
        var target = index
        if leftChildIndex < array.count && array[target] < array[leftChildIndex] {
            target = leftChildIndex
        }
        if rightChildIndex < array.count && array[target] < array[rightChildIndex] {
            target = rightChildIndex
        }
        
        if target != index {
            array.swapAt(target, index)
            moveDown(target)
        }
    }
}



let n = Int(readLine()!)!

var result: [Int] = []
var heap = Heap()



for _ in 1...n {
    
    let a = readLine()!.split(separator: " ").map{ Int($0)!}
    
    if a[0] == 0 {
        
        let present = heap.deheap()
        
        result.append(present)
    } else {
        
        for i in 1...a[0] {
            heap.enheap(a[i])
        }
    }
}


result.forEach { num in
    print(num)
}


