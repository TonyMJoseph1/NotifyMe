//
//  ViewController.swift
//  NotifyMe
//
//  Created by Tony M Joseph on 12/09/2016.
//  Copyright (c) 2016 Tony M Joseph. All rights reserved.
//

import UIKit
import NotifyMe

class ViewController: UIViewController,NotifyMeDelegate {

    @IBOutlet weak var notifyMeButton: NotifyMe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        notifyMeButton.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didFinishTask(email: String, button: NotifyMe) {
        // do the task using the email
        button.complete(result: .success)  //if success
//        button.complete(result: .failure)   // show corresponding alert if error and call retry function
    }

}

