//
//  PageProf.swift
//  BitirmeProjesi
//
//  Created by Enes Dag  on 7.05.2019.
//  Copyright © 2019 Enes Dag . All rights reserved.
//

import UIKit

class PageProf: UIViewController {
    var myname : String = ""
    @IBOutlet weak var mynameTF: UITextField!
    @IBOutlet var generatetoken: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    mynameTF.text = myname
    }
    
  
    
    @IBAction func CreeToken(_ sender: UIButton) {
        let length : Int = 20
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomString : String = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        print(randomString)
        generatetoken.text = randomString
    
    
        //let requestURL = NSURL(string: )
    
    
    }//fin button
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
