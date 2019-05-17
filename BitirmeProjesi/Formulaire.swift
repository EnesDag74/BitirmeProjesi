//
//  Formulaire.swift
//  BitirmeProjesi
//
//  Created by Enes Dag  on 16.05.2019.
//  Copyright © 2019 Enes Dag . All rights reserved.
//

import UIKit

class Formulaire: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.isHidden = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var TableView: UITableView!
    
    @IBOutlet weak var btnDrop: UIButton!
    
    var CodeCoursList = ["CNT417 Girişimcilik","INF481 Yazılım Müh. ve Nesneye Yönelik Tasarım","CNT416 Sosyal Medya", "INF483 Bilgi Çıkarımı ve Veri Madenciliğine Giriş","INF441 Şifrelemye Giriş","INF447 Paralel Işleme","INF482 Gömülü Sistem Tasarım Temelleri","INF437 Sistem Müh."]
    var list = ["1","2","3","4","5","6"]
    
    @IBAction func onClickDropButton(_ sender: Any)
    {
        if TableView.isHidden{
            animate(toogle: true)
        }
        else
        {
            animate(toogle: false)
        }
    }
    
    func animate(toogle :Bool){
        if toogle {
            UIView.animate(withDuration: 0.3){
                self.TableView.isHidden = false
            }
        }
        else
        {
            UIView.animate(withDuration: 0.3){
                self.TableView.isHidden = true
            }

        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension Formulaire : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return CodeCoursList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
}
