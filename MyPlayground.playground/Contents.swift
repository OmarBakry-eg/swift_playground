

func bubbleSort(arr:[Int]) -> [Int] {
    var array = arr
    for _ in 0..<array.count {
        for j in 1..<array.count {
            if array[j] < array[j-1]{
               let temp = array[j-1]
                array[j-1] = array[j]
                array[j] = temp
            }
        }
    }
    return array
}

print(bubbleSort(arr: [4,7,8,2,1,5,8,9,0]))

// O(n^2)
