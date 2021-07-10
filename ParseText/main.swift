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

    if let part = part {
        whole = part / (percentage / 100.0)
        print("Answer: ",whole!)
    } else if let whole = whole {
        part = whole * (percentage / 100.0)
        print("Answer: ",part!)
    }

}

calculate("What is 50% of 20")
