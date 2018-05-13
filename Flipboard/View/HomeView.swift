//
//  HomeView.swift
//  Flipboard
//
//  Created by Adrian Bolinger on 5/10/18.
//  Copyright © 2018 Adrian Bolinger. All rights reserved.
//

import UIKit

class HomeView: UIView {
  
  // MARK: IBOutlets
  @IBOutlet var contentView: UIView!
  @IBOutlet weak var searchTextField: UITextField!
  @IBOutlet weak var searchButton: UIButton!
  @IBOutlet weak var tableView: UITableView!
  
  // MARK: Variables
  var dataSource: [NewsCategory]!
  
  // MARK: Initialization
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  func commonInit() {
    Bundle.main.loadNibNamed("HomeView", owner: self, options: nil)
    addSubview(contentView)
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
    // configure data source
    let dataFactory = DataFactory()
    dataSource = dataFactory.generateData()
    
    configureSearchTextField()

    configureSearchButton()

    configureTableView()
  }
  
  // MARK: Initial Configuration
  
  fileprivate func configureSearchTextField() {
    // Configure Search TextField
    searchTextField.font = UIFont(name: FontString.firaSansCondensedBold.rawValue, size: 22)
    searchTextField.attributedPlaceholder = NSAttributedString(string: "EXPLORE MORE PASSIONS", attributes: [NSAttributedStringKey.foregroundColor : placeHolderColor])
    searchTextField.delegate = self
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleSingleTap(recognizer:)))
    self.addGestureRecognizer(tapGesture)
    searchTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
    searchTextField.tintColor = accentRed
  }
  
  fileprivate func configureSearchButton() {
    // configure UIButton
    searchButton.tintColor = accentRed
    searchButton.setImage(UIImage(named: IconString.magnifyingGlass.rawValue), for: .normal)
    searchButton.setTitle(nil, for: .normal)
    searchButton.setImage(nil, for: .highlighted)
    searchButton.setTitle("cancel", for: .highlighted)
  }
  
  fileprivate func configureTableView() {
    // configure UITableView
    let nib = UINib(nibName: "HomeViewTableViewCell", bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: "Cell")
    let tableViewSeparatorColor: UIColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
    tableView.layer.addBorder(edge: .top, color: tableViewSeparatorColor, thickness: 1.0)
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  
  // MARK: Helpers
  
  @objc func handleSingleTap(recognizer: UITapGestureRecognizer) {
    self.searchTextField.endEditing(true)
  }
  
//  func toggleSearchButton() {
  @objc func textFieldDidChange(textField: UITextField) {
    guard let text = textField.text else {
      searchButton.isHighlighted = true
      return
    }
    if text.count > 0 {
      self.searchButton.isHighlighted = true
    } else {
      self.searchButton.isHighlighted = false
    }
  }
}

extension HomeView: UITableViewDelegate {
  
}

extension HomeView: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataSource.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HomeViewTableViewCell
    cell.headlineLabel.text = dataSource[indexPath.row].title.uppercased()
    cell.subtitleLabel.text = dataSource[indexPath.row].subTitle
    return cell
  }
}

extension HomeView: UITextFieldDelegate {
  func textFieldDidBeginEditing(_ textField: UITextField) {
    textFieldDidChange(textField: textField)
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    textFieldDidChange(textField: textField)
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    textFieldDidChange(textField: textField)
    return true
  }
}
