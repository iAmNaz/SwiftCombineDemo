//
//  ViewController.swift
//  SwiftCombineDemo
//
//  Created by Locomoviles on 11/6/20.
//

import UIKit
import Combine

class RefactoredCombineViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    let counter = Counter()
    
    var cancellables = Set<AnyCancellable>()
    
    @IBAction func onTap(_ sender: Any) {
        counter.increment()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    func bind() {
        // $ identifier lets you access the generated publisher instance
        counter.$value.assign(to: \.text!, on: label).store(in: &cancellables)
    }
}

class Counter {
    // Property wrapper publisher
    @Published private (set) var value: String = "0"

    private var current = 0
    
    func increment() {
        current += 1
        value = "\(current)"
    }
}

