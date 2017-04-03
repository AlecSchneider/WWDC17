import UIKit
import AVFoundation

public class AudioPlayer: UIView {
    
    private var player : AVQueuePlayer!
    
    private var playerLayer : AVPlayerLayer!
    public var looped: Bool = false
    public var itemsInQueue: Int = 0
    
    public init() {
        super.init(frame: CGRect.zero)
        player=AVQueuePlayer(items: [])
        playerLayer=AVPlayerLayer(player: player)
        
        playerLayer.frame=self.bounds
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        self.layer.addSublayer(playerLayer)
        player.actionAtItemEnd = .none
        player.play()
        player.volume = 0.01
        loopVideo(audioPlayer: player)
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    public func addVideo(_ url: URL) {
        let playerItem = AVPlayerItem(url: url)
        player.insert(playerItem, after: nil)
    }
    public func loopVideo(audioPlayer: AVQueuePlayer) {
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil, queue: nil) { notification in
            if (self.looped && self.itemsInQueue == 1) {
                audioPlayer.seek(to: kCMTimeZero)
            } else {
                audioPlayer.advanceToNextItem()
                if (self.itemsInQueue > 0) {
                    self.itemsInQueue -= 1
                }
            }
        }
    }
    
}
