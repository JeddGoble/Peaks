//
//  ViewController.swift
//  Peaks
//
//  Created by Jedd Goble on 5/11/16.
//  Copyright © 2016 tangital. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /*
    Given an array of unsorted integers, create a function which finds number "peaks." A peak is defined as an index for which the adjacent (previous and next) index values are lesser than that index value. The function should log index and value to the console, as well as return an array of all peak values. Once a solution is found, optimize for execution time.
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let exampleArray = [18, 2, 24, 87, 19, 7, 58, 13, 99, 45, 82, 22]
        
        print("-- Iterating by one --")
        
        let startTimeOnes = NSDate().timeIntervalSinceReferenceDate
        findPeaksByOnes(exampleArray)
        let executionTimeOnes = NSDate().timeIntervalSinceReferenceDate - startTimeOnes
        
        print("-- Iterating by two --")
        
        let startTimeTwos = NSDate().timeIntervalSinceReferenceDate
        findPeaksByTwos(exampleArray)
        let executionTimeTwos = NSDate().timeIntervalSinceReferenceDate - startTimeTwos
        
        print("----")
        
        if executionTimeOnes < executionTimeTwos {
            print("Iterating by one is the faster algorithm")
        } else {
            print("Iterating by two is the faster algorithm")
        }
        
    }
    
    func findPeaksByOnes (unsortedArray: [Int]) -> [Int] {
        
        var peaksArray: [Int] = []
        
        for i in 1...unsortedArray.count - 2 {
            
            let value = unsortedArray[i]
            
            if unsortedArray[i - 1] < value && unsortedArray[i + 1] < value {
                
                print("Found peak of value \(value) at index \(i)")
                peaksArray.append(value)
                
            }
            
        }
        
        return peaksArray
        
    }
    
    func findPeaksByTwos (unsortedArray: [Int]) -> [Int] {
        
        var foundGreaterOnLastPass: Bool = false
        
        if unsortedArray[2] > unsortedArray[1] {
            foundGreaterOnLastPass = true
        }
        
        var i: Int = 3
        var peaksArray: [Int] = []
        
        while i < unsortedArray.count - 1 {
            
            let previousValue = unsortedArray[i - 1]
            let currentValue = unsortedArray[i]
            let nextValue = unsortedArray[i + 1]
            
            if previousValue > currentValue && foundGreaterOnLastPass {
                
                print("Found peak of value \(previousValue) at index \(i - 1)")
                peaksArray.append(previousValue)
                
                
            } else if currentValue > previousValue && currentValue > nextValue {
                
                print("Found peak of value \(currentValue) at index \(i)")
                peaksArray.append(currentValue)
                
            }
            
            if nextValue > currentValue {
                foundGreaterOnLastPass = true
            } else {
                foundGreaterOnLastPass = false
            }
            
            i += 2
        }
        
        let secondToLastValue: Int = unsortedArray[unsortedArray.count - 2]
        
        if foundGreaterOnLastPass && secondToLastValue > unsortedArray.last {
            
            print("Found peak of value \(secondToLastValue) at index \(unsortedArray.count - 1)")
            peaksArray.append(secondToLastValue)
            
        }
        
        return peaksArray
        
    }

}

