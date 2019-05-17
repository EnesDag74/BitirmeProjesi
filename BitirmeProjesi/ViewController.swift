//
//  ViewController.swift
//  BitirmeProjesi
//
//  Created by Enes Dag  on 23.04.2019.
//  Copyright © 2019 Enes Dag . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var menuishidden = true
    
    @IBOutlet weak var menuview: UIView!
    
    //MARK : Outlets
    
    
    
    // MARK : properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        leadingConstraint.constant = -150 // on met cette contrainte ici pour que lorsque l'application apparait le menu soit cacher
        menuview.layer.shadowOpacity = 0.5
        menuview.layer.shadowRadius = 6
    }

    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    @IBAction func ToggleMenu(_ sender: UIBarButtonItem) {
    
        if menuishidden{
            leadingConstraint.constant = 0
            
            UIView.animate(withDuration: 0.3){
                self.view.layoutIfNeeded()
            }
        }else {
        leadingConstraint.constant = -150 // la valeur 150 est choisi par rapport con constrainte que l'on a mis et ici on a defini la largeur du menu a 150
            UIView.animate(withDuration: 0.3){
                self.view.layoutIfNeeded()
            }
        }
        menuishidden = !menuishidden
    }
    
    
    //MARK : action
    

}

