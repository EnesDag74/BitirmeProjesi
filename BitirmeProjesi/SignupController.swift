//
//  SignupController.swift
//  BitirmeProjesi
//
//  Created by Enes Dag  on 23.04.2019.
//  Copyright © 2019 Enes Dag . All rights reserved.
//

import UIKit

class SignupController : UIViewController
{
    
    // MARK : Outlets
    @IBOutlet weak var SignUpButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var monchamp: UITextField!
    @IBOutlet weak var monchamp2: UITextField!
    
    var a : Int = 0
    
    
    // MARK : Properties
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupButtons()
        SetupTextFieldManager()
    }
    //MARK : private function
    private func setupButtons()
    {
        SignUpButton.layer.cornerRadius = 20
        SignUpButton.layer.borderWidth = 3
        SignUpButton.layer.borderColor = UIColor.black.cgColor
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.identifier == "showPageProf"
        {
            let Destination = segue.destination as! PageProf
            Destination.myname = monchamp.text!
        }
        
    }

    
    @IBAction func seConnecter(_ sender: UIButton) {
        
        /*let username:NSString = monchamp.text! as NSString
        let password:NSString = monchamp2.text! as NSString*/
        let username: String = monchamp.text!
        let password: String = monchamp2.text!
        if(username == "" || password == "" )
        {
          
            let alert = UIAlertController(title: "Alert", message: "Veuillez remplir les champs", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        else 
        {
            performSegue(withIdentifier: "showPageProf", sender: nil)
           //let urlPath : String = "http://192.168.2.198/www/service.php"
            let request = NSMutableURLRequest(url: NSURL(string: "http://192.168.2.198/www/login.php")! as URL)
            request.httpMethod = "POST"
            
            let postString = "Email=\(username)&Password=\(password)"
            request.httpBody = postString.data(using: String.Encoding.utf8)
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in
                if error != nil {
                    print("error=\(error)")
                    return
                }else{
                    do{
                        
                        print("response = \(response)")
                        let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)!
                        if(((responseString.isEqual(to: ""))))
                        {
                            print("Connexion failed")
                        }
                        else{
                            self.a = 1
                            print("responseString = \(responseString)")
                            
                        }
                    }catch{
                        print("Error2")
                    }
                }
                
            }
            task.resume()
            
        }
        
    }
    
    
    private func SetupTextFieldManager(){
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture) //quand on clique quelque part sur la vue ca cache le clavier
    }
    //MARK : Actions
    @objc private func hideKeyboard(){ //grace a cette fonction on cache le clavier
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    }

extension SignupController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { //quand on clique sur return ca appelle la fonction qui cache le clavier
        textField.resignFirstResponder()
        return true
        
    }
}
