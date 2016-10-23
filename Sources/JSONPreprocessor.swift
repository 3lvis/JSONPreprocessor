import Foundation

typealias JSON = [String: Any]

protocol Plugin {
    func process(input: [JSON]) -> [JSON]
}

final class JSONPreprocessor {
    
    var plugins: [Plugin] = []
    var source: [JSON]
    var destination: [JSON]
    
    init(source: [JSON]) {
        self.source = source
        self.destination = source
    }
    
    func use(plugin: Plugin) -> JSONPreprocessor {
        plugins.append(plugin)
        return self
    }
    
    func build() -> [JSON] {
        for p in plugins {
            destination = p.process(input: destination)
        }
        return destination
    }
}
