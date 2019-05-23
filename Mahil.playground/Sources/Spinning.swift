import Foundation
import UIKit
import PlaygroundSupport
import AVFoundation

public class spinning: UIView {
    
    let spinningLabel = UILabel()
    
    let backgroundImage = UIImageView()
    
    let rawCottonImage = UIImageView()
    let cottonFeedImage = UIImageView()
    let spinningImage = UIImageView()
    let threadImage1 = UIImageView()
    let threadImage2 = UIImageView()
    let threadImage3 = UIImageView()
    let coneImage1 = UIImageView()
    let coneImage2 = UIImageView()
    let coneImage3 = UIImageView()
    
    let rawCottonImageFrame = CGRect(x: 40, y: 185, width: 225, height: 63)
    var threadImageFrame: [CGRect] = []
    var conesImageFrame: [CGRect] = []
    
    let nextScreenButton = UIButton()
    
    var timer = Timer()
    
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
        
        conesImageFrame = [CGRect(x: 730, y: 299, width: 30, height: 80),
                            CGRect(x: 730, y: 405, width: 30, height: 80),
                            CGRect(x: 730, y: 501, width: 30, height: 80)
        ]
        
        threadImageFrame = [CGRect(x: 622, y: 338, width: 112, height: 5),
                            CGRect(x: 622, y: 443, width: 112, height: 5),
                            CGRect(x: 622, y: 535, width: 112, height: 5)
        ]
        
        
        
        self.frame = CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight)
        self.backgroundColor = UIColor(red: 242, green: 242, blue: 242, alpha: 1.0)
        
        //Pictures
        backgroundImage.image = UIImage(named: "brick background.png")
        backgroundImage.frame = CGRect(x: 0, y: 0, width: 750, height: 750)
        backgroundImage.contentMode = .scaleToFill
        backgroundImage.alpha = 0.1
        self.addSubview(backgroundImage)
        
        cottonFeedImage.image = UIImage(named: "cotton feed.jpeg")
        cottonFeedImage.frame = CGRect(x: 25, y: 340, width: 230, height: 67)
        cottonFeedImage.contentMode = .scaleAspectFit
        self.addSubview(cottonFeedImage)
        
        threadImage1.image = UIImage(named: "thread.jpeg")
        threadImage1.frame = threadImageFrame[0]
        threadImage1.contentMode = .scaleToFill
        self.addSubview(threadImage1)
        
        threadImage2.image = UIImage(named: "thread.jpeg")
        threadImage2.frame = threadImageFrame[1]
        threadImage2.contentMode = .scaleToFill
        self.addSubview(threadImage2)
        
        threadImage3.image = UIImage(named: "thread.jpeg")
        threadImage3.frame = threadImageFrame[2]
        threadImage3.contentMode = .scaleToFill
        self.addSubview(threadImage3)
        
        coneImage1.image = UIImage(named: "cone.jpeg")
        coneImage1.frame = conesImageFrame[0]
        coneImage1.contentMode = .scaleAspectFit
        self.addSubview(coneImage1)
        
        coneImage2.image = UIImage(named: "cone.jpeg")
        coneImage2.frame = conesImageFrame[1]
        coneImage2.contentMode = .scaleAspectFit
        self.addSubview(coneImage2)
        
        coneImage3.image = UIImage(named: "cone.jpeg")
        coneImage3.frame = conesImageFrame[2]
        coneImage3.contentMode = .scaleAspectFit
        self.addSubview(coneImage3)
        
        spinningImage.image = UIImage(named: "spinning.jpeg")
        spinningImage.frame = CGRect(x: 250, y: 265, width: 436, height: 328)
        spinningImage.contentMode = .scaleAspectFit
        self.addSubview(spinningImage)
        
        rawCottonImage.image = UIImage(named: "cotton.jpeg")
        rawCottonImage.frame = rawCottonImageFrame
        rawCottonImage.contentMode = .scaleAspectFit
        self.addSubview(rawCottonImage)
        
        //Label
        spinningLabel.text = "Spinning"
        spinningLabel.frame = CGRect(x: 66, y: 55, width: 400, height: 120)
        spinningLabel.textColor = UIColor.black
        spinningLabel.font = UIFont(name: "Savoye LET", size: 100)
        self.addSubview(spinningLabel)
        
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

    @objc func performAnimation() {
        
        UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: {
            self.threadImage1.transform = CGAffineTransform.init(rotationAngle: CGFloat.pi/8)
            self.threadImage2.transform = CGAffineTransform.init(rotationAngle: CGFloat.pi/8)
            self.threadImage3.transform = CGAffineTransform.init(rotationAngle: CGFloat.pi/8)
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 1, options: .curveLinear, animations: {
            self.threadImage1.transform = CGAffineTransform.init(rotationAngle: -CGFloat.pi/8)
            self.threadImage2.transform = CGAffineTransform.init(rotationAngle: -CGFloat.pi/8)
            self.threadImage3.transform = CGAffineTransform.init(rotationAngle: -CGFloat.pi/8)
        }, completion: nil)
        
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
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.performAnimation), userInfo: nil, repeats: true)
        }  else {
            timer.invalidate()
            rawCottonImage.frame = rawCottonImageFrame
        }
        
        nextScreenButton.isHidden = false
        
    }
    
    @objc func nextScreen() {
        
        self.removeFromSuperview()
        
        let realSkeletonView = realSkeleton(scene: self, stage: 2)
        PlaygroundPage.current.liveView = realSkeletonView
        
    }
    
}
