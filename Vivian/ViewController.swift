//
//  ViewController.swift
//  Vivian
//
//  Created by Hoang Tran on 20/5/17.
//  Copyright © 2017 Hoang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  fileprivate static let reuseID = "reuseID"
  
  fileprivate var suggestions: [String] = [] {
    didSet {
      tableView.reloadData()
    }
  }
  
  @IBOutlet fileprivate weak var tableView: UITableView!
  @IBOutlet fileprivate weak var noResultsLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(UITableViewCell.self,
                       forCellReuseIdentifier: ViewController.reuseID)
  }
  
}

extension ViewController {
  
  private func showSuggestions(_ show: Bool) {
    noResultsLabel.isHidden = show
    tableView.isHidden = !show
  }
  
  @IBAction private func onSearchTextChanged(_ textField: UITextField) {
    showSuggestions(true)
    
    guard let text = textField.text, !text.isEmpty else {
      suggestions = []
      return
    }
    
    if text == "ba" {
      suggestions = ["ban", "banana", "banish"]
    } else {
      suggestions = []
      showSuggestions(false)
    }
  }
  
}

extension ViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return suggestions.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: ViewController.reuseID,
                                             for: indexPath)
    let suggestion = suggestions[indexPath.row]
    cell.textLabel?.text = suggestion
    cell.accessibilityLabel = suggestion
    return cell
  }
  
}
