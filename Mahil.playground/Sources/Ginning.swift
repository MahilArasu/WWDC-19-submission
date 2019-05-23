import Foundation
import UIKit
import PlaygroundSupport
import AVFoundation

public class ginning: UIView {
    
    let ginningLabel = UILabel()
    
    let backgroundImage = UIImageView()
    
    let rawCottonImage = UIImageView()
    let gearWheelImage = UIImageView()
    let ginningImage = UIImageView()
    let cottonFeedImage = UIImageView()
    let seedBowlImage = UIImageView()
    let cottonBowlImage = UIImageView()
    
    let nextScreenButton = UIButton()
    
    let feedCottonLabel = UILabel()
    
    let rawCottonImageFrame = CGRect(x: 90, y: 185, width: 225, height: 63)
    
    public init(scene: UIView) { // Basically the viewDidLoad
        super.init(frame:CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight))
        setupUI()
    }
    
    required public init(coder aDecoder: NSCoder) {
        
        fatalError("Public Init Coder NOT working...")
        
    }
    
    fileprivate var audioURL: AVAudioPlayer? {
        didSet {
            
        }
    }
    
    fileprivate func playSound() {
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            fatalError("Unable to set the audio session cuz \(error)")
        }
        guard
            let audioURL = Bundle.main.url(forResource: "click", withExtension: "mp3"),
            let player = try? AVAudioPlayer(contentsOf: audioURL)
            else {
                fatalError("Unable to create the player")
        }
        self.audioURL = player
        player.play()
    }
    
    func setupUI() {
        
        self.frame = CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight)
        self.backgroundColor = UIColor(red: 242, green: 242, blue: 242, alpha: 1.0)
        
        backgroundImage.image = UIImage(named: "brick background.png")
        backgroundImage.frame = CGRect(x: 0, y: 0, width: 750, height: 750)
        backgroundImage.contentMode = .scaleToFill
        backgroundImage.alpha = 0.1
        self.addSubview(backgroundImage)
        
        cottonBowlImage.image = UIImage(named: "cotton bowl.jpeg")
        cottonBowlImage.frame = CGRect(x: 380, y: 570, width: 128, height: 96)
        cottonBowlImage.contentMode = .scaleAspectFit
        self.addSubview(cottonBowlImage)
        
        seedBowlImage.image = UIImage(named: "seed bowl.jpeg")
        seedBowlImage.frame = CGRect(x: 588, y: 570, width: 128, height: 96)
        seedBowlImage.contentMode = .scaleAspectFit
        self.addSubview(seedBowlImage)
        
        cottonFeedImage.image = UIImage(named: "cotton feed.jpeg")
        cottonFeedImage.frame = CGRect(x: 75, y: 340, width: 230, height: 67)
        cottonFeedImage.contentMode = .scaleAspectFit
        self.addSubview(cottonFeedImage)
        
        rawCottonImage.image = UIImage(named: "raw cotton.jpeg")
        rawCottonImage.frame = rawCottonImageFrame
        rawCottonImage.contentMode = .scaleAspectFit
        self.addSubview(rawCottonImage)

        gearWheelImage.image = UIImage(named: "gear wheel.png")
        gearWheelImage.frame = CGRect(x: 250, y: 340, width: 120, height: 120)
        gearWheelImage.contentMode = .scaleAspectFit
        self.addSubview(gearWheelImage)
        
        ginningImage.image = UIImage(named: "ginning.jpeg")
        ginningImage.frame = CGRect(x: 300, y: 265, width: 436, height: 328)
        ginningImage.contentMode = .scaleAspectFit
        self.addSubview(ginningImage)
        
        //Label
        ginningLabel.text = "Ginning"
        ginningLabel.frame = CGRect(x: 66, y: 55, width: 400, height: 120)
        ginningLabel.textColor = UIColor.black
        ginningLabel.font = UIFont(name: "Savoye LET", size: 100)
        self.addSubview(ginningLabel)
        
        //Button
        nextScreenButton.setTitle("→", for: .normal)
        nextScreenButton.backgroundColor = UIColor.lightGray
        nextScreenButton.frame = CGRect(x: 605, y: 680, width: 100, height: 50)
        nextScreenButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
        nextScreenButton.layer.cornerRadius = 14.0
        nextScreenButton.addTarget(self, action: #selector(self.nextScreen), for: .touchUpInside)
        self.addSubview(nextScreenButton)
        nextScreenButton.isHidden = true
        
        feedCottonLabel.text = "Drag the cotton to feeder."
        feedCottonLabel.frame = CGRect(x: 366, y: 115, width: 300, height: 200)
        feedCottonLabel.numberOfLines = 2
        feedCottonLabel.textColor = UIColor.gray
        feedCottonLabel.font = UIFont(name: "Savoye LET", size: 30)
        self.addSubview(feedCottonLabel)

    }
    
    func startAnimation() {
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = -Double.pi * 2
        rotationAnimation.repeatCount = .infinity
        gearWheelImage.layer.add(rotationAnimation, forKey: nil)
        
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            let location = touch.location(in: self)
            
            if rawCottonImage.frame.contains(location) {
                rawCottonImage.center = location
            }
        }
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            let location = touch.location(in: self)
            
            if rawCottonImage.frame.contains(location) {
                rawCottonImage.center = location
            }
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if rawCottonImage.frame.intersects(cottonFeedImage.frame) {
            rawCottonImage.center = cottonFeedImage.center
            playSound()
            startAnimation()
        }  else {
            rawCottonImage.frame = rawCottonImageFrame
            gearWheelImage.layer.removeAllAnimations()
        }
        
        nextScreenButton.isHidden = false
        
    }
    
    @objc func nextScreen() {
        
        self.removeFromSuperview()
        
        let realSkeletonView = realSkeleton(scene: self, stage: 1)
        PlaygroundPage.current.liveView = realSkeletonView
        
    }
    
}
