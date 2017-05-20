//
//  KIF+Extension.swift
//  Vivian
//
//  Created by Hoang Tran on 20/5/17.
//  Copyright © 2017 Hoang. All rights reserved.
//

import KIF

extension XCTestCase {
  func tester(file: String = #file, _ line: Int = #line) -> KIFUITestActor {
    return KIFUITestActor(inFile: file, atLine: line, delegate: self)
  }
  
  func system(file: String = #file, _ line: Int = #line) -> KIFSystemTestActor {
    return KIFSystemTestActor(inFile: file, atLine: line, delegate: self)
  }
}

extension KIFTestActor {
  func tester(file: String = #file, _ line: Int = #line) -> KIFUITestActor {
    return KIFUITestActor(inFile: file, atLine: line, delegate: self)
  }
  
  func system(file: String = #file, _ line: Int = #line) -> KIFSystemTestActor {
    return KIFSystemTestActor(inFile: file, atLine: line, delegate: self)
  }
}
