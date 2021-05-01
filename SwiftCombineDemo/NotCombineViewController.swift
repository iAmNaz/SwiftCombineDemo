//
//  ViewController.swift
//  SwiftCombineDemo
//
//  Created by Locomoviles on 11/6/20.
//

import UIKit

class NotCombineViewController: UIViewController {
    var current = 0;
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func onTap(_ sender: Any) {
        current += 1
        label.text = "\(current)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
