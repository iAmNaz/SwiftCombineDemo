//
//  ViewController.swift
//  SwiftCombineDemo
//
//  Created by Locomoviles on 11/6/20.
//

import UIKit
import Combine

//Just, Future, Deferred, Empty, Sequence, @Published

class WithCombineViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    var current = 0;
    
    
    // Publisher declares a type that delivers a sequence of values over time
    let publisher = PassthroughSubject<Int, Never>() //CurrentValueSubject
    
    var cancellables = Set<AnyCancellable>()
    
    func bind() {
        // map operator
        let resultPublisher = publisher.map { (input) -> String in
            return "\(input)"
        }

        // assign subscriber/operator
        resultPublisher.assign(to: \.text!, on: label)
            .store(in: &cancellables)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    @IBAction func onTap(_ sender: Any) {
        current += 1
        publisher.send(current)
    }
}

