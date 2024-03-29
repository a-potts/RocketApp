//
//  ViewController.swift
//  Hustle-Mode
//
//  Created by Austin Potts on 7/24/19.
//  Copyright © 2019 Austin Potts. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var powerBtn: UIButton!
    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var hustleLBL: UILabel!
    @IBOutlet weak var onLBL: UILabel!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
        
    }


    @IBAction func powerBtnPressed(_ sender: Any) {
        cloudHolder.isHidden = false
        darkBlueBG.isHidden = true
        powerBtn.isHidden = true
        
        player.play()
        
        UIView.animate(withDuration: 2.2, animations: {
            self.rocket.frame = CGRect(x: 0, y: 0, width: 414, height: 822)
        }) { (finished) in
            self.hustleLBL.isHidden = false
            self.onLBL.isHidden = false
        }
    }
    
}

