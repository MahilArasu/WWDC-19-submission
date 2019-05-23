import Foundation
import UIKit
import PlaygroundSupport

public class realSkeleton: UIView {

    let directionLabel = UILabel()
    
    let backgroundImage = UIImageView()
    
    let ginningImage = UIImageView()
    let spinningImage = UIImageView()
    let weavingImage = UIImageView()
    let dyeingImage = UIImageView()
    let knittingImage = UIImageView()
    
    let stepToGinning1 = UIImageView()
    let stepToGinning2 = UIImageView()
    let stepToGinning3 = UIImageView()
    let stepToGinning4 = UIImageView()
    let stepToGinning5 = UIImageView()
    let stepToGinning6 = UIImageView()
    let stepToGinning7 = UIImageView()
    let stepToGinning8 = UIImageView()
    let stepToGinning9 = UIImageView()
    
    let stepToSpinning1 = UIImageView()
    let stepToSpinning2 = UIImageView()
    let stepToSpinning3 = UIImageView()
    let stepToSpinning4 = UIImageView()
    let stepToSpinning5 = UIImageView()
    
    let stepToWeaving1 = UIImageView()
    let stepToWeaving2 = UIImageView()
    
    let stepToDyeing1 = UIImageView()
    
    let stepToKnitting1 = UIImageView()
    
    let ginningButton = UIButton()
    let spinningButton = UIButton()
    let weavingButton = UIButton()
    let dyeingButton = UIButton()
    let knittingButton = UIButton()
    
    var timer = Timer()
    
    public init(scene: UIView, stage: Int) { // Basically the viewDidLoad
        
        super.init(frame:CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight))
        setupUI()
        loadSteps()
        if stage == 0 {
            stageGinning()
        } else if stage == 1 {
            stageSpinning()
        } else if stage == 2 {
            stageWeaving()
        } else if stage == 3 {
            stageDyeing()
        } else if stage == 4 {
            stageKnitting()
        } else if stage == 5 {
            goToNextScreen()
        }
        
    }
    
    required public init(coder aDecoder: NSCoder) {
        
        fatalError("Public Init Coder NOT working...")
        
    }
    
    func setupUI() {
        self.frame = CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight)
        self.backgroundColor = UIColor(red: 242, green: 242, blue: 242, alpha: 1.0)
        
        backgroundImage.image = UIImage(named: "skeleton background.jpg")
        backgroundImage.frame = CGRect(x: 0, y: 0, width: 780, height: 750)
        backgroundImage.contentMode = .scaleToFill
        backgroundImage.alpha = 0.1
        self.addSubview(backgroundImage)
        
        ginningImage.image = UIImage(named: "ginning process.jpeg")
        ginningImage.frame = CGRect(x: 77, y: 529, width: 150, height: 150)
        ginningImage.contentMode = .scaleAspectFit
        ginningImage.isHidden = true
        self.addSubview(ginningImage)
        
        spinningImage.image = UIImage(named: "spinning process.jpeg")
        spinningImage.frame = CGRect(x: 71, y: 281, width: 150, height: 150)
        spinningImage.contentMode = .scaleAspectFit
        spinningImage.isHidden = true
        self.addSubview(spinningImage)
        
        weavingImage.image = UIImage(named: "weaving process.jpeg")
        weavingImage.frame = CGRect(x: 325, y: 275, width: 150, height: 150)
        weavingImage.contentMode = .scaleAspectFit
        weavingImage.isHidden = true
        self.addSubview(weavingImage)
        
        dyeingImage.image = UIImage(named: "dyeing process.jpeg")
        dyeingImage.frame = CGRect(x: 555, y: 255, width: 150, height: 150)
        dyeingImage.contentMode = .scaleAspectFit
        dyeingImage.isHidden = true
        self.addSubview(dyeingImage)
        
        knittingImage.image = UIImage(named: "knitting process.jpeg")
        knittingImage.frame = CGRect(x: 565, y: 19, width: 150, height: 150)
        knittingImage.contentMode = .scaleAspectFit
        knittingImage.isHidden = true
        self.addSubview(knittingImage)
        
        ginningButton.frame = CGRect(x: 77, y: 529, width: 150, height: 150)
        ginningButton.addTarget(self, action: #selector(ginningButtonPressed), for: .touchUpInside)
        ginningButton.isHidden = true
        self.addSubview(ginningButton)
        
        spinningButton.frame = CGRect(x: 71, y: 281, width: 150, height: 150)
        spinningButton.addTarget(self, action: #selector(spinningButtonPressed), for: .touchUpInside)
        spinningButton.isHidden = true
        self.addSubview(spinningButton)
        
        weavingButton.frame = CGRect(x: 325, y: 275, width: 150, height: 150)
        weavingButton.addTarget(self, action: #selector(weavingButtonPressed), for: .touchUpInside)
        weavingButton.isHidden = true
        self.addSubview(weavingButton)
        
        dyeingButton.frame = CGRect(x: 555, y: 255, width: 150, height: 150)
        dyeingButton.addTarget(self, action: #selector(dyeingButtonPressed), for: .touchUpInside)
        dyeingButton.isHidden = true
        self.addSubview(dyeingButton)
        
        knittingButton.frame = CGRect(x: 565, y: 19, width: 150, height: 150)
        knittingButton.addTarget(self, action: #selector(knittingButtonPressed), for: .touchUpInside)
        knittingButton.isHidden = true
        self.addSubview(knittingButton)
        
        directionLabel.text = "Process flow"
        directionLabel.frame = CGRect(x: 16, y: 16, width: 300, height: 200)
        directionLabel.numberOfLines = 2
        directionLabel.textColor = UIColor.darkGray
        directionLabel.font = UIFont(name: "Savoye LET", size: 80)
        self.addSubview(directionLabel)
    }
    
    func loadSteps() {
        
        stepToGinning1.image =  UIImage(named: "shoe steps right.png")
        stepToGinning1.frame = CGRect(x: 35, y: 705, width: 40, height: 40)
        stepToGinning1.contentMode = .scaleAspectFit
        stepToGinning1.isHidden = true
        self.addSubview(stepToGinning1)
        
        stepToGinning2.image =  UIImage(named: "shoe steps right.png")
        stepToGinning2.frame = CGRect(x: 95, y: 705, width: 40, height: 40)
        stepToGinning2.contentMode = .scaleAspectFit
        stepToGinning2.isHidden = true
        self.addSubview(stepToGinning2)
        
        stepToGinning3.image =  UIImage(named: "shoe steps right.png")
        stepToGinning3.frame = CGRect(x: 155, y: 705, width: 40, height: 40)
        stepToGinning3.contentMode = .scaleAspectFit
        stepToGinning3.isHidden = true
        self.addSubview(stepToGinning3)
        
        stepToGinning4.image =  UIImage(named: "shoe steps right.png")
        stepToGinning4.frame = CGRect(x: 215, y: 705, width: 40, height: 40)
        stepToGinning4.contentMode = .scaleAspectFit
        stepToGinning4.isHidden = true
        self.addSubview(stepToGinning4)
        
        stepToGinning5.image =  UIImage(named: "shoe steps right.png")
        stepToGinning5.frame = CGRect(x: 275, y: 705, width: 40, height: 40)
        stepToGinning5.contentMode = .scaleAspectFit
        stepToGinning5.isHidden = true
        self.addSubview(stepToGinning5)
        
        stepToGinning6.image =  UIImage(named: "shoe steps.png")
        stepToGinning6.frame = CGRect(x: 335, y: 695, width: 40, height: 40)
        stepToGinning6.contentMode = .scaleAspectFit
        stepToGinning6.transform = CGAffineTransform(rotationAngle: 45)
        stepToGinning6.isHidden = true
        self.addSubview(stepToGinning6)
        
        stepToGinning7.image =  UIImage(named: "shoe steps.png")
        stepToGinning7.frame = CGRect(x: 335, y: 635, width: 40, height: 40)
        stepToGinning7.contentMode = .scaleAspectFit
        stepToGinning7.isHidden = true
        self.addSubview(stepToGinning7)
        
        stepToGinning8.image =  UIImage(named: "shoe steps.png")
        stepToGinning8.frame = CGRect(x: 305, y: 575, width: 40, height: 40)
        stepToGinning8.contentMode = .scaleAspectFit
        stepToGinning8.transform = CGAffineTransform(rotationAngle: -45)
        stepToGinning8.isHidden = true
        self.addSubview(stepToGinning8)
        
        
        stepToGinning9.image = UIImage(named: "shoe steps left.png")
        stepToGinning9.frame = CGRect(x: 245, y: 555, width: 40, height: 40)
        stepToGinning9.contentMode = .scaleAspectFit
        stepToGinning9.transform = CGAffineTransform(rotationAngle: -45)
        stepToGinning9.isHidden = true
        self.addSubview(stepToGinning9)
        
        
        stepToSpinning1.image = UIImage(named: "shoe steps left.png")
        stepToSpinning1.frame = CGRect(x: 35, y: 575, width: 40, height: 40)
        stepToSpinning1.contentMode = .scaleAspectFit
        stepToSpinning1.transform = CGAffineTransform(rotationAngle: -45)
        stepToSpinning1.isHidden = true
        self.addSubview(stepToSpinning1)
        
        stepToSpinning2.image = UIImage(named: "shoe steps.png")
        stepToSpinning2.frame = CGRect(x: 25, y: 515, width: 40, height: 40)
        stepToSpinning2.contentMode = .scaleAspectFit
        stepToSpinning2.isHidden = true
        self.addSubview(stepToSpinning2)
        
        stepToSpinning3.image = UIImage(named: "shoe steps.png")
        stepToSpinning3.frame = CGRect(x: 25, y: 455, width: 40, height: 40)
        stepToSpinning3.contentMode = .scaleAspectFit
        stepToSpinning3.isHidden = true
        self.addSubview(stepToSpinning3)
        
        stepToSpinning4.image = UIImage(named: "shoe steps.png")
        stepToSpinning4.frame = CGRect(x: 25, y: 395, width: 40, height: 40)
        stepToSpinning4.contentMode = .scaleAspectFit
        stepToSpinning4.isHidden = true
        self.addSubview(stepToSpinning4)
        
        stepToSpinning5.image = UIImage(named: "shoe steps.png")
        stepToSpinning5.frame = CGRect(x: 25, y: 335, width: 40, height: 40)
        stepToSpinning5.contentMode = .scaleAspectFit
        stepToSpinning5.transform = CGAffineTransform(rotationAngle: 45)
        stepToSpinning5.isHidden = true
        self.addSubview(stepToSpinning5)
        
        stepToWeaving1.image = UIImage(named: "shoe steps right.png")
        stepToWeaving1.frame = CGRect(x: 211, y: 335, width: 40, height: 40)
        stepToWeaving1.contentMode = .scaleAspectFit
        stepToWeaving1.isHidden = true
        self.addSubview(stepToWeaving1)
        
        stepToWeaving2.image = UIImage(named: "shoe steps right.png")
        stepToWeaving2.frame = CGRect(x:271, y: 335, width: 40, height: 40)
        stepToWeaving2.contentMode = .scaleAspectFit
        stepToWeaving2.isHidden = true
        self.addSubview(stepToWeaving2)
        
        stepToDyeing1.image = UIImage(named: "shoe steps right.png")
        stepToDyeing1.frame = CGRect(x:490, y: 335, width: 40, height: 40)
        stepToDyeing1.contentMode = .scaleAspectFit
        stepToDyeing1.isHidden = true
        self.addSubview(stepToDyeing1)
        
        stepToKnitting1.image = UIImage(named: "shoe steps.png")
        stepToKnitting1.frame = CGRect(x:615, y: 190, width: 40, height: 40)
        stepToKnitting1.contentMode = .scaleAspectFit
        stepToKnitting1.isHidden = true
        self.addSubview(stepToKnitting1)
        
    }
    
    func stageGinning() {
        var countVar = 0
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (time) in
            if countVar == 0 {
                self.stepToGinning1.isHidden = false
            } else if countVar == 1 {
                self.stepToGinning2.isHidden = false
            } else if countVar == 2 {
                self.stepToGinning3.isHidden = false
            } else if countVar == 3 {
                self.stepToGinning4.isHidden = false
            } else if countVar == 4 {
                self.stepToGinning5.isHidden = false
            } else if countVar == 5 {
                self.stepToGinning6.isHidden = false
            } else if countVar == 6 {
                self.stepToGinning7.isHidden = false
            } else if countVar == 7 {
                self.stepToGinning8.isHidden = false
            } else if countVar == 8 {
                self.stepToGinning9.isHidden = false
            } else {
                self.ginningImage.isHidden = false
                self.ginningButton.isHidden = false
                self.timer.invalidate()
            }
            countVar += 1
        }
    }
        
    func stageSpinning() {
        var countVar = 0
        self.stepToGinning1.isHidden = false
        self.stepToGinning2.isHidden = false
        self.stepToGinning3.isHidden = false
        self.stepToGinning4.isHidden = false
        self.stepToGinning5.isHidden = false
        self.stepToGinning6.isHidden = false
        self.stepToGinning7.isHidden = false
        self.stepToGinning8.isHidden = false
        self.stepToGinning9.isHidden = false
        self.ginningImage.isHidden = false
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { (time) in
            if countVar == 0 {
                self.stepToSpinning1.isHidden = false
            } else if countVar == 1 {
                self.stepToSpinning2.isHidden = false
            } else if countVar == 2 {
                self.stepToSpinning3.isHidden = false
            } else if countVar == 3 {
                self.stepToSpinning4.isHidden = false
            } else if countVar == 4 {
                self.stepToSpinning5.isHidden = false
            } else {
                self.spinningImage.isHidden = false
                self.spinningButton.isHidden = false
                self.timer.invalidate()
            }
            countVar += 1
        })
    }
    
    func stageWeaving() {
        var countVar = 0
        
        self.stepToGinning1.isHidden = false
        self.stepToGinning2.isHidden = false
        self.stepToGinning3.isHidden = false
        self.stepToGinning4.isHidden = false
        self.stepToGinning5.isHidden = false
        self.stepToGinning6.isHidden = false
        self.stepToGinning7.isHidden = false
        self.stepToGinning8.isHidden = false
        self.stepToGinning9.isHidden = false
        self.ginningImage.isHidden = false
        
        self.stepToSpinning1.isHidden = false
        self.stepToSpinning2.isHidden = false
        self.stepToSpinning3.isHidden = false
        self.stepToSpinning4.isHidden = false
        self.stepToSpinning5.isHidden = false
        self.spinningImage.isHidden = false
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { (time) in
            if countVar == 0 {
                self.stepToWeaving1.isHidden = false
            } else if countVar == 1 {
                self.stepToWeaving2.isHidden = false
            } else {
                self.weavingImage.isHidden = false
                self.weavingButton.isHidden = false
                self.timer.invalidate()
            }
            countVar += 1
        })
    }
    
    func stageDyeing() {
        var countVar = 0
        
        self.stepToGinning1.isHidden = false
        self.stepToGinning2.isHidden = false
        self.stepToGinning3.isHidden = false
        self.stepToGinning4.isHidden = false
        self.stepToGinning5.isHidden = false
        self.stepToGinning6.isHidden = false
        self.stepToGinning7.isHidden = false
        self.stepToGinning8.isHidden = false
        self.stepToGinning9.isHidden = false
        self.ginningImage.isHidden = false
        
        self.stepToSpinning1.isHidden = false
        self.stepToSpinning2.isHidden = false
        self.stepToSpinning3.isHidden = false
        self.stepToSpinning4.isHidden = false
        self.stepToSpinning5.isHidden = false
        self.spinningImage.isHidden = false
        
        self.stepToWeaving1.isHidden = false
        self.stepToWeaving2.isHidden = false
        self.weavingImage.isHidden = false
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { (time) in
            if countVar == 0 {
                self.stepToDyeing1.isHidden = false
            } else {
                self.dyeingImage.isHidden = false
                self.dyeingButton.isHidden = false
                self.timer.invalidate()
            }
            countVar += 1
        })
    }
    
    func stageKnitting() {
        var countVar = 0
        
        self.stepToGinning1.isHidden = false
        self.stepToGinning2.isHidden = false
        self.stepToGinning3.isHidden = false
        self.stepToGinning4.isHidden = false
        self.stepToGinning5.isHidden = false
        self.stepToGinning6.isHidden = false
        self.stepToGinning7.isHidden = false
        self.stepToGinning8.isHidden = false
        self.stepToGinning9.isHidden = false
        self.ginningImage.isHidden = false
        
        self.stepToSpinning1.isHidden = false
        self.stepToSpinning2.isHidden = false
        self.stepToSpinning3.isHidden = false
        self.stepToSpinning4.isHidden = false
        self.stepToSpinning5.isHidden = false
        self.spinningImage.isHidden = false
        
        self.stepToWeaving1.isHidden = false
        self.stepToWeaving2.isHidden = false
        self.weavingImage.isHidden = false
        
        self.stepToDyeing1.isHidden = false
        self.dyeingImage.isHidden = false
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { (time) in
            if countVar == 0 {
                self.stepToKnitting1.isHidden = false
            } else {
                self.knittingImage.isHidden = false
                self.knittingButton.isHidden = false
                self.timer.invalidate()
            }
            countVar += 1
        })
    }
    
    @objc func ginningButtonPressed() {
        self.removeFromSuperview()
        
        let ginningView = ginning(scene: self)
        PlaygroundPage.current.liveView = ginningView
    }
    
    @objc func spinningButtonPressed() {
        self.removeFromSuperview()
        
        let spinningView = spinning(scene: self)
        PlaygroundPage.current.liveView = spinningView
    }
    
    @objc func weavingButtonPressed() {
        self.removeFromSuperview()
        
        let weavingView = weaving(scene: self)
        PlaygroundPage.current.liveView = weavingView
    }
    
    @objc func dyeingButtonPressed() {
        self.removeFromSuperview()
        
        let dyeingView = dying(scene: self)
        PlaygroundPage.current.liveView = dyeingView
    }
    
    @objc func knittingButtonPressed() {
        self.removeFromSuperview()
        
        let knittingView = knitting(scene: self)
        PlaygroundPage.current.liveView = knittingView
    }
    
    func goToNextScreen() {
        
        self.removeFromSuperview()
        
        let byebyeView = byebye(scene: self)
        PlaygroundPage.current.liveView = byebyeView
    }
    
}
