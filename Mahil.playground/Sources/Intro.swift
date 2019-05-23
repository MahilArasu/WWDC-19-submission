import Foundation
import UIKit
import PlaygroundSupport

public class intro: UIView {
    
    let tirupurLabel = UILabel()
    let isinLabel = UILabel()
    let knownForLabel = UILabel()
    let madeLabel = UILabel()
    let letusseeLabel = UILabel()
    let nowLabel = UILabel()
    let dragLabel =  UILabel()
    
    let tirupurLocation = UIImageView()
    let tshirt = UIImageView()
    
    var countVar = 0
    
    var timer = Timer()
    
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
        
        tirupurLocation.image = UIImage(named: "Tirupurlocation.png")
        tirupurLocation.frame = CGRect(x: 160, y: -900, width: 626, height: 666)
        tirupurLocation.contentMode = .scaleAspectFit
        self.addSubview(tirupurLocation)
        tirupurLocation.isHidden = true
        
        tshirt.image = UIImage(named: "T-Shirt.jpeg")
        tshirt.frame = CGRect(x: 120, y: -1000, width: 626, height: 666)
        tshirt.contentMode = .scaleAspectFit
        self.addSubview(tshirt)
        tshirt.isHidden = true
        
        tirupurLabel.text = "Tirupur"
        tirupurLabel.textColor = UIColor.darkGray
        tirupurLabel.frame = CGRect(x: 8, y: -100, width: 200, height: 100)
        tirupurLabel.font = UIFont(name: "Savoye LET", size: 80)
        self.addSubview(tirupurLabel)
        tirupurLabel.isHidden = true
        
        isinLabel.text = "is in South India"
        isinLabel.textColor = UIColor.darkGray
        isinLabel.frame = CGRect(x: 180, y: -100, width: 500, height: 100)
        isinLabel.font = UIFont(name: "Savoye LET", size: 80)
        self.addSubview(isinLabel)
        isinLabel.isHidden = true
        
        knownForLabel.text = "is known for"
        knownForLabel.textColor = UIColor.darkGray
        knownForLabel.frame = CGRect(x: 180, y: -100, width: 300, height: 100)
        knownForLabel.font = UIFont(name: "Savoye LET", size: 80)
        self.addSubview(knownForLabel)
        knownForLabel.isHidden = true
        
        letusseeLabel.text = "Let\'s see how"
        letusseeLabel.textColor = UIColor.darkGray
        letusseeLabel.frame = CGRect(x: 8, y: -100, width: 400, height: 100)
        letusseeLabel.font = UIFont(name: "Savoye LET", size: 80)
        self.addSubview(letusseeLabel)
        letusseeLabel.isHidden = true
        
        madeLabel.text = "s are made."
        madeLabel.frame = CGRect(x: 590, y: -100, width: 200, height: 100)
        madeLabel.textColor = UIColor.darkGray
        madeLabel.font = UIFont(name: "Savoye LET", size: 50)
        self.addSubview(madeLabel)
        madeLabel.isHidden = true
        
        nowLabel.text = "Now,"
        nowLabel.frame = CGRect(x: 16, y: -60, width: 150, height: 100)
        nowLabel.textColor = UIColor.darkGray
        nowLabel.font = UIFont(name: "Savoye LET", size: 80)
        self.addSubview(nowLabel)
        nowLabel.isHidden = true
        
        dragLabel.text = "drag the objects and find the process."
        dragLabel.frame = CGRect(x: 16, y: -510, width: 750, height: 400)
        dragLabel.numberOfLines = 2
        dragLabel.textColor = UIColor.darkGray
        dragLabel.font = UIFont(name: "Savoye LET", size: 80)
        self.addSubview(dragLabel)
        dragLabel.isHidden = true
        
        
        
        animate()
        
    }
    
    func animate() {
        UIView.animate(withDuration: 1.0, delay: 1.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIView.AnimationOptions.curveEaseIn, animations: ({
            
            self.tirupurLabel.isHidden = false
            self.isinLabel.isHidden = false
            self.tirupurLocation.isHidden = false
            
            self.tirupurLabel.center.y = 47
            self.isinLabel.center.y = 47
            self.tirupurLocation.center.y = 415
        }), completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 3.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIView.AnimationOptions.curveEaseIn, animations: ({
            
            self.knownForLabel.isHidden = false
            self.tshirt.isHidden = false
            
            self.isinLabel.center.y = self.isinLabel.center.y + self.frame.maxY + 10
            self.tirupurLocation.center.y = self.tirupurLocation.center.y + self.frame.maxY
            
            self.knownForLabel.center.y = 47
            self.tshirt.center.y = 415
        }), completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 5.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIView.AnimationOptions.curveEaseIn, animations: ({
            
            self.letusseeLabel.isHidden = false
            self.madeLabel.isHidden = false
            
            self.tirupurLabel.center.y = self.tirupurLabel.center.y + self.frame.maxY + 10
            self.knownForLabel.center.y = self.knownForLabel.center.y + self.frame.maxY + 10
            
            self.letusseeLabel.center.y = 47
            self.madeLabel.center.y = 415
        }), completion: nil)

        UIView.animate(withDuration: 1.0, delay: 8.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIView.AnimationOptions.curveEaseIn, animations: ({
            
            self.nowLabel.isHidden = false
            
            self.letusseeLabel.center.y = self.letusseeLabel.center.y + self.frame.maxY + 10
            self.madeLabel.center.y = self.madeLabel.center.y + self.frame.maxY + 10
            self.tshirt.center.y = self.tshirt.center.y + self.frame.maxY
            
            self.nowLabel.center.y = self.frame.midY/2 - 50
            
        }), completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 10.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIView.AnimationOptions.curveEaseIn, animations: ({
            
            self.dragLabel.isHidden = false
            
            self.dragLabel.center.y = self.frame.midY/2 + 50
            
        }), completion:{ (completion) -> Void in
            Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(self.nextScreen), userInfo: nil, repeats: false)
        })
        
    }
    
    @objc func nextScreen() {
        
        self.removeFromSuperview()
        
        let skeletonView = skeleton(scene: self)
        PlaygroundPage.current.liveView = skeletonView
        
    }
    
}
