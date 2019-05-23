import Foundation
import UIKit
import PlaygroundSupport

public class welcome: UIView {
    
    let letsLabel = UILabel()
    let arrowButton = UIButton()
    let hiLabel = UILabel()
    let introductionLabel = UILabel()
    
    let backgroundImage = UIImageView()
    
    let computerImage = UIImageView()
    let townBackground = UIImageView()
    let me = UIImageView()
    let speechBubble =  UIImageView()
    
    
    public init(scene: UIView) { // Basically the viewDidLoad
        super.init(frame:CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight))
        setupUI()
    }
    
    required public init(coder aDecoder: NSCoder) {
        
        fatalError("Public Init Coder NOT working...")
    
    }
    
    func setupUI() {
        self.frame = CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight)
        self.backgroundColor = UIColor(red: 242, green: 242, blue: 242, alpha: 1.0)
        
        backgroundImage.image = UIImage(named: "brick background.png")
        backgroundImage.frame = CGRect(x: 0, y: 0, width: 750, height: 750)
        backgroundImage.contentMode = .scaleToFill
        backgroundImage.alpha = 0.1
        self.addSubview(backgroundImage)
        
        computerImage.image = UIImage(named: "computer.jpg")
        computerImage.frame = CGRect(x: 300, y: 175, width: 400, height: 400)
        computerImage.contentMode = .scaleAspectFit
        computerImage.backgroundColor = UIColor.red
        self.addSubview(computerImage)
        computerImage.isHidden = true
        
        townBackground.image = UIImage(named: "town background.jpg")
        townBackground.frame = CGRect(x: 0, y: 0, width: 750, height: 750)
        townBackground.contentMode = .scaleToFill
        townBackground.alpha = 0.0
        self.addSubview(townBackground)
        townBackground.isHidden = true
        
        me.image = UIImage(named: "me.png")
        me.frame =  CGRect(x: 104, y: 472, width: 272, height: 272)
        me.contentMode = .scaleAspectFit
        me.alpha = 0.0
        self.addSubview(me)
        me.isHidden = true
        
        speechBubble.image = UIImage(named: "speech bubble.png")
        speechBubble.frame = CGRect(x: 218, y: 297, width: 384, height: 230.4)
        speechBubble.contentMode = .scaleAspectFit
        speechBubble.alpha = 0.0
        self.addSubview(speechBubble)
        speechBubble.isHidden = true
        
        hiLabel.text = "Hii!"
        hiLabel.textColor = UIColor.darkGray
        hiLabel.frame = CGRect(x: 350, y: 380, width: 150, height: 100)
        hiLabel.font = UIFont(name: "Savoye LET", size: 100)
        hiLabel.alpha = 0.0
        self.addSubview(hiLabel)
        hiLabel.isHidden = true
        
        introductionLabel.text = "I am Mahil"
        introductionLabel.frame = CGRect(x: 325, y: 320, width: 200, height: 200)
        introductionLabel.textColor = UIColor.darkGray
        introductionLabel.font = UIFont(name: "Savoye LET", size: 50)
        introductionLabel.numberOfLines = 2
        introductionLabel.alpha = 0.0
        self.addSubview(introductionLabel)
        introductionLabel.isHidden = true
        
        letsGo()
    }
    
    func letsGo() {
        letsLabel.text = "let\'s go"
        letsLabel.textColor = UIColor.darkGray
        letsLabel.frame = CGRect(x: 8, y: 50, width: 500, height: 300)
        letsLabel.font = UIFont(name: "Savoye LET", size: 300)
        self.addSubview(letsLabel)
        
        arrowButton.setTitle("→", for: .normal)
        arrowButton.backgroundColor = UIColor.gray
        arrowButton.frame = CGRect(x: 500, y: 550, width: 200, height: 100)
        arrowButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
        arrowButton.layer.cornerRadius = 14.0
        arrowButton.addTarget(self, action: #selector(arrowButtonPressed), for: .touchUpInside)
        self.addSubview(arrowButton)
        
    }
    
    @objc func arrowButtonPressed(sender: UIButton) {
        letsLabel.isHidden = true
        arrowButton.isHidden = true
        backgroundImage.isHidden = true
        performAnimation()
    }
    
    func performAnimation() {
        
        func showMeAnimation() {
            
            townBackground.isHidden = false
            speechBubble.isHidden = false
            me.isHidden = false
            introductionLabel.isHidden = false
            hiLabel.isHidden = false
            
            UIView.animate(withDuration: 1) {
                self.townBackground.alpha = 0.7
            }
            
            UIView.animate(withDuration: 0.5, delay: 1, options: .curveEaseOut, animations: {
                self.me.alpha = 1
            }, completion: nil)
            
            UIView.animate(withDuration: 0.5, delay: 2, options: .curveEaseOut, animations: {
                self.speechBubble.alpha = 1
                self.hiLabel.alpha = 1
            }, completion: { (completed) in
                let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
                rotationAnimation.fromValue = 0.0
                rotationAnimation.toValue = -Double.pi * 2
                rotationAnimation.repeatCount = 1
                rotationAnimation.duration = 0.5
                self.speechBubble.layer.add(rotationAnimation, forKey: nil)
                self.hiLabel.layer.add(rotationAnimation, forKey: nil)
                
                introduceMeAnimation()
            })
            
            
        }
        
        func introduceMeAnimation() {
            
            UIView.animate(withDuration: 0.5, delay: 2, options: .curveEaseOut, animations: {
                self.introductionLabel.alpha = 1.0
                self.hiLabel.alpha = 0.0
            }) { (completion) in
                self.hiLabel.isHidden = true
                introducePlaceAnimation()
            }
            
        }
        
        func introducePlaceAnimation() {
            self.hiLabel.frame = CGRect(x: 335, y: 320, width: 200, height: 200)
            self.hiLabel.font = UIFont(name: "Savoye LET", size: 50)
            self.hiLabel.text = "This is my home town Tirupur"
            self.hiLabel.numberOfLines = 3
            self.hiLabel.isHidden = false
            
            UIView.animate(withDuration: 0.5, delay: 1, options: .curveEaseOut, animations: {
                self.introductionLabel.alpha = 0.0
                self.hiLabel.alpha = 1.0
            }) { (completion) in
                self.introductionLabel.isHidden = true
                self.introductionLabel.frame = CGRect(x: 335, y: 320, width: 200, height: 200)
                self.introductionLabel.font = UIFont(name: "Savoye LET", size: 50)
                self.introductionLabel.text = "Come, I'll show you around."
                self.introductionLabel.numberOfLines = 3
                showTirupurAnimation()
            }
        }
        
        func showTirupurAnimation() {
            
            self.introductionLabel.isHidden = false
            self.backgroundImage.isHidden = false
            self.backgroundImage.alpha = 0.0
            
            UIView.animate(withDuration: 0.5, delay: 1.5, options: .curveEaseOut, animations: {
                self.introductionLabel.alpha = 1.0
                self.hiLabel.alpha = 0.0
            }) { (completion) in
                self.hiLabel.isHidden = true
                self.computerImage.alpha = 0.0
                self.computerImage.isHidden = false
                showComputerAnimation()
            }
            
        }
        
        func showComputerAnimation() {
            
            UIView.animate(withDuration: 0.5, delay: 2, options: .curveEaseOut, animations: {
                self.me.alpha = 0
                self.speechBubble.alpha = 0
                self.introductionLabel.alpha = 0
                self.townBackground.alpha = 0
                self.computerImage.alpha = 1
            }) { (completion) in
                Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { (time) in
                    self.nextScreen()
                })
            }
            
        }
        
        showMeAnimation()
        
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            print(touch.location(in: self))
        }
    }
    
    func nextScreen() {
        
        self.removeFromSuperview()
        
        let introView = intro(scene: self)
        PlaygroundPage.current.liveView = introView
        
    }
    
}
