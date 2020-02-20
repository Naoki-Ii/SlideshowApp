//
//  ViewController.swift
//  SlideshowApp
//
//  Created by NAOKI II on 2020/02/18.
//  Copyright © 2020 NAOKI.II. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var displayImageNo = 0
    let imageNameArray = ["sample1.jpeg","sample2.jpeg","sample3.jpeg","sample4.jpeg","sample5.jpeg","sample6.jpeg","sample7.jpeg","sample8.jpeg","sample9.jpeg","sample10.jpeg","sample11.jpeg","sample12.jpeg","sample13.jpeg","sample14.jpeg","sample15.jpeg","sample16.jpeg"]
    
    @IBOutlet weak var slideImage: UIImageView!
    @IBOutlet weak var NextButton: UIButton!
    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var SwitchButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //初期画面
        let image = UIImage(named: "sample1.jpeg")
        slideImage.image = image
        }
    //画像チェンジファンクション
    func displayImage(){
        let name = imageNameArray[displayImageNo]
        let image = UIImage(named: name)
        slideImage.image = image
    }
    
    ///////////////////////////////ボタン処理内容//////////////////
    
    @IBAction func NextButton(_ sender: Any) {
        if displayImageNo < imageNameArray.count-1{
        displayImageNo+=1
        displayImage()
        } else {
            displayImageNo = 0
            displayImage()
        }
    }
    @IBAction func BackButton(_ sender: Any) {
        if displayImageNo>=1 && displayImageNo <= imageNameArray.count-1{
            displayImageNo-=1
            displayImage()
        } else {
            displayImageNo = imageNameArray.count-1
            displayImage()
        }
    }
    //タイマー処理
    var timer: Timer!
    
    @IBAction func SwitchButton(_ sender: Any) {
        if self.timer == nil{
            self.timer = Timer.scheduledTimer(timeInterval: 2.0,target:self,selector:#selector(updateTimer(_:)), userInfo:nil,repeats:true)
            //　ボタン無効化
            NextButton.isEnabled = false
            BackButton.isEnabled = false
            //ボタン表示名を停止に変更
            SwitchButton.setTitle("停止", for: .normal)
            SwitchButton.setTitleColor(UIColor.red, for: .normal)
        } else if self.timer != nil{
            //タイマー停止
            self.timer.invalidate()
            self.timer = nil
            
            //ボタン有効化
            NextButton.isEnabled = true
            BackButton.isEnabled = true
            
            //ボタン表示名を再生に変更 色変更
            SwitchButton.setTitle("再生", for: .normal)
            SwitchButton.setTitleColor(UIColor.systemBlue, for: .normal)
        }
        }
    @objc func updateTimer(_ timer:Timer){
        if displayImageNo < imageNameArray.count-1{
            displayImageNo+=1
            displayImage()
        }else {
            displayImageNo = 0
            displayImage()
        }
    }
    @IBAction func TapActions(_ sender: Any) {
        performSegue(withIdentifier: "ZoomIn", sender: nil)
        
        if self.timer != nil{
            //タイマー停止
            self.timer.invalidate()
            self.timer = nil
            
            //ボタン有効化
            NextButton.isEnabled = true
            BackButton.isEnabled = true
            
            //ボタン表示名を再生に変更 色変更
            SwitchButton.setTitle("再生", for: .normal)
            SwitchButton.setTitleColor(UIColor.systemBlue, for: .normal)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let zoompage:ZoomInViewController = segue.destination as!ZoomInViewController
        
        let name = imageNameArray[displayImageNo]
        let image = UIImage(named: name)
        zoompage.selectedImage = image!
    }
}
