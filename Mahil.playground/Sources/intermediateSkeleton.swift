import Foundation
import UIKit
import PlaygroundSupport

public class intermediateSkeleton: UIView {
    
    var andSoLabel = UILabel()
    var paraLabel = UILabel()
    
    var townBackground = UIImageView()
    var me = UIImageView()
    var speechBubble = UIImageView()
    
    var eachProcessLabel = UILabel()
    var nowLabel = UILabel()
    
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
        
        performParaAction()
    }
    
    func performParaAction() {
        andSoLabel.text = "and so,"
        andSoLabel.textColor = UIColor.darkGray
        andSoLabel.frame = CGRect(x: 8, y: 8, width: 200, height: 200)
        andSoLabel.font = UIFont(name: "Savoye LET", size: 80)
        andSoLabel.alpha = 0
        self.addSubview(andSoLabel)
        
        
        paraLabel.text = "That\'s the process..."
        paraLabel.textColor = UIColor.darkGray
        paraLabel.frame = CGRect(x: 8, y: 200, width: 700, height: 200)
        paraLabel.numberOfLines = 2
        paraLabel.font = UIFont(name: "Savoye LET", size: 80)
        paraLabel.alpha = 0
        self.addSubview(paraLabel)
        
        animatePara()
    }
    
    func animatePara() {
        
        UIView.animate(withDuration: 2.0, delay: 0.5, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIView.AnimationOptions.curveEaseIn, animations: ({
            
            self.andSoLabel.alpha = 1
            
        }), completion: nil)
        
        UIView.animate(withDuration: 2.0, delay: 1.5, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIView.AnimationOptions.curveEaseIn, animations: ({
            
            self.paraLabel.alpha = 1
            
        }), completion: { (completion) -> Void in
            self.andSoLabel.isHidden = true
            self.paraLabel.isHidden = true
            Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.performTownAction), userInfo: nil, repeats: false)
        })
        
        
        
    }
    
    @objc func performTownAction() {
        
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
        
        eachProcessLabel.text = "let's look at each process"
        eachProcessLabel.frame = CGRect(x: 325, y: 320, width: 200, height: 200)
        eachProcessLabel.textColor = UIColor.darkGray
        eachProcessLabel.font = UIFont(name: "Savoye LET", size: 50)
        eachProcessLabel.numberOfLines = 2
        eachProcessLabel.alpha = 0.0
        self.addSubview(eachProcessLabel)
        eachProcessLabel.isHidden = true
        
        nowLabel.text = "Now,"
        nowLabel.textColor = UIColor.darkGray
        nowLabel.frame = CGRect(x: 350, y: 380, width: 150, height: 100)
        nowLabel.font = UIFont(name: "Savoye LET", size: 80)
        nowLabel.alpha = 0.0
        self.addSubview(nowLabel)
        nowLabel.isHidden = true
        
        townAnimation()
        
    }
    
    func townAnimation() {
        
        townBackground.isHidden = false
        me.isHidden = false
        speechBubble.isHidden = false
        nowLabel.isHidden = false
        
        func showTownViewAnimation() {
            
            UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveLinear, animations: {
                self.townBackground.alpha = 1
                self.me.alpha = 1
                self.speechBubble.alpha = 1
            }, completion: nil)
            
            UIView.animate(withDuration: 0.5, delay: 1, options: .curveLinear, animations: {
                self.nowLabel.alpha = 1
            }) { (completion) in
                showParaAnimation()
            }
            
        }
        
        
        func  showParaAnimation() {
            self.eachProcessLabel.isHidden = false
            UIView.animate(withDuration: 0.5, delay: 1, options: .curveLinear, animations: {
                self.nowLabel.alpha = 0
                self.eachProcessLabel.alpha =  1
            }) { (completion) in
                self.nowLabel.isHidden = true
                Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.nextScreen), userInfo: nil, repeats: false)
            }
        }
        
        showTownViewAnimation()
        
    }
    
    @objc func nextScreen() {
        
        self.removeFromSuperview()
        
        let realSkeletonView = realSkeleton(scene: self, stage: 0)
        PlaygroundPage.current.liveView = realSkeletonView
        
    }
    
}
