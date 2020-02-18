//
//  ZoomInViewController.swift
//  SlideshowApp
//
//  Created by NAOKI II on 2020/02/19.
//  Copyright © 2020 NAOKI.II. All rights reserved.
//

import UIKit

class ZoomInViewController: UIViewController {

    @IBOutlet weak var ZoomImage: UIImageView!
    @IBOutlet weak var BackPageButton: UIButton!
    var selectedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ZoomImage.image = selectedImage
    }
    
    //初期画面へ戻る
    @IBAction func BackPageButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
