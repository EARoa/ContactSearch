//
//  ViewController.swift
//  ContactSearch
//
//  Created by Efrain Ayllon on 10/24/16.
//  Copyright © 2016 Efrain Ayllon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchingFor :UITextField!
    
    var apiKey = "31e69f06c4f1d436"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

            
    
    @IBAction func searchButtonPressed(){
        let url = "https://api.fullcontact.com/v2/person.json?email=\(searchingFor.text!)"
        
        guard let apiURL = NSURL(string: url) else {
            fatalError("URL incorrect")
        }
        
        let session = URLSession.shared
        let request = NSMutableURLRequest(url: apiURL as URL)
        request.httpMethod = "POST"
        request.addValue(apiKey, forHTTPHeaderField: "X-FullContact-APIKey")
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        print(request)
        
        let parameters = [
            "email" : "\(searchingFor.text!)",
        ]
        
        
        request.httpBody = try! JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        session.dataTask(with: request as URLRequest) { (data :Data?, response :URLResponse?, error :Error?) in
            
            print("finished")
            print(response!)
            
            }.resume()
        
        
        // self.dismiss(animated: true, completion: {})
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reload"), object: nil)
    }

}
