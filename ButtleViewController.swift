//
//  ButtleViewController.swift
//  typing
//
//  Created by Kenji Isobe on 2017/06/21.
//  Copyright © 2017年 Kenji Isobe. All rights reserved.
//

import UIKit

class ButtleViewController: UIViewController {
    var a:Int = 0
    @IBOutlet var label:UILabel!
    @IBOutlet var image:UIImageView!
    @IBOutlet var botan1:UIButton!
    @IBOutlet var botan2:UIButton!
    @IBOutlet var botan3:UIButton!

    
    var userDefaults:UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        botan1.layer.cornerRadius = 20 // 角丸のサイズ
        botan1.layer.masksToBounds = true
        botan2.layer.cornerRadius = 20 // 角丸のサイズ
        botan2.layer.masksToBounds = true
        botan3.layer.cornerRadius = 20 // 角丸のサイズ
        botan3.layer.masksToBounds = true

        if userDefaults.object(forKey: "LEVEL") != nil {
            label.text = String(describing: userDefaults.object(forKey: "LEVEL")!)
        }else {
            label.text = "0"
        }
        if userDefaults.object(forKey: "IMAGE") != nil {
            image.image = UIImage(data: userDefaults.object(forKey: "IMAGE") as! Data)
        }else {
            image.image = UIImage(named:"naidesu.png")
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if userDefaults.object(forKey: "LEVEL") != nil {
            label.text = String(describing: userDefaults.object(forKey: "LEVEL")!)
            
        }else {
            label.text = "0"
        }
        if userDefaults.object(forKey: "IMAGE") != nil {
            image.image = UIImage(data: userDefaults.object(forKey: "IMAGE") as! Data)
        }else {
           
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func unwindToFirstView(segue: UIStoryboardSegue) {
    }
    @IBAction func button1(){
        self.performSegue(withIdentifier: "count", sender: nil)
        
    }
    @IBAction func button2(){
        self.performSegue(withIdentifier: "count", sender: nil)
      
    }
    @IBAction func button3(){
        self.performSegue(withIdentifier: "count", sender: nil)
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
