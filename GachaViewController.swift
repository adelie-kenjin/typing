//
//  GachaViewController.swift
//  typing
//
//  Created by Kenji Isobe on 2017/06/28.
//  Copyright © 2017年 Kenji Isobe. All rights reserved.
//

import UIKit
import AVFoundation

class GachaViewController: UIViewController ,AVAudioPlayerDelegate{

    @IBOutlet var image:UIImageView!
    @IBOutlet var botan1:UIButton!
    
    var userDefaults:UserDefaults = UserDefaults.standard

    @IBOutlet var coinlabel:UILabel!
    
    var coin:Int = 100
    let util = Audio.shared

    @IBAction func button(){
        if coin < 100{
            let alert = UIAlertController(title: "コインが足りません",
                                          message: "ダンジョンに行ってコインをためてください",
                                          preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title :"OK",style :UIAlertActionStyle.cancel))
            alert.addAction(UIAlertAction(title :"ダンジョン",
                                          style :.default,
                                          handler: {action in
                                            self.tabBarController?.selectedIndex = 0
            }))
            present(alert, animated: true,completion: nil)
        }else if coin >= 100{
            coin = coin - 100
            util.playSE(fileName: "379")
            
            coinlabel.text = String(coin)
            userDefaults.set(coin, forKey: "COIN")
            
            performSegue(withIdentifier: "toResult", sender: nil)

        }
        
        
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        botan1.layer.cornerRadius = 20 // 角丸のサイズ
        botan1.layer.masksToBounds = true
        
        if userDefaults.object(forKey: "COIN") != nil {
            coin = userDefaults.object(forKey: "COIN") as! Int
            
            coinlabel.text = String(coin)
        }else {
            coinlabel.text = "100"
        }
        
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        if userDefaults.object(forKey: "COIN") != nil {
            coin = userDefaults.object(forKey: "COIN") as! Int
            coinlabel.text = String(coin)
        }else {
            coinlabel.text = "100"
        }
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
