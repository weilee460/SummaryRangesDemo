//
//  main.swift
//  SummaryRangesDemo
//
//  Created by ying on 16/6/20.
//  Copyright © 2016年 ying. All rights reserved.
//

/* leetcode
228. Summary Ranges My Submissions QuestionEditorial Solution
Total Accepted: 48531 Total Submissions: 194471 Difficulty: Medium
Given a sorted integer array without duplicates, return the summary of its ranges.

For example, given [0,1,2,4,5,7], return ["0->2","4->5","7"].
*/
import Foundation


func summaryRanges(nums: [Int]) -> [String] {
    //assert(nums.count > 0, "nums Array must have element!")
    var rangeString: [String] = []
    if nums.count > 0
    {
        var headerIndex = 0
        var tailIndex = 0
        var rangeStringTemp = ""
        while (headerIndex < nums.count)
        {
            tailIndex = headerIndex
            while (tailIndex < nums.count && nums[tailIndex] == nums[headerIndex] + (tailIndex - headerIndex))
            {
                tailIndex = tailIndex + 1
            }
            if (tailIndex - headerIndex) == 1 {
                rangeStringTemp = "\(nums[headerIndex])"
            }
            else {
                rangeStringTemp = "\(nums[headerIndex]) -> \(nums[tailIndex - 1])"
            }
            rangeString.append(rangeStringTemp)
            headerIndex = tailIndex
        }
    }
    return rangeString
}

let nums = [0, 1, 2, 4, 5, 7]
//let nums = [0]
//let nums: [Int] = []
//let nums = [0, 2, 4, 8, 9, 11, 12, 13, 14]
//let nums = [1, 2, 3, 4, 5, 6]
print(summaryRanges(nums))


