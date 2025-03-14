struct Heap<T: Comparable> {
    private var array: [T] = []
    private let isOrderedBefore: (T, T) -> Bool
    
    init(isMinHeap: Bool = true) {
        self.isOrderedBefore = isMinHeap ? { $0 < $1 } : { $0 > $1 }
    }
    
    var isEmpty: Bool { array.isEmpty }
    var count: Int { array.count }
    var peek: T? { array.first }
    
    /// 요소 추가 (O(log n))
    mutating func insert(_ value: T) {
        array.append(value)
        siftUp(from: array.count - 1)
    }
    
    /// 최소/최대값 제거 및 반환 (O(log n))
    mutating func remove() -> T? {
        guard !array.isEmpty else { return nil }
        if array.count == 1 { return array.removeLast() }
        
        let root = array[0]
        array[0] = array.removeLast()
        siftDown(from: 0)
        return root
    }
    
    /// 힙 정렬 (힙을 이용한 정렬 반환, O(n log n))
    mutating func heapSort() -> [T] {
        var sorted = [T]()
        while let value = remove() {
            sorted.append(value)
        }
        return sorted
    }
    
    /// 위로 올리며 힙 성질 유지 (O(log n))
    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = (child - 1) / 2
        
        while child > 0 && isOrderedBefore(array[child], array[parent]) {
            array.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }
    
    /// 아래로 내리며 힙 성질 유지 (O(log n))
    private mutating func siftDown(from index: Int) {
        var parent = index
        let count = array.count
        
        while true {
            let left = 2 * parent + 1
            let right = left + 1
            var target = parent
            
            if left < count && isOrderedBefore(array[left], array[target]) {
                target = left
            }
            if right < count && isOrderedBefore(array[right], array[target]) {
                target = right
            }
            if target == parent { break }
            
            array.swapAt(parent, target)
            parent = target
        }
    }
}


let n = Int(readLine()!)!

var heap = Heap<Int>()

for i in 0..<n {
    let input = Int(readLine()!)!
    if input == 0 {
        print(heap.remove() ?? 0)
    } else {
        heap.insert(input)
    }
}
