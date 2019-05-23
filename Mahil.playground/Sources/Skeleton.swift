import Foundation
import UIKit
import PlaygroundSupport

public class skeleton: UIView {
    
    var dragandDropLabel = UILabel()
    
    var skeletonBlankImage = UIImageView()
    var rawCottonImage = UIImageView()
    var ginnedCottonImage = UIImageView()
    var yarnImage = UIImageView()
    var rawFabricImage = UIImageView()
    var finishedFabricImage = UIImageView()
    var finishedGarmentImage = UIImageView()
    
    var emptyRawCottonImage = UIImageView()
    var emptyGinnedCottonImage = UIImageView()
    var emptyYarnImage = UIImageView()
    var emptyRawFabricImage = UIImageView()
    var emptyFinishedFabricImage = UIImageView()
    var emptyFinishedGarmentImage = UIImageView()
    
    let rawCottonImageFrame = CGRect(x: 8, y: 58, width: 115, height: 147)
    let ginnedCottonImageFrame = CGRect(x: 131, y: 58, width: 117, height: 159)
    let yarnImageFrame = CGRect(x: 256, y: 58, width: 99, height: 153)
    let rawFabricImageFrame = CGRect(x: 363, y: 58, width: 120, height: 127)
    let finishedFabricImageFrame = CGRect(x: 491, y: 58, width: 118, height: 156)
    let finishedGarmentImageFrame = CGRect(x: 617, y: 58, width: 119, height: 150)
    
    let emptyRawCottonImageFrame = CGRect(x: 206, y: 227, width: 115, height: 147)
    let emptyGinnedCottonImageFrame = CGRect(x: 21, y: 437, width: 117, height: 159)
    let emptyYarnImageFrame = CGRect(x: 203, y: 580, width: 99, height: 153)
    let emptyRawFabricImageFrame = CGRect(x: 490, y: 582, width: 120, height: 127)
    let emptyFinishedFabricImageFrame = CGRect(x: 612, y: 423, width: 118, height: 156)
    let emptyFinishedGarmentImageFrame = CGRect(x: 428, y: 242, width: 119, height: 150)
    
    var continueButton = UIButton()
    
    var isDraggingBlock = 0
    
    var puzzleVar = [0, 0, 0, 0, 0, 0]
    
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
        
        dragandDropLabel.text =  "Drag and drop the items to discover the production process"
        dragandDropLabel.textColor = UIColor.darkGray
        dragandDropLabel.frame = CGRect(x: 8, y: -10, width: 800, height: 100)
        dragandDropLabel.font = UIFont(name: "Savoye LET", size: 50)
        self.addSubview(dragandDropLabel)
        
        skeletonBlankImage.image = UIImage(named: "skeleton blank.jpeg")
        skeletonBlankImage.frame = CGRect(x: 8, y: 200, width: self.frame.width/2 + 220, height: self.frame.height/1.5 + 50)
        skeletonBlankImage.contentMode = .scaleAspectFit
        self.addSubview(skeletonBlankImage)
        
        rawCottonImage.image = UIImage(named: "raw cotton.jpg")
        rawCottonImage.frame = rawCottonImageFrame
        rawCottonImage.contentMode = .scaleAspectFit
        rawCottonImage.isUserInteractionEnabled = true
        self.addSubview(rawCottonImage)
        
        ginnedCottonImage.image = UIImage(named: "ginned cotton.jpg")
        ginnedCottonImage.frame = ginnedCottonImageFrame
        ginnedCottonImage.contentMode = .scaleAspectFit
        self.addSubview(ginnedCottonImage)

        yarnImage.image = UIImage(named: "yarn.jpg")
        yarnImage.frame = yarnImageFrame
        yarnImage.contentMode = .scaleAspectFit
        self.addSubview(yarnImage)

        rawFabricImage.image = UIImage(named: "raw fabric.jpg")
        rawFabricImage.frame = rawFabricImageFrame
        rawFabricImage.contentMode = .scaleAspectFit
        self.addSubview(rawFabricImage)

        finishedFabricImage.image = UIImage(named: "finished fabric.jpg")
        finishedFabricImage.frame = finishedFabricImageFrame
        finishedFabricImage.contentMode = .scaleAspectFit
        self.addSubview(finishedFabricImage)

        finishedGarmentImage.image = UIImage(named: "finished garment.jpg")
        finishedGarmentImage.frame = finishedGarmentImageFrame
        finishedGarmentImage.contentMode = .scaleAspectFit
        self.addSubview(finishedGarmentImage)
        
        emptyRawCottonImage.image = nil
        emptyRawCottonImage.frame = emptyRawCottonImageFrame
        self.addSubview(emptyRawCottonImage)
        
        emptyGinnedCottonImage.image = nil
        emptyGinnedCottonImage.frame = emptyGinnedCottonImageFrame
        self.addSubview(emptyGinnedCottonImage)
        
        emptyYarnImage.image = nil
        emptyYarnImage.frame = emptyYarnImageFrame
        self.addSubview(emptyYarnImage)
        
        emptyRawFabricImage.image = nil
        emptyRawFabricImage.frame = emptyRawFabricImageFrame
        self.addSubview(emptyRawFabricImage)
        
        emptyFinishedFabricImage.image = nil
        emptyFinishedFabricImage.frame = emptyFinishedFabricImageFrame
        self.addSubview(emptyFinishedFabricImage)
        
        emptyFinishedGarmentImage.image = nil
        emptyFinishedGarmentImage.frame = emptyFinishedGarmentImageFrame
        self.addSubview(emptyFinishedGarmentImage)
        
        continueButton.setTitle("→", for: .normal)
        continueButton.backgroundColor = UIColor.lightGray
        continueButton.frame = CGRect(x: 640, y: 670, width: 100, height: 50)
        continueButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
        continueButton.layer.cornerRadius = 14.0
        continueButton.addTarget(self, action: #selector(continueButtonPressed), for: .touchUpInside)
        
    }
    
    @objc func checkingForMatch() {
        
        if rawCottonImage.frame.intersects(emptyRawCottonImage.frame) {
            rawCottonImage.frame = emptyRawCottonImage.frame
            rawCottonImage.isUserInteractionEnabled = false
            self.puzzleVar[0] = 1
            addContinueButton()
        } else {
            rawCottonImage.frame = rawCottonImageFrame
            self.puzzleVar[0] = 0
        }
        
        if ginnedCottonImage.frame.intersects(emptyGinnedCottonImage.frame) {
            ginnedCottonImage.frame = emptyGinnedCottonImage.frame
            ginnedCottonImage.isUserInteractionEnabled = false
            self.puzzleVar[1] = 1
            addContinueButton()
        } else {
            ginnedCottonImage.frame = ginnedCottonImageFrame
            self.puzzleVar[1] = 0
        }
        
        if yarnImage.frame.intersects(emptyYarnImage.frame) {
            yarnImage.frame = emptyYarnImage.frame
            yarnImage.isUserInteractionEnabled = false
            self.puzzleVar[2] = 1
            addContinueButton()
        } else {
            yarnImage.frame = yarnImageFrame
            self.puzzleVar[2] = 0
        }
        
        if rawFabricImage.frame.intersects(emptyRawFabricImage.frame) {
            rawFabricImage.frame = emptyRawFabricImage.frame
            rawFabricImage.isUserInteractionEnabled = false
            self.puzzleVar[3] = 1
            addContinueButton()
        } else {
            rawFabricImage.frame = rawFabricImageFrame
            self.puzzleVar[3] = 0
        }
        
        if finishedFabricImage.frame.intersects(emptyFinishedFabricImage.frame) {
            finishedFabricImage.frame = emptyFinishedFabricImage.frame
            finishedFabricImage.isUserInteractionEnabled = false
            self.puzzleVar[4] = 1
            addContinueButton()
        } else {
            finishedFabricImage.frame = finishedFabricImageFrame
            self.puzzleVar[4] = 0
        }
        
        if finishedGarmentImage.frame.intersects(emptyFinishedGarmentImage.frame) {
            finishedGarmentImage.frame = emptyFinishedGarmentImage.frame
            finishedGarmentImage.isUserInteractionEnabled = false
            self.puzzleVar[5] = 1
            addContinueButton()
        } else {
            finishedGarmentImage.frame = finishedGarmentImageFrame
            self.puzzleVar[5] = 0
        }
    }
    
    func addContinueButton() {
        
        if !self.continueButton.isDescendant(of: self) {
            self.addSubview(continueButton)
        }
        
    }
    
    func animateAnswer() {
        
        rawFabricImage.isUserInteractionEnabled = false
        ginnedCottonImage.isUserInteractionEnabled = false
        yarnImage.isUserInteractionEnabled = false
        rawFabricImage.isUserInteractionEnabled = false
        finishedFabricImage.isUserInteractionEnabled = false
        finishedGarmentImage.isUserInteractionEnabled = false
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIView.AnimationOptions.curveEaseIn, animations: ({
            
            self.rawCottonImage.center = CGPoint(x: self.emptyRawCottonImageFrame.midX, y: self.emptyRawCottonImageFrame.midY)
            self.ginnedCottonImage.center = CGPoint(x: self.emptyGinnedCottonImageFrame.midX, y: self.emptyGinnedCottonImageFrame.midY)
            self.yarnImage.center = CGPoint(x: self.emptyYarnImageFrame.midX, y: self.emptyYarnImageFrame.midY)
            self.rawFabricImage.center = CGPoint(x: self.emptyRawFabricImageFrame.midX, y: self.emptyRawFabricImageFrame.midY)
            self.finishedFabricImage.center = CGPoint(x: self.emptyFinishedFabricImageFrame.midX, y: self.emptyFinishedFabricImageFrame.midY)
            self.finishedGarmentImage.center = CGPoint(x: self.emptyFinishedGarmentImageFrame.midX, y: self.emptyFinishedGarmentImageFrame.midY)
            
        }), completion: { (completion) -> Void in
            
            Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.goToNextScreen), userInfo: nil, repeats: false)
            
        })
        
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            let location = touch.location(in: self)
            
            if rawCottonImage.frame.contains(location) {
                isDraggingBlock = 1
                rawCottonImage.center = location
            } else if ginnedCottonImage.frame.contains(location) {
                isDraggingBlock = 2
                ginnedCottonImage.center = location
            } else if yarnImage.frame.contains(location) {
                isDraggingBlock = 3
                yarnImage.center = location
            } else if rawFabricImage.frame.contains(location) {
                isDraggingBlock = 4
                rawFabricImage.center = location
            } else if finishedFabricImage.frame.contains(location) {
                isDraggingBlock = 5
                finishedFabricImage.center = location
            } else if finishedGarmentImage.frame.contains(location) {
                isDraggingBlock = 6
                finishedGarmentImage.center = location
            }
        
        }
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            let location = touch.location(in: self)
            
            if rawCottonImage.frame.contains(location) && isDraggingBlock == 1 {
                rawCottonImage.center = location
            } else if ginnedCottonImage.frame.contains(location) && isDraggingBlock == 2 {
                ginnedCottonImage.center = location
            } else if yarnImage.frame.contains(location) && isDraggingBlock == 3 {
                yarnImage.center = location
            } else if rawFabricImage.frame.contains(location) && isDraggingBlock == 4 {
                rawFabricImage.center = location
            } else if finishedFabricImage.frame.contains(location) && isDraggingBlock == 5 {
                finishedFabricImage.center = location
            } else if finishedGarmentImage.frame.contains(location) && isDraggingBlock == 6 {
                finishedGarmentImage.center = location
            }
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.isDraggingBlock = 0
        checkingForMatch()
        
    }
    
    @objc func continueButtonPressed() {
        
        var allAnswered = true
        if puzzleVar.contains(0) {
            allAnswered = false
        }
        
        if allAnswered {
            goToNextScreen()
        } else {
            animateAnswer()
        }
        
    }
    
    @objc func goToNextScreen() {
    
        self.removeFromSuperview()
        
        let intermediateSkeletonView = intermediateSkeleton(scene: self)
        PlaygroundPage.current.liveView = intermediateSkeletonView
    }
    
}
