import Foundation

class HtmlEntities: Plugin {
    
    var key: String
    var newKey: String?
    
    init(key: String, newKey: String? = nil) {
        self.key = key
        self.newKey = newKey
    }
    
    func process(input: [JSON]) -> [JSON] {
        var output: [JSON] = []
        for inputDictionary in input {
            var outputDictionary = inputDictionary
            if let title = inputDictionary[key] as? String {
                outputDictionary[newKey ?? key] = title.replacingOccurrences(of: "&#038;", with: "&")
            }
            output.append(outputDictionary)
        }
        return output
    }
}
