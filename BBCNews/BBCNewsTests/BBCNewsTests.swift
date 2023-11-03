//
//  BBCNewsTests.swift
//  BBCNewsTests
//
//  Created by Saravanan R on 02/11/23.
//

import XCTest
@testable import BBCNews

final class BBCNewsTests: XCTestCase {
    var testObj: APIMockService!
    var viewModel: NewsViewModelCall!
    override func setUp() {
        super.setUp()
        testObj = APIMockService()
        viewModel = NewsViewModelCall(service: testObj)
    }

    override func tearDown() {
        testObj = nil
        super.tearDown()
    }
    func test_Loading_WhenServiceNotRespond() {
        viewModel.getArticles()
        XCTAssertTrue(isLoading())
    }
    func test_fetch_newsarticles() {
        testObj.mockSuccess()
        viewModel?.getArticles()
        XCTAssertTrue(isSuccess())
        XCTAssertEqual(viewModel.articles.count, 1)
    }
    func test_ErrorState_WhenErrorIsDecodeError() {
        testObj.mockFailure(.decodingError)
        viewModel?.getArticles()

        XCTAssertTrue(isError())
    }
    func test_ErrorState_WhenErrorIsErrorcode404() {
        testObj.mockFailure(.errorCode(404))
        viewModel?.getArticles()

        XCTAssertTrue(isError())
    }
    func test_ErrorState_WhenErrorIsUnknown() {
        testObj.mockFailure(.unknown)
        viewModel?.getArticles()

        XCTAssertTrue(isError())
    }
    private func isLoading() -> Bool {
        if case .loading = viewModel.state {
            return true
        }
        return false
    }
    private func isError() -> Bool {
        if case .failed = viewModel.state {
            return true
        }
        return false
    }
    private func isSuccess() -> Bool {
        if case .success = viewModel.state {
            return true
        }
        return false
    }
}
