//
//  DetailViewController.swift
//  ContactSearch
//
//  Created by Efrain Ayllon on 10/24/16.
//  Copyright © 2016 Efrain Ayllon. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func cancelWasPressed(){
    
     self.dismiss(animated: true, completion: {})
    }
    
    
    
}
