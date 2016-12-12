//
//  ViewController.swift
//  tran
//
//  Created by Lova on 2016/12/13.
//  Copyright © 2016年 Lova. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    @IBAction func cc(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

class ViewController: UIViewController {

    let tran = LOTransition(from: UIView())

    override func viewDidLoad() {
        super.viewDidLoad()
        self.transitioningDelegate = self.tran
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.transitioningDelegate = self.tran
    }

    @IBAction func backToMain(segue: UIStoryboardSegue) {

    }
}


