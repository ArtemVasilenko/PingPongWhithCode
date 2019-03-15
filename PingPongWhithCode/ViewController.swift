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
    
    
    var zoneX = 0
    var zoneY = 0
    
    var ballX = 1.0
    var ballY = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTimer()
    }
    
   func createBall() {
        ball.frame = CGRect(x: ballX, y: ballY, width: 20, height: 20)
        ball.backgroundColor = .red
    }
    
    func createRocket() {
        rocket.frame = CGRect(x: 20, y: self.view.frame.size.height - 20, width: 100, height: 20)
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
                //ballY = 0
            }
            
            zoneY = 1
        } else if ballY == 1 {
            zoneY = -1
        }
        
//        if ballY + 22 > Double(rocket.frame.origin.x) && ballY + 22 < Double(rocket.frame.origin.x + rocket.frame.width) {
////            zoneY = 2
//            print("Booom!")
//        }
        
        switch zoneY {
        case 1 : ballY -= 1
        case -1: ballY += 1
        default:
            print("y")
        }
        
        createBall()
        self.view.addSubview(ball)
        
        createRocket()
        self.view.addSubview(rocket)
        
    }
}








