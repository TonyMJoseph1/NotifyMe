//
//  ViewController.swift
//  NotifyMe
//
//  Created by Tony M Joseph on 12/09/2016.
//  Copyright (c) 2016 Tony M Joseph. All rights reserved.
//

import UIKit
import NotifyMe

class ViewController: UIViewController {

    @IBOutlet weak var notifyMeButton: NotifyMe!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        notifyMeButton.fetchEmail { (_) in
            // Do the action with the fetched email self.notifyMeButton.emailTextField.text
            print(self.notifyMeButton.emailTextField.text ?? String())
            self.notifyMeButton.complete(result: .success) // if success
//            self.notifyMeButton.complete(result: .failure) // if failure
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
