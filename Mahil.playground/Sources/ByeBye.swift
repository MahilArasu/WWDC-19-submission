import Foundation
import UIKit
import PlaygroundSupport

public class byebye: UIView {
    
    let arrowButton = UIButton()
    let hiLabel = UILabel()
    let introductionLabel = UILabel()
    
    let backgroundImage = UIImageView()
    
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
        
        hiLabel.text = "That's about the process"
        hiLabel.textColor = UIColor.darkGray
        hiLabel.frame = CGRect(x: 325, y: 320, width: 200, height: 200)
        hiLabel.font = UIFont(name: "Savoye LET", size: 50)
        hiLabel.numberOfLines = 2
        hiLabel.alpha = 0.0
        self.addSubview(hiLabel)
        hiLabel.isHidden = true
        
        introductionLabel.text = "Thanks for watching"
        introductionLabel.frame = CGRect(x: 325, y: 320, width: 200, height: 200)
        introductionLabel.textColor = UIColor.darkGray
        introductionLabel.font = UIFont(name: "Savoye LET", size: 50)
        introductionLabel.numberOfLines = 2
        introductionLabel.alpha = 0.0
        self.addSubview(introductionLabel)
        introductionLabel.isHidden = true
        
        performAnimation()
        
    }
    
    func performAnimation() {
        me.isHidden = false
        townBackground.isHidden = false
        speechBubble.isHidden = false
        hiLabel.isHidden = false
        
        func showTownAnimation() {
            UIView.animate(withDuration: 0.5) {
                self.me.alpha = 1
                self.townBackground.alpha = 1
                self.speechBubble.alpha = 1
            }
            
            UIView.animate(withDuration: 0.5, delay: 1, options: .curveLinear, animations: {
                self.hiLabel.alpha = 1
            }) { (completed) in
                sayThankAnimation()
            }
        }
        
        func sayThankAnimation() {
            self.introductionLabel.isHidden = false
            
            UIView.animate(withDuration: 0.5, delay: 1, options: .curveLinear, animations: {
                self.hiLabel.alpha = 0
                self.introductionLabel.alpha = 1
            }) { (complete) in
                self.hiLabel.isHidden = true
                self.hiLabel.text = "Hope you enjoyed."
                sayThankAnimationAgain()
            }
        }
        
        func sayThankAnimationAgain() {
            self.hiLabel.isHidden = false
            UIView.animate(withDuration: 0.5, delay: 1, options: .curveLinear, animations: {
                self.hiLabel.alpha = 1
                self.introductionLabel.alpha = 0
            }) { (complete) in
                self.introductionLabel.isHidden = true
                self.introductionLabel.text = "Hope to see you at WWDC!"
                self.introductionLabel.font = UIFont(name: "Savoye LET", size: 40)
                sayByeAnimation()
            }
        }
        
        func sayByeAnimation() {
            self.introductionLabel.isHidden = false
            UIView.animate(withDuration: 0.5, delay: 1, options: .curveLinear, animations: {
                self.hiLabel.alpha = 0
                self.introductionLabel.alpha = 1
            }) { (complete) in
                self.hiLabel.isHidden = true
            }
        }
        
        showTownAnimation()
        
    }
    
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            print(touch.location(in: self))
        }
        
    }
    
}
