import Foundation
import UIKit
import PlaygroundSupport

public class dying: UIView {
    
    let dyingLabel = UILabel()
    
    let backgroundImage = UIImageView()
    
    let shirtImage = UIImageView()
    let colorPaletteImage = UIImageView()
    
    let yellowButton = UIButton()
    let pinkButton = UIButton()
    let purpleButton = UIButton()
    let blueButton = UIButton()
    
    let nextScreenButton = UIButton()
    
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
        
        //Pictures
        backgroundImage.image = UIImage(named: "brick background.png")
        backgroundImage.frame = CGRect(x: 0, y: 0, width: 750, height: 750)
        backgroundImage.contentMode = .scaleToFill
        backgroundImage.alpha = 0.1
        self.addSubview(backgroundImage)
        
        colorPaletteImage.image = UIImage(named: "color palette.jpeg")
        colorPaletteImage.frame = CGRect(x: 100, y: 350, width: 400, height: 370)
        colorPaletteImage.contentMode = .scaleAspectFit
        self.addSubview(colorPaletteImage)
        
        yellowButton.frame = CGRect(x: 358, y: 445, width: 80, height: 80)
        yellowButton.addTarget(self, action: #selector(self.yellowButtonPressed(sender:)), for: .touchUpInside)
        self.addSubview(yellowButton)
        
        pinkButton.frame = CGRect(x: 380, y: 553, width: 80, height: 80)
        pinkButton.addTarget(self, action: #selector(self.pinkButtonPressed(sender:)), for: .touchUpInside)
        self.addSubview(pinkButton)
        
        purpleButton.frame = CGRect(x: 152, y: 474, width: 100, height: 80)
        purpleButton.addTarget(self, action: #selector(self.purpleButtonPressed(sender:)), for: .touchUpInside)
        self.addSubview(purpleButton)
        
        blueButton.frame = CGRect(x: 248, y: 412, width: 80, height: 80)
        blueButton.addTarget(self, action: #selector(self.blueButtonPressed(sender:)), for: .touchUpInside)
        self.addSubview(blueButton)
        
        shirtImage.image = UIImage(named: "yellow shirt.png")
        shirtImage.frame = CGRect(x: 420, y: 117, width: 200, height: 200)
        shirtImage.contentMode = .scaleAspectFit
        self.addSubview(shirtImage)
        
        //Label
        dyingLabel.text = "Dying"
        dyingLabel.frame = CGRect(x: 66, y: 55, width: 400, height: 120)
        dyingLabel.textColor = UIColor.black
        dyingLabel.font = UIFont(name: "Savoye LET", size: 100)
        self.addSubview(dyingLabel)
        
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
    
    @objc func yellowButtonPressed(sender: UIButton) {
        shirtImage.image = UIImage(named: "yellow shirt.png")
        nextScreenButton.isHidden = false
    }
    
    @objc func pinkButtonPressed(sender: UIButton) {
        shirtImage.image = UIImage(named: "pink shirt.jpg")
        nextScreenButton.isHidden = false
    }
    
    @objc func purpleButtonPressed(sender: UIButton) {
        shirtImage.image = UIImage(named: "purple shirt.png")
        nextScreenButton.isHidden = false
    }
    
    @objc func blueButtonPressed(sender: UIButton) {
        shirtImage.image = UIImage(named: "blue shirt.png")
        nextScreenButton.isHidden = false
    }
    
    @objc func nextScreen() {
        
        self.removeFromSuperview()
        
        let realSkeletonView = realSkeleton(scene: self, stage: 4)
        PlaygroundPage.current.liveView = realSkeletonView
        
    }
    
}
