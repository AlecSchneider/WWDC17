import UIKit
import AVFoundation


public class VideoPlayer: UIView {
    
    private var player : AVQueuePlayer!
    
    private var playerLayer : AVPlayerLayer!
    
    public init() {
        super.init(frame: CGRect.zero)
        
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    public func playVideoWithURL(_ url: URL) {
        let playerItem = AVPlayerItem(url: url)
        player=AVQueuePlayer(items: [playerItem])
        playerLayer=AVPlayerLayer(player: player)
        
        playerLayer.frame=self.bounds
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        self.layer.addSublayer(playerLayer)
        player.actionAtItemEnd = .none
        player.isMuted = true
        player.play()
        
        loopVideo(videoPlayer: player)
    }
    
    public func addVideo(_ url: URL) {
        let playerItem = AVPlayerItem(url: url)
        player.insert(playerItem, after: nil)
    }
    public func loopVideo(videoPlayer: AVQueuePlayer) {
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil, queue: nil) { notification in
            if (videoPlayer.items().count == 1) {
                videoPlayer.seek(to: kCMTimeZero)
                videoPlayer.play()
            } else {
                videoPlayer.advanceToNextItem()
            }
        }
    }
    
}
