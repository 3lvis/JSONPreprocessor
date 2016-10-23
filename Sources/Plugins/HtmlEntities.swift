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
