

func mergeSort(arr : [Int]) -> [Int] {
    guard arr.count > 1 else {
        return arr
    }
    let middleIndex = arr.count / 2
    let leftArray = mergeSort(arr: Array(arr[0..<middleIndex]))
    let rightArray = mergeSort(arr: Array(arr[middleIndex..<arr.count]))
    return merge(leftArr: leftArray, rightArr: rightArray)
}

func merge(leftArr: [Int] , rightArr : [Int]) -> [Int] {
    var leftIndex = 0 , rightIndex = 0
    var sortedArray = [Int]()
    sortedArray.reserveCapacity(leftArr.count + rightArr.count) // to ensure its size
    
    while leftIndex < leftArr.count && rightIndex < rightArr.count {
        if leftArr[leftIndex] < rightArr[rightIndex] {
            sortedArray.append(leftArr[leftIndex])
            leftIndex += 1
        }else if leftArr[leftIndex] > rightArr[rightIndex] {
            sortedArray.append(rightArr[rightIndex]) // we always append the smaller one first
            rightIndex += 1
        } else { // they're equal
            sortedArray.append(leftArr[leftIndex])
            leftIndex += 1
            sortedArray.append(rightArr[rightIndex]) // we always append the smaller one first
            rightIndex += 1
        }
    }
    
    
    // it means that either the leftArr or the rightArr has its contents completely merged into the sortedArray. At this point, you no longer need to do comparisons. Just append the rest of the contents of the other array until there is no more to append
    while leftIndex < leftArr.count {
        sortedArray.append(leftArr[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < rightArr.count {
        sortedArray.append(rightArr[rightIndex])
        rightIndex += 1
    }
    
    return sortedArray
}

print(mergeSort(arr: [6,7,9,2,7,8,1,3,0]))


// time : O(nlog(n))
// space : O(n) it worse that bubble sort in space because bubble sort O(1) it did not need any extra arrays
