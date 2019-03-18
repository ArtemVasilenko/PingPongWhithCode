//
//  ViewController.swift
//  PingPongWhithCode
//
//  Created by Артем on 3/14/19.
//  Copyright © 2019 Артем. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    var ball = UIView()
    var rocket = UIView()
    var score = UILabel()
    
    var scoreText = 0
    
    var zoneX = 0
    var zoneY = 0
    
    var ballX = 1.0
    var ballY = 1.0
    
    var rocketX = CGFloat(1.0)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTimer()
    }
    
    
    @IBAction func leftButton(_ sender: UIButton) {
        rocketX -= 10
    }
    
    @IBAction func rightButton(_ sender: UIButton) {
        rocketX += 10
    }
    
    
    func createScore() {
        score.frame = CGRect(x: self.view.frame.origin.x + self.view.frame.size.width/2, y: self.view.frame.origin.y/2, width: 200, height: 200)
        
        score.text = String(scoreText)
    }
    
    func createBall() {
        ball.frame = CGRect(x: ballX, y: ballY, width: 20, height: 20)
        ball.backgroundColor = .red
        ball.layer.cornerRadius = 10
    }
    
    func createRocket() {
        rocket.frame = CGRect(x: rocketX, y: self.view.frame.size.height - 20, width: 100, height: 20)
        rocket.backgroundColor = .green
    }
    
    func createTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(moveBall), userInfo: nil, repeats: true)
    }
    
    @objc func moveBall() {
        //MARK: Zone X
        if ballX + 22 == Double(self.view.frame.size.width) {
            zoneX = 1
        } else if ballX == 1 {
            zoneX = -1
        }
        
        switch zoneX {
        case 1: ballX -= 1
        case -1: ballX += 1
        default:
            print("x")
        }
        
        //MARK: Zone Y
        if ballY + 22 == Double(self.view.frame.size.height) {
            
            if ballX > Double(rocket.frame.origin.x) && ballX < Double(rocket.frame.origin.x + rocket.frame.width) {
                print("Booom!")
                ball.pulsate()
                scoreText += 1
                zoneY = 1
            } else { zoneY = 2
                scoreText = 0
            }
        } else if ballY == 1 {
            zoneY = -1
        }
        
        
        switch zoneY {
        case 1 : ballY -= 1
        case -1: ballY += 1
        case 2: ballY = 1
        default:
            print("y")
        }
        
        createBall()
        self.view.addSubview(ball)
        
        createRocket()
        self.view.addSubview(rocket)
        
        createScore()
        self.view.addSubview(score)
        
    }
}


extension UIView {
    
    func pulsate() {
        
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.6
        pulse.fromValue = 1.45
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 2
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        
        
        layer.add(pulse, forKey: nil)
    }
}






