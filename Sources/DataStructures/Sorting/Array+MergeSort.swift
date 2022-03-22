//
//  MergeSort.swift
//  
//
//  Created by Diego Jerez Barroso on 21/03/2022.
//

/*
 === MergeSort ===

 The idea is to divide the array into different halves until we have arrays of one element.
 After this, we start to merge pairs of these arrays, comparing its numbers. If we do this recursively,
 we get the sorted array.

 MergeSort is good for data that is running between disks. Example: Google sorts the Internet: as the
 Internet doesn't fit in RAM memory, they have to use disks to store all the websites in the world. If
 they want to sort them, MergeSort is a good algorithm for this. (QuickSort is good for sorting internal
 data, i.e. data that fits in RAM memory)

 */

import Foundation

public extension Array where Element == Int {

    mutating func mergeSort() -> Self {
        var copy = self
        mergeSort(&copy, numberOfElements: count)
        return copy
    }

    private mutating func mergeSort(_ array: inout [Int], numberOfElements: Int) {

        guard numberOfElements > 1 else { return }

        // Find middle position and create left and right partitions:

        let mid: Int = numberOfElements / 2
        var leftArray: [Int] = .init(repeating: -1, count: mid)
        var rightArray: [Int] = .init(repeating: -1, count: (numberOfElements - mid))

        // Fill the parititions:

        for i in 0 ..< mid {
            leftArray[i] = array[i]
        }

        for i in mid ..< numberOfElements {
            rightArray[i - mid] = array[i]
        }

        // Apply merge sort on the left partition:

        mergeSort(&leftArray, numberOfElements: mid)

        // Apply merge sort on the right partition:

        mergeSort(&rightArray, numberOfElements: numberOfElements - mid)

        // Merge the partitions:

        merge(
            originalArray: &array,
            leftArray: &leftArray,
            rightArray: &rightArray,
            leftIndex: mid,
            rightIndex: numberOfElements - mid
        )
    }

    private func merge(
        originalArray: inout [Int],
        leftArray: inout [Int],
        rightArray: inout [Int],
        leftIndex: Int,
        rightIndex: Int
    ) {
        var i = 0
        var j = 0
        var k = 0

        while i < leftIndex && j < rightIndex {
            if leftArray[i] <= rightArray[j] {
                originalArray[k] = leftArray[i]
                i += 1
                k += 1
            } else {
                originalArray[k] = rightArray[j]
                j += 1
                k += 1
            }
        }

        // Fill remaining values if any:

        while i < leftIndex {
            originalArray[k] = leftArray[i]
            i += 1
            k += 1
        }

        while j < rightIndex {
            originalArray[k] = rightArray[j]
            j += 1
            k += 1
        }

        print(originalArray)
    }
}
