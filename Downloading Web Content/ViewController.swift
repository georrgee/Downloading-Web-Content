//
//  ViewController.swift
//  Downloading Web Content
//
//  Created by George Garcia on 5/10/17.
//  Copyright © 2017 George. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    // define a URL and then instruct our iPhone to that URL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create by defualt an optional because in case the URL is mistyped,
        // we are certain that the URL is correct
        
        /*
        let urlVar = URL(string: "https://www.google.com")!
        
        webView.loadRequest(URLRequest(url: urlVar))
        
        webView.loadHTMLString("<h1>Hello there handsome!</h1>", baseURL: nil)
        */
        
        if let urlVar = URL(string: "https://www.stackoverflow.com"){ // checking if the URL can be created from the string
        
        let requestVar = NSMutableURLRequest(url: urlVar) // if it can, create a request from the URL. (always successful as long as URL is valid)
            
            
          // (Return 3 variables) general session on the phone to use and access data, imagine a browser being opened and get content of a website
            let taskVar = URLSession.shared.dataTask(with: requestVar as URLRequest){
                data, response, error in
                
                if error != nil{
                    
                    print(error)
                    
                }
                else{
                    if let unwrappedData = data {
                        let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                        
                        print(dataString) // printing that string
                        
                        DispatchQueue.main.sync(execute:  {
                            // Update UI
                        })
                }
            }
        }
        taskVar.resume() // actually run the task
    }
        
        print("Hi There!")
 }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

