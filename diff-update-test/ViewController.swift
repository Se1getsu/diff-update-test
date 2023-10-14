//
//  ViewController.swift
//  
//  
//  Created by Seigetsu on 2023/10/14
//  
//

import UIKit

class ViewController: UIViewController {
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private var data = ["zero", "one"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame = view.bounds
        view.addSubview(tableView)
        
        tableView.dataSource = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(didTapButton))
    }
    
    @objc func didTapButton() {
        data.append("two")  // [zero, one] -> [zero, one, two]
        tableView.insertRows(at: [IndexPath(row: 2, section: 0)], with: .automatic)
        
//        data.removeLast()  // [zero, one] -> [zero]
//        tableView.deleteRows(at: [IndexPath(row: 1, section: 0)], with: .automatic)
        
//        data = []  // [zero, one] -> []
//        tableView.deleteRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var config = cell.defaultContentConfiguration()
        config.text = data[indexPath.row]
        cell.contentConfiguration = config
        return cell
    }
}
