

func quicksort(a: [Int]) -> [Int]{
    guard a.count > 1 else { return a }

     let pivot = a[a.count/2] // middle index for best case time O(n log n)
     let less = a.filter { $0 < pivot } // return an arr of numbers that less than pivot ( Spliting )
     let equal = a.filter { $0 == pivot } // return an arr of numbers that are equal pivot
     let greater = a.filter { $0 > pivot } // return an arr of numbers that bigger than pivot ( Spliting )

    return quicksort(a:less) + equal + quicksort(a:greater)
    // return recursively for less and bigger arrays to generate a new pivot for them and sort them for low to high and finally collect them all within one array
}

//print([1] + [2]) // [1,2]

print(quicksort(a: [6,7,9,2,7,8,1,3,0]))


// time : O(nlog(n)) for best, worst : O(n^2)
// worst case happened when we didn't split the arry and choose value-value for sorting
// space : O(1)
