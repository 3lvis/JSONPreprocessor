//
//  HtmlEntities.swift
//  Demo
//
//  Created by Marthin Freij on 23/10/2016.
//
//

import Foundation

class HtmlEntities: Plugin {
    func process(input: [JSON]) -> [JSON] {
        var output: [JSON] = []
        for inputDictionary in input {
            var outputDictionary = inputDictionary
            if let title = inputDictionary["title"] as? String {
                outputDictionary["title"] = title.replacingOccurrences(of: "&#038;", with: "&")
            }
            output.append(outputDictionary)
        }
        return output
    }
}
