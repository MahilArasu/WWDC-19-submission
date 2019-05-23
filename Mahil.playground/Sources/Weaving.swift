import Foundation
import UIKit
import PlaygroundSupport
import AVFoundation

public class weaving: UIView {
    
    let weavingLabel = UILabel()
    
    let backgroundImage = UIImageView()
    
    let conesImage = UIImageView()
    let coneFeedImage = UIImageView()
    let warpImage1 = UIImageView()
    let warpImage2 = UIImageView()
    let weftImage = UIImageView()
    let weavingImage = UIImageView()
    let fabricImage = UIImageView()
    
    let nextScreenButton = UIButton()
    
    var timer = Timer()
    
    let conesImageFrame = CGRect(x: 90, y: 185, width: 225, height: 63)
    
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
            let audioURL = Bundle.main.url(forResource: "NH 544", withExtension: "m4a"),
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
        
        weavingImage.image = UIImage(named: "weaving.jpeg")
        weavingImage.frame = CGRect(x: 300, y: 265, width: 436, height: 328)
        weavingImage.contentMode = .scaleAspectFit
        self.addSubview(weavingImage)
        
        coneFeedImage.image = UIImage(named: "cone feed.jpeg")
        coneFeedImage.frame = CGRect(x: 75, y: 340, width: 230, height: 67)
        coneFeedImage.contentMode = .scaleAspectFit
        self.addSubview(coneFeedImage)
        
        conesImage.image = UIImage(named: "cones.jpeg")
        conesImage.frame = conesImageFrame
        conesImage.contentMode = .scaleAspectFit
        self.addSubview(conesImage)
        
        warpImage1.image = UIImage(named: "warp.png")
        warpImage1.frame = CGRect(x: 375, y: 420, width: 305, height: 144)
        warpImage1.contentMode = .scaleAspectFit
        self.addSubview(warpImage1)
        
        warpImage2.image = UIImage(named: "warp.png")
        warpImage2.frame = CGRect(x: 380, y: 410, width: 305, height: 144)
        warpImage2.contentMode = .scaleAspectFit
        self.addSubview(warpImage2)
        
        weftImage.image = UIImage(named: "weft.png")
        weftImage.frame = CGRect(x: 380, y: 415, width: 80, height: 10)
        weftImage.contentMode = .scaleAspectFit
        self.addSubview(weftImage)
        
        fabricImage.image = UIImage(named: "fabric.jpeg")
        fabricImage.frame = CGRect(x: 434, y: 585, width: 225, height: 63)
        fabricImage.contentMode = .scaleAspectFit
        self.addSubview(fabricImage)
        
        //Label
        weavingLabel.text = "Weaving"
        weavingLabel.frame = CGRect(x: 66, y: 55, width: 400, height: 120)
        weavingLabel.textColor = UIColor.black
        weavingLabel.font = UIFont(name: "Savoye LET", size: 100)
        self.addSubview(weavingLabel)
        
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
            self.warpImage1.center.y = 390
            self.warpImage2.center.y = 440
            self.weftImage.center.x = 650
        }, completion: nil)
        UIView.animate(withDuration: 1, delay: 1, options: .curveLinear, animations: {
            self.warpImage1.center.y = 450
            self.warpImage2.center.y = 380
            self.weftImage.center.x = 400
        }, completion: nil)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            let location = touch.location(in: self)
            
            if conesImage.frame.contains(location) {
                conesImage.center = location
            }
        }
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            let location = touch.location(in: self)
            
            if conesImage.frame.contains(location) {
                conesImage.center = location
            }
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if conesImage.frame.intersects(coneFeedImage.frame) {
            conesImage.center = coneFeedImage.center
            playSound()
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.performAnimation), userInfo: nil, repeats: true)
        }  else {
            timer.invalidate()
            conesImage.frame = conesImageFrame
        }
        
        nextScreenButton.isHidden = false
        
    }
    
    @objc func nextScreen() {
        
        self.removeFromSuperview()
        
        let realSkeletonView = realSkeleton(scene: self, stage: 3)
        PlaygroundPage.current.liveView = realSkeletonView
        
    }
    
}
