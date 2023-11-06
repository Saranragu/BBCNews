import XCTest
final class BBCNewsUITests: XCTestCase {
    private let app = XCUIApplication()
    func test_NavigateToDetailsScreen() {
        displayNews()
        selectFirstNews()
        validateDetailsScreenDisplayed()
    }
}

private extension BBCNewsUITests {
    func displayNews() {
        app.launchArguments = ["IsUITestRunning", "true"]
        app.launch()
    }
    func selectFirstNews() {
        app.collectionViews.firstMatch.cells.firstMatch.tap()
    }
    func validateDetailsScreenDisplayed() {
        XCTAssertTrue(app.descendants(matching: .any)["DetailsScreenTitle"].exists)
        XCTAssertTrue(app.descendants(matching: .any)["DetailsScreenDescription"].exists)
    }
 }
