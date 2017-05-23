//
//  VivianUITests.swift
//  VivianUITests
//
//  Created by Hoang Tran on 20/5/17.
//  Copyright © 2017 Hoang. All rights reserved.
//

import KIF

struct Label {
  static let noResults = "No Results"
  static let searchBar = "Search Bar"
}

class VivianUITests: KIFTestCase {
  
  func testSearchNotFound() {
    expectNotToSee(Label.noResults)
    fillIn("adsdsdsds")
    expectToSee(Label.noResults)
    expectNotToSeeSuggestions(suggestions)
    clearText()
  }
  
  let suggestions: [String] = ["ban", "banana", "banish"]
  
  func testSearchSuggestions() {
    expectNotToSeeSuggestions(suggestions)
    expectNotToSee(Label.noResults)
    fillIn("ba")
    expectToSeeSuggestions(suggestions)
    expectNotToSee(Label.noResults)
  }
  
}

extension VivianUITests {
  
  func fillIn(_ text: String, _ file: String = #file, _ line: Int = #line) {
    tester(file: file, line).clearText(fromAndThenEnterText: text, intoViewWithAccessibilityLabel: Label.searchBar)
  }
  
  func expectToSee(_ text: String, _ file: String = #file, _ line: Int = #line) {
    tester(file: file, line).waitForView(withAccessibilityLabel: text)
  }
  
  func expectNotToSee(_ text: String, _ file: String = #file, _ line: Int = #line) {
    tester(file: file, line).waitForAbsenceOfView(withAccessibilityLabel: text)
  }
  
  func expectToSeeSuggestions(_ suggestions: [String], _ file: String = #file, _ line: Int = #line) {
    for suggestion in suggestions {
      expectToSee(suggestion, file, line)
    }
  }
  
  func expectNotToSeeSuggestions(_ suggestions: [String], _ file: String = #file, _ line: Int = #line) {
    for suggestion in suggestions {
      expectNotToSee(suggestion, file, line)
    }
  }
  
  func clearText(_ file: String = #file, _ line: Int = #line) {
    tester(file: file, line).clearTextFromView(withAccessibilityLabel: Label.searchBar)
  }
  
}
