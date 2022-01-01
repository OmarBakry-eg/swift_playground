

var hunderd = [Int]()
for i in 1...100 {
    hunderd.append(i)
}


func binarySearch(searchValue: Int, searchInArray : [Int]) -> Bool {
    var leftIndex = 0
    var rightIndex = searchInArray.count - 1
    
    while leftIndex <= rightIndex {
        let middelIndex = (leftIndex + rightIndex) / 2
        let middelValue = searchInArray[middelIndex]
        print("Middel is : \(middelValue), LeftIndex : \(leftIndex), RightIndex : \(rightIndex)\n LeftVAL : \(searchInArray[leftIndex]) , RightVAL : \(searchInArray[rightIndex])")
        
        if middelValue == searchValue {
            return true
        }
        if searchValue > middelValue { // moving to right side ```bigger side```
            leftIndex = middelIndex + 1
        }
        if searchValue < middelValue { // moving to left side ```Smaller side```
            rightIndex =  middelIndex - 1
        }
    }
    return false
}

print(binarySearch(searchValue: 12, searchInArray: hunderd))
