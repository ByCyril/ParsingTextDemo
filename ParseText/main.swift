//
//  main.swift
//  ParseText
//
//  Created by Cyril Garcia on 7/10/21.
//

import Foundation

func calculate(_ text: String) {
    let parser = ParseText()

    let results = parser.parse(text)

    var part: Double?
    var whole: Double?
    var percentage: Double = 0.0

    for res in results {
        
        switch res.type {
        case .part:
            part = res.value
        case .whole:
            whole = res.value
        case .precentage:
            percentage = res.value
        }
    }

    print(text)
    
    if let part = part {
        whole = part / (percentage / 100.0)
        print("Answer: ",whole!)
    } else if let whole = whole {
        part = whole * (percentage / 100.0)
        print("Answer: ",part!)
    }
    print("")
}

calculate("What is 50% of 20")
calculate("16 is 50% of what number?")
calculate("John picked 50 apples and 16% of them are bad. How many bad apples are there?")
calculate("John picked 54 good apples, which is 60% of all apples he picked. How many apples did John picked?")
