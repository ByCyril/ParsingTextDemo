//
//  PraseText.swift
//  ParseText
//
//  Created by Cyril Garcia on 7/10/21.
//

import Foundation

enum ProblemType {
    case part
    case whole
    case precentage
}

struct NumberComponent {
    var value: Double
    var type: ProblemType
}

extension String  {
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}

/*
 
 What is 25% of 40 - whole
 5 is 20% of what number - part
 
 */

final class ParseText {
    
    func parse(_ text: String) -> [NumberComponent] {
        
        var components: [NumberComponent] = []
        
        let textArr: [String] = text.components(separatedBy: " ")
        
        for word in textArr {
            
            if word.contains("%") {
                
                if let num = Double(word.dropLast(1)) {
                    components.append(NumberComponent(value: num, type: .precentage))
                } 
                continue
            }
            
            if let num = Double(word) {
                components.append(NumberComponent(value: num, type: .whole))
            }
            
        }
        
        return components
    }
}
