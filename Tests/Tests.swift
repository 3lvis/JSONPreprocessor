import XCTest

class Tests: XCTestCase {

    func testHtmlEntities() {
        
        let json = loadDummyData()
        
        let newJson = JSONPreprocessor(source: json)
                        .use(plugin: HtmlEntities())
                        .use(plugin: FlattenCategory())
                        .build()
        
        let first = newJson[0] as JSON
        XCTAssertEqual(first["title"] as? String, "Foo & Bar")
        XCTAssertEqual(first["category"] as? Int, 1)
        
        let second = newJson[1] as JSON
        XCTAssertEqual(second["title"] as? String, "Foo & Bar")
        XCTAssertEqual(second["category"] as? Int, 2)
    }
    
    func loadDummyData() -> [JSON] {
        let url = Bundle(for: type(of: self)).url(forResource: "data", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [JSON]
        return json
    }
}
