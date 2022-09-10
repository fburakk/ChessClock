//
//  ViewController.swift
//  ChessClock
//
//  Created by Burak Köse on 9.09.2022.
//

import UIKit

class TimerVC: UIViewController {
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var secondView: UIView!
    
    var timer1 = Timer()
    var timer2 = Timer()
    
    var counter1 = 0
    var counter1S = 60
    
    var plus = 0
    
    var counter2 = 0
    var counter2S = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        
        firstLabel.text = "\(counter1+1):0"
        secondLabel.text = "\(counter2+1):0"
        
        firstView.isUserInteractionEnabled = false
        secondView.isUserInteractionEnabled = false
        
        let gr1 = UITapGestureRecognizer(target: self, action: #selector(GR1))
        firstView.addGestureRecognizer(gr1)
        let gr2 = UITapGestureRecognizer(target: self, action: #selector(GR2))
        secondView.addGestureRecognizer(gr2)
    }

    @IBAction func settingButton(_ sender: Any) {
        
    }
    @IBAction func playButton(_ sender: Any) {
        secondView.isUserInteractionEnabled = true
        
        timer2.invalidate()
        
        timer2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(secondTimer), userInfo: nil, repeats: true)
    }
    
    @objc func firstTimer() {
        
        counter1S -= 1
        firstLabel.text = "\(counter1):\(counter1S)"
        
        if counter1S == 0 {
            counter1S = 60
            
            if counter1 == 0 {
                timer1.invalidate()
            }else{
                counter1 -= 1
            }
            
        }
    }
    
    @objc func secondTimer() {
        counter2S -= 1
        secondLabel.text = "\(counter2):\(counter2S)"
        
        if counter2S == 0 {
            counter2S = 60
            
            if counter2 == 0 {
                timer2.invalidate()
            }else{
                counter2 -= 1
            }
            
        }
    }
    
    
    @objc func GR1() {
        secondView.isUserInteractionEnabled = true
        firstView.isUserInteractionEnabled = false
        
        counter1S += plus
        
        if counter1S >= 60 {
            counter1 += 1
            counter1S -= 60
        }
        
        firstLabel.text = "\(counter1):\(counter1S)"
        
        timer1.invalidate()
        
        timer2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(secondTimer), userInfo: nil, repeats: true)
       
    }
    
    @objc func GR2() {
        firstView.isUserInteractionEnabled = true
        secondView.isUserInteractionEnabled = false
        
        counter2S += plus
        
        if counter2S >= 60 {
            counter2 += 1
            counter2S -= 60
        }
        
        secondLabel.text = "\(counter2):\(counter2S)"
        
        timer2.invalidate()
        
        timer1 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(firstTimer), userInfo: nil, repeats: true)
    }
}

