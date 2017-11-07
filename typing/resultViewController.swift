//
//  resultViewController.swift
//  typing
//
//  Created by Kenji Isobe on 2017/05/16.
//  Copyright © 2017年 Kenji Isobe. All rights reserved.
//

import UIKit

class resultViewController: UIViewController {
    
    var point: Int = 0
    var count: Float = 0
    var coin1:Int = 0
    var coin2:Int = 0
    var win:Int=0
    var lose:Int=0
    
    @IBOutlet var comento:UILabel!
    @IBOutlet var coinLabel:UILabel!
    @IBOutlet var hantei:UILabel!
    @IBOutlet var keiken:UILabel!
    @IBOutlet var ImageView: UIImageView!
    @IBOutlet var newallcoin:UILabel!
    @IBOutlet var botan1:UIButton!
    @IBOutlet var botan2:UIButton!
    
    var userDefaults:UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        botan1.layer.cornerRadius = 20 // 角丸のサイズ
        botan1.layer.masksToBounds = true
        botan2.layer.cornerRadius = 20 // 角丸のサイズ
        botan2.layer.masksToBounds = true
        if lose == 0 {
            lose = lose + 1
            userDefaults.set(lose,forKey:"LOSE")
            print("バトル数0",lose)
        }
        if lose != 0{
            lose = userDefaults.object(forKey: "LOSE")as! Int + 1
            userDefaults.set(lose,forKey:"LOSE")
            print("バトル1以上",lose)
        }
        
        if count > 0 {
            hantei.text = "クリア！"
            if win == 0  {
                win = win + 1
                userDefaults.set(win,forKey:"WIN")
                print("クリア数0",win)
            }
            if win != 0{
                win = userDefaults.object(forKey: "WIN")as! Int + 1
                userDefaults.set(win,forKey:"WIN")
                print("クリア数1以上",win)
            }
            
        }else{
            hantei.text = "タイムオーバー・・・"
        }
        //print("追加",win)
        
        if count < 5{
            coin1 = 5
            comento.text = "Come on!(._.)"
            keiken.text = String(10)
        }
        if count >= 5 && count < 10{
            coin1 = 10
            comento.text =  "You can do it!"
            keiken.text = String(15)
            }
        if count >= 10 && count < 20{
            comento.text =  "Good!!:)"
            
            coin1 = 15
            keiken.text = String(20)
        }
        if count >= 20 && count < 25{
            comento.text =  "YOU ARE Faster!"
            coin1 = 20
            keiken.text = String(30)
        }
        if count >= 25 && count < 30{
            coin1 = 50
            comento.text =  "so Fast!"
            keiken.text = String(50)
        }
        coinLabel.text = String(coin1)
        
        if userDefaults.object(forKey: "COIN") != nil {
            
            coin2 = userDefaults.object(forKey: "COIN") as! Int + coin1
            
            userDefaults.set(coin2, forKey: "COIN")
            
        }else {
            userDefaults.set(100+coin1, forKey: "COIN")
        }
        
   //     newallcoin.text = String(coin2)
        
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
    }
    
    
    @IBAction func back() {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
       // self.performSegue(withIdentifier: "count", sender: nil)
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
