

func ArrayChallenge(_ arr: [Int]) -> Int {
    var temp = -1
    for i in 0..<arr.count-1 {
        for j in i+1..<arr.count {
            print("i is \(i)")
            print("J is \(j)")
            if arr[j] > arr[i] && temp < arr[j] - arr[i]{
                temp = arr[j] - arr[i]
            }
        }
    }
  
  return temp

}

print(ArrayChallenge([14,20,4,12,5,11]))
