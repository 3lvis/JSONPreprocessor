//
//  FlattenCategory.swift
//  Demo
//
//  Created by Marthin Freij on 23/10/2016.
//
//

import Foundation

class FlattenCategory: Plugin {
    func process(input: [JSON]) -> [JSON] {
        var output: [JSON] = []
        for inputDictionary in input {
            var outputDictionary = inputDictionary
            if let categories = inputDictionary["categories"] as? [Any] {
                if categories.count > 0 {
                    outputDictionary["category"] = categories.first!
                }
            }
            output.append(outputDictionary)
        }
        return output
    }
}
