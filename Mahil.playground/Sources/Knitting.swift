import Foundation
import UIKit
import PlaygroundSupport

public class knitting: UIView {
    
    let knittingLabel = UILabel()
    
    let backgroundImage = UIImageView()
    
    let knittingImage1 = UIImageView()
    let knittingImage2 = UIImageView()
    let knittingImage3 = UIImageView()
    let knittingImage4 = UIImageView()
    let knittingImage5 = UIImageView()
    let knittingImage6 = UIImageView()
    let knittingImage7 = UIImageView()
    let knittingImage8 = UIImageView()
    let knittingImage9 = UIImageView()
    let knittingImage10 = UIImageView()
    
    let blankKnittingImage1 = UIImageView()
    let blankKnittingImage2 = UIImageView()
    let blankKnittingImage3 = UIImageView()
    let blankKnittingImage4 = UIImageView()
    let blankKnittingImage5 = UIImageView()
    let blankKnittingImage6 = UIImageView()
    let blankKnittingImage7 = UIImageView()
    let blankKnittingImage8 = UIImageView()
    let blankKnittingImage9 = UIImageView()
    
    let bigBlurView = UIView()
    let smallBlurView =  UIView()
    
    var isDraggingBlock = 0
    let nextScreenButton = UIButton()
    
    let knittingImage1Frame = CGRect(x: 109, y: 351, width: 27.4, height: 55.3)
    let knittingImage2Frame = CGRect(x: 124, y: 309, width: 52.6, height: 94)
    let knittingImage3Frame = CGRect(x: 349, y: 471, width: 36.6, height: 42.3)
    let knittingImage4Frame = CGRect(x: 349, y: 459, width: 36, height: 10.4)
    let knittingImage5Frame = CGRect(x: 346, y: 310, width: 51, height: 94.3)
    let knittingImage6Frame = CGRect(x: 380, y: 350, width: 26.7, height: 54.8)
    let knittingImage7Frame = CGRect(x: 179, y: 526, width: 165.3, height: 11.7)
    let knittingImage8Frame = CGRect(x: 175, y: 283, width: 170.8, height: 260.3)
    let knittingImage9Frame = CGRect(x: 223, y: 282, width: 74.2, height: 36.4)
    
    let directionLabel = UILabel()
    
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
        
        bigBlurView.backgroundColor = UIColor.lightGray
        bigBlurView.alpha = 0.3
        bigBlurView.frame = CGRect(x: 32, y: 163, width: 430, height: 517)
        bigBlurView.layer.cornerRadius = 14.0
        self.addSubview(bigBlurView)
        
        smallBlurView.backgroundColor = UIColor.lightGray
        smallBlurView.alpha = 0.5
        smallBlurView.frame = CGRect(x: 470, y: 55, width: 288, height: 288)
        smallBlurView.layer.cornerRadius = 14.0
        self.addSubview(smallBlurView)
        
        knittingImage10.image = UIImage(named: "knitting10.png")
        knittingImage10.frame = CGRect(x: 470, y: 55, width: 288, height: 288)
        knittingImage10.contentMode = .scaleAspectFit
        self.addSubview(knittingImage10)
        
        knittingImage8.image = UIImage(named: "knitting8.png")
        knittingImage8.frame = knittingImage8Frame
        knittingImage8.contentMode = .scaleAspectFit
        self.addSubview(knittingImage8)
        
        knittingImage1.image = UIImage(named: "knitting1.png")
        knittingImage1.frame = knittingImage1Frame
        knittingImage1.contentMode = .scaleAspectFit
        self.addSubview(knittingImage1)
        knittingImage1.isUserInteractionEnabled = true
        
        knittingImage2.image = UIImage(named: "knitting2.png")
        knittingImage2.frame = knittingImage2Frame
        knittingImage2.contentMode = .scaleAspectFit
        self.addSubview(knittingImage2)
        
        knittingImage3.image = UIImage(named: "knitting3.png")
        knittingImage3.frame = knittingImage3Frame
        knittingImage3.contentMode = .scaleAspectFit
        self.addSubview(knittingImage3)
        
        knittingImage4.image = UIImage(named: "knitting4.png")
        knittingImage4.frame = knittingImage4Frame
        knittingImage4.contentMode = .scaleAspectFit
        self.addSubview(knittingImage4)
        
        knittingImage5.image = UIImage(named: "knitting5.png")
        knittingImage5.frame = knittingImage5Frame
        knittingImage5.contentMode = .scaleAspectFit
        self.addSubview(knittingImage5)
        
        knittingImage6.image = UIImage(named: "knitting6.png")
        knittingImage6.frame = knittingImage6Frame
        knittingImage6.contentMode = .scaleAspectFit
        self.addSubview(knittingImage6)
        
        knittingImage7.image = UIImage(named: "knitting7.png")
        knittingImage7.frame = knittingImage7Frame
        knittingImage7.contentMode = .scaleAspectFit
        self.addSubview(knittingImage7)
        
        knittingImage9.image = UIImage(named: "knitting9.png")
        knittingImage9.frame = knittingImage9Frame
        knittingImage9.contentMode = .scaleAspectFit
        self.addSubview(knittingImage9)
        
        blankKnittingImage1.frame = CGRect(x: 475, y: 135, width: 27.4, height: 55.3)
        blankKnittingImage1.contentMode = .scaleAspectFit
        self.addSubview(blankKnittingImage1)
        
        blankKnittingImage2.frame = CGRect(x: 483, y: 94, width: 52.5, height: 94)
        blankKnittingImage2.contentMode = .scaleAspectFit
        self.addSubview(blankKnittingImage2)
        
        blankKnittingImage3.frame = CGRect(x: 647, y: 160, width: 36.6, height: 42.3)
        blankKnittingImage3.contentMode = .scaleAspectFit
        self.addSubview(blankKnittingImage3)
        
        blankKnittingImage4.frame = CGRect(x: 647, y: 151, width: 36, height: 10.4)
        blankKnittingImage4.contentMode = .scaleAspectFit
        self.addSubview(blankKnittingImage4)
        
        blankKnittingImage5.frame = CGRect(x: 694, y: 95, width: 51, height: 94.3)
        blankKnittingImage5.contentMode = .scaleAspectFit
        self.addSubview(blankKnittingImage5)
        
        blankKnittingImage6.frame = CGRect(x: 725, y: 134, width: 26.7, height: 54.8)
        blankKnittingImage6.contentMode = .scaleAspectFit
        self.addSubview(blankKnittingImage6)
        
        blankKnittingImage7.frame = CGRect(x: 531, y: 307, width: 165.3, height: 11.73)
        blankKnittingImage7.contentMode = .scaleAspectFit
        self.addSubview(blankKnittingImage7)
        
        blankKnittingImage8.frame = CGRect(x: 528, y: 68, width: 170.8, height: 260.3)
        blankKnittingImage8.contentMode = .scaleAspectFit
        self.addSubview(blankKnittingImage8)
        
        blankKnittingImage9.frame = CGRect(x: 577, y: 79, width: 74.2, height: 36.4)
        blankKnittingImage9.contentMode = .scaleAspectFit
        self.addSubview(blankKnittingImage9)
        
        
        //Label
        knittingLabel.text = "Knitting"
        knittingLabel.frame = CGRect(x: 66, y: 55, width: 400, height: 120)
        knittingLabel.textColor = UIColor.black
        knittingLabel.font = UIFont(name: "Savoye LET", size: 100)
        self.addSubview(knittingLabel)
        
        directionLabel.text = "Assemble the cloth for stitching"
        directionLabel.frame = CGRect(x: 470, y: 350, width: 200, height: 300)
        directionLabel.numberOfLines = 2
        directionLabel.font = UIFont(name: "Savoye LET", size: 30)
        directionLabel.textColor = UIColor.darkGray
        self.addSubview(directionLabel)
        
        //Button
        nextScreenButton.setTitle("→", for: .normal)
        nextScreenButton.backgroundColor = UIColor.lightGray
        nextScreenButton.frame = CGRect(x: 605, y: 680, width: 100, height: 50)
        nextScreenButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
        nextScreenButton.layer.cornerRadius = 14.0
        nextScreenButton.addTarget(self, action: #selector(self.nextScreen), for: .touchUpInside)
        self.addSubview(nextScreenButton)
        nextScreenButton.isHidden = true
        
    }
    
    func checkingForMatch() {
        
        if knittingImage1.frame.intersects(blankKnittingImage1.frame) {
            knittingImage1.frame = blankKnittingImage1.frame
            knittingImage1.isUserInteractionEnabled = false
        } else {
            knittingImage1.frame = knittingImage1Frame
        }
        
        if knittingImage2.frame.intersects(blankKnittingImage2.frame) {
            knittingImage2.frame = blankKnittingImage2.frame
            knittingImage2.isUserInteractionEnabled = false
        } else {
            knittingImage2.frame = knittingImage2Frame
        }
        
        if knittingImage3.frame.intersects(blankKnittingImage3.frame) {
            knittingImage3.frame = blankKnittingImage3.frame
            knittingImage3.isUserInteractionEnabled = false
        } else {
            knittingImage3.frame = knittingImage3Frame
        }
        
        if knittingImage4.frame.intersects(blankKnittingImage4.frame) {
            knittingImage4.frame = blankKnittingImage4.frame
            knittingImage4.isUserInteractionEnabled = false
        } else {
            knittingImage4.frame = knittingImage4Frame
        }
        
        if knittingImage5.frame.intersects(blankKnittingImage5.frame) {
            knittingImage5.frame = blankKnittingImage5.frame
            knittingImage5.isUserInteractionEnabled = false
        } else {
            knittingImage5.frame = knittingImage5Frame
        }
        
        if knittingImage6.frame.intersects(blankKnittingImage6.frame) {
            knittingImage6.frame = blankKnittingImage6.frame
            knittingImage6.isUserInteractionEnabled = false
        } else {
            knittingImage6.frame = knittingImage6Frame
        }
        
        if knittingImage7.frame.intersects(blankKnittingImage7.frame) {
            knittingImage7.frame = blankKnittingImage7.frame
            knittingImage7.isUserInteractionEnabled = false
        } else {
            knittingImage7.frame = knittingImage7Frame
        }
        
        if knittingImage8.frame.intersects(blankKnittingImage8.frame) {
            knittingImage8.frame = blankKnittingImage8.frame
            knittingImage8.isUserInteractionEnabled = false
        } else {
            knittingImage8.frame = knittingImage8Frame
        }
        
        if knittingImage9.frame.intersects(blankKnittingImage9.frame) {
            knittingImage9.frame = blankKnittingImage9.frame
            knittingImage9.isUserInteractionEnabled = false
        } else {
            knittingImage9.frame = knittingImage9Frame
        }
        
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            let location = touch.location(in: self)
            
            if knittingImage1.frame.contains(location) {
                isDraggingBlock = 1
                knittingImage1.center = location
            } else if knittingImage2.frame.contains(location) {
                isDraggingBlock = 2
                knittingImage2.center = location
            } else if knittingImage3.frame.contains(location) {
                isDraggingBlock = 3
                knittingImage3.center = location
            } else if knittingImage4.frame.contains(location) {
                isDraggingBlock = 4
                knittingImage4.center = location
            } else if knittingImage5.frame.contains(location) {
                isDraggingBlock = 5
                knittingImage5.center = location
            } else if knittingImage6.frame.contains(location) {
                isDraggingBlock = 6
                knittingImage6.center = location
            } else if knittingImage7.frame.contains(location) {
                isDraggingBlock = 7
                knittingImage7.center = location
            } else if knittingImage8.frame.contains(location) {
                isDraggingBlock = 8
                knittingImage8.center = location
            } else if knittingImage9.frame.contains(location) {
                isDraggingBlock = 9
                knittingImage9.center = location
            }
            
        }
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            let location = touch.location(in: self)
            
            if knittingImage1.frame.contains(location) && isDraggingBlock == 1 {
                knittingImage1.center = location
            } else if knittingImage2.frame.contains(location) && isDraggingBlock == 2 {
                knittingImage2.center = location
            } else if knittingImage3.frame.contains(location) && isDraggingBlock == 3 {
                knittingImage3.center = location
            } else if knittingImage4.frame.contains(location) && isDraggingBlock == 4 {
                knittingImage4.center = location
            } else if knittingImage5.frame.contains(location) && isDraggingBlock == 5 {
                knittingImage5.center = location
            } else if knittingImage6.frame.contains(location) && isDraggingBlock == 6 {
                knittingImage6.center = location
            } else if knittingImage7.frame.contains(location) && isDraggingBlock == 7 {
                knittingImage7.center = location
            } else if knittingImage8.frame.contains(location) && isDraggingBlock == 8 {
                knittingImage8.center = location
            } else if knittingImage9.frame.contains(location) && isDraggingBlock == 9 {
                knittingImage9.center = location
            }
            
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.isDraggingBlock = 0
        checkingForMatch()
        
        nextScreenButton.isHidden = false
        
    }
    
    @objc func nextScreen() {
        
        self.removeFromSuperview()
        
        let byebyeView = byebye(scene: self)
        PlaygroundPage.current.liveView = byebyeView
        
    }
    
}
