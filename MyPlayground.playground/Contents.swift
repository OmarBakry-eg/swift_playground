

func getsd(nums :  [Int]) -> String {
    var arr : [Int] = []
    if nums.count <= 2 {
        let strArr : [String] = nums.map {String($0)}
        let str = strArr.joined()
        return str
    }
        for j in 1..<nums.count{
            var str = String(nums[j] + nums[j-1])
            if str.count >= 2 {
                str.removeFirst()
            }
            arr.append(Int(str)!)
        }
    if arr.count <= 2 {
        let strArr : [String] = arr.map {String($0)}
        let str = strArr.joined()
        return str
    } else {
        return getsd(nums: arr)
    }
}

print(getsd(nums: [4,5]))




// Not got it
func getMinimumCost(parcels: [Int], k: Int) -> Int {
    if k == parcels.count {
            return 0
        }
    var arr : [Int] = []
    //(repeating: 0, count: abs(k - parcels.count))
    for i in parcels {
        if parcels.contains(i+1){
            arr.append(i-1)
        }else {
            arr.append(i+1)
        }
    }
    var sum = 0
    for i in arr {
        sum += i
    }
    return sum
}
getMinimumCost(parcels: [2,3,6,10,11], k: 9)
