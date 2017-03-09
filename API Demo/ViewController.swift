//
//  ViewController.swift
//  API Demo
//
//  Created by Liz Healy on 2/2/17.
//  Copyright © 2017 netGalaxy Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=a1a51f09406715c9d14a9dcc9cebaa33")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print(error)
            } else {
                
                if let urlContent = data {
                    
                    do {
                    
                     let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                    
                        print(jsonResult)
                        
                        print(jsonResult["name"])
                        
                        if let description = ((jsonResult["weather"] as? NSArray)?[0] as? NSDictionary)?["description"] as? String {
                            
                            print(description)
                            
                        }
                        
                        
                        
                        
                    } catch {
                        
                        print("JSON Processing Failed")
                        
                    }
                }
                
            }
            
        }
        
        task.resume()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

