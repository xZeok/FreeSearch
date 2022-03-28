//
//  SearchViewModelTest.swift
//  FreeSearchTests
//
//  Created by Jaime Capponi Zerene on 27-03-22.
//

import XCTest
import SwiftUI
@testable import FreeSearch

class SearchViewModelTest: XCTestCase {

    var sut: SearchViewModel!
    var mockSearchViewService: MockSearchViewService!
    
    override func setUp()  {
        super.setUp()
        mockSearchViewService = MockSearchViewService()
        sut = .init(searchService: mockSearchViewService)
    }
    
    override func tearDown() {
        super.tearDown()
        mockSearchViewService = nil
        sut = nil
    }
    
    func testSearchSuccess() {
        // Given
        mockSearchViewService.success = true
        // When
        sut.search(query: "test")
        // Then
        XCTAssertFalse(sut.isLoading)
        XCTAssertNil(sut.alertItem)
        XCTAssertEqual(sut.items, Item.mockItems())
    }
    
    func testSearchErrorUnableToComplete() {
        // Given
        mockSearchViewService.success = false
        mockSearchViewService.error = .unableToComplete
        // When
        sut.search(query: "test")
        // Then
        XCTAssertFalse(sut.isLoading)
        XCTAssertTrue(sut.items.isEmpty)
        XCTAssertNotNil(sut.alertItem)
    }
    
    func testSearchErrorInvalidResponse() {
        // Given
        mockSearchViewService.success = false
        mockSearchViewService.error = .invalidResponse
        // When
        sut.search(query: "test")
        // Then
        XCTAssertFalse(sut.isLoading)
        XCTAssertTrue(sut.items.isEmpty)
        XCTAssertNotNil(sut.alertItem)
    }
    
    func testSearchErrorInvalidData() {
        // Given
        mockSearchViewService.success = false
        mockSearchViewService.error = .invalidData
        // When
        sut.search(query: "test")
        // Then
        XCTAssertFalse(sut.isLoading)
        XCTAssertTrue(sut.items.isEmpty)
        XCTAssertNotNil(sut.alertItem)
    }
    
    func testSearchErrorInvalidURL() {
        // Given
        mockSearchViewService.success = false
        mockSearchViewService.error = .invalidURL
        // When
        sut.search(query: "test")
        // Then
        XCTAssertFalse(sut.isLoading)
        XCTAssertTrue(sut.items.isEmpty)
        XCTAssertNotNil(sut.alertItem)
    }
    
    func testSearchErrorInvalidRequest() {
        // Given
        mockSearchViewService.success = false
        mockSearchViewService.error = .invalidRequest
        // When
        sut.search(query: "test")
        // Then
        XCTAssertFalse(sut.isLoading)
        XCTAssertTrue(sut.items.isEmpty)
        XCTAssertNotNil(sut.alertItem)
    }
}
