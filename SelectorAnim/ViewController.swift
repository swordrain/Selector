//
//  ViewController.swift
//  SelectorAnim
//
//  Created by lianli on 16/12/7.
//  Copyright © 2016年 lianli. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cities = ["Beijing", "Shanghai" , "Guangzhou", "Shenzhen"]
    @IBOutlet weak var listHeight: NSLayoutConstraint!
    var isListShowing = false
    @IBOutlet weak var list: UITableView!
    @IBOutlet weak var selectorButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.selectorButton.layer.borderColor = UIColor.gray.cgColor
        self.selectorButton.layer.borderWidth = 2
        
        self.list.layer.cornerRadius = 10
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showList(_ sender: Any) {
        
        let str = self.selectorButton.title(for: .normal)!
        if isListShowing {
            listHeight.constant = 0
            self.selectorButton.setTitle(str.substring(to: str.index(before: str.endIndex)) + "⇣", for: .normal)
        } else {
            listHeight.constant = 150
            self.selectorButton.setTitle(str.substring(to: str.index(before: str.endIndex)) + "⇡", for: .normal)
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        })
        
        isListShowing = !isListShowing
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = cities[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = cities[indexPath.row]
        self.selectorButton.setTitle(city + "⇣", for: .normal)
        listHeight.constant = 0
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        })
        isListShowing = false
    }
    
}

