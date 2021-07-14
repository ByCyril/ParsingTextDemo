//
//  PraseText.swift
//  ParseText
//
//  Created by Cyril Garcia on 7/10/21.
//

import Foundation
import NaturalLanguage

enum ProblemType {
    case part
    case whole
    case precentage
}

struct NumberComponent {
    var value: Double
    var type: ProblemType
}

final class ParseText {
    
    var nlModel: NLModel?
    
    init() {
        do {
            let model = try PercentageTypePredictor(configuration: .init()).model
            nlModel = try NLModel(mlModel: model)
        } catch {
            print("Error", error.localizedDescription)
        }
    }
 
    func parse(_ text: String) -> [NumberComponent] {
        
        var type: ProblemType?
        
        let pred = nlModel?.predictedLabel(for: text) ?? "na"
        
        switch pred {
        case "whole":
            type = .whole
        case "part":
            type = .part
        default:
            type = nil
        }
        
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
                components.append(NumberComponent(value: num, type: type!))
            }
            
        }
        
        return components
    }
}
