import UIKit
import PlaygroundSupport
import AVFoundation
@objc(MainViewController)
public class MainViewController: UIViewController, PlaygroundLiveViewSafeAreaContainer {
    let defaultUrl = Bundle.main.url(forResource: "Default", withExtension: "mp4")
    let deskOnUrl = Bundle.main.url(forResource: "TurnOnDesk", withExtension: "mp4")
    let deskUrl = Bundle.main.url(forResource: "Desk", withExtension: "mp4")
    let deskOffUrl = Bundle.main.url(forResource: "TurnOffDesk", withExtension: "mp4")
    let roomOnUrl = Bundle.main.url(forResource: "TurnOnRoom", withExtension: "mp4")
    let roomUrl = Bundle.main.url(forResource: "Room", withExtension: "mp4")
    let roomOffUrl = Bundle.main.url(forResource: "TurnOffRoom", withExtension: "mp4")
    let roomDeskOnUrl = Bundle.main.url(forResource: "RoomTurnOnDesk", withExtension: "mp4")
    let roomDeskUrl = Bundle.main.url(forResource: "RoomDesk", withExtension: "mp4")
    let roomDeskOffUrl = Bundle.main.url(forResource: "RoomTurnOffDesk", withExtension: "mp4")
    let deskRoomOnUrl = Bundle.main.url(forResource: "DeskTurnOnRoom", withExtension: "mp4")
    let deskRoomOffUrl = Bundle.main.url(forResource: "DeskTurnOffRoom", withExtension: "mp4")
    let partyUrl = Bundle.main.url(forResource: "PartyLights", withExtension: "mp4")
    let fanOnUrl = Bundle.main.url(forResource: "fanOn", withExtension: "m4a")
    let fanUrl = Bundle.main.url(forResource: "fan", withExtension: "m4a")
    let fanOffUrl = Bundle.main.url(forResource: "fanOff", withExtension: "m4a")
    
    var videoPlayer: VideoPlayer!
    var audioPlayer: AudioPlayer!
    var deskBool: Bool = false
    var roomBool: Bool = false
    var partyBool: Bool = false
    var fanBool: Bool = false
    
    @IBOutlet var safeArea: UIView!
    @IBOutlet var videoView: UIView!
    @IBOutlet var phoneView: UIView!
    @IBOutlet var emoteView: UIView!
    @IBOutlet var soccerView: UIView!
    @IBOutlet var bachelorView: UIView!
    @IBOutlet var screenView: UIView!
    @IBOutlet var detailView: UIView!
    @IBOutlet var detailImageView: UIImageView!
    @IBOutlet var detailTextView: UITextView!
    @IBOutlet var detailTitle: UILabel!
    @IBOutlet var partyButton: UIButton!
    @IBOutlet var deskButton: UIButton!
    @IBOutlet var roomButton: UIButton!
    @IBOutlet var fanButton: UIButton!
    @IBOutlet var emoteInfo: UIButton!
    @IBOutlet var homeInfo: UIButton!
    @IBOutlet var soccerInfo: UIButton!
    @IBOutlet var bachelorInfo: UIButton!
    
    @IBAction func dismissDetailView(_ sender: Any) {
        detailView.isHidden = true
    }
    @IBAction func showSoccerInfo(_ sender: Any) {
        detailTitle.text = projects["soccer"]!["title"]!
        detailTextView.text = projects["soccer"]!["description"]!
        let image = projects["soccer"]!["image"]!
        detailImageView.image = UIImage(named: image)
        
        detailView.isHidden = false
    }
    @IBAction func showBachelorInfo(_ sender: Any) {
        detailTitle.text = projects["bachelor"]!["title"]!
        detailTextView.text = projects["bachelor"]!["description"]!
        let image = projects["bachelor"]!["image"]!
        detailImageView.image = UIImage(named: image)
        
        detailView.isHidden = false
    }
    @IBAction func showHomeInfo(_ sender: Any) {
        detailTitle.text = projects["home"]!["title"]!
        detailTextView.text = projects["home"]!["description"]!
        let image = projects["home"]!["image"]!
        detailImageView.image = UIImage(named: image)
        
        detailView.isHidden = false
    }
    @IBAction func showEmoteInfo(_ sender: Any) {
        detailTitle.text = projects["emotechatbot"]!["title"]!
        detailTextView.text = projects["emotechatbot"]!["description"]!
        let image = projects["emotechatbot"]!["image"]!
        detailImageView.image = UIImage(named: image)
        
        detailView.isHidden = false
    }
    @IBAction func party(_ sender: Any) {
        if (deskBool && roomBool) {
            videoPlayer.addVideo(roomDeskOffUrl!)
            //            videoPlayer.addVideo(roomUrl!)
            deskButton.isSelected = false
            deskBool = false
            videoPlayer.addVideo(roomOffUrl!)
            //            videoPlayer.addVideo(defaultUrl!)
            roomButton.isSelected = false
            roomBool = false
            videoPlayer.addVideo(partyUrl!)
            partyButton.isSelected = true
            partyBool = true
        }
        else if (roomBool) {
            videoPlayer.addVideo(roomOffUrl!)
            //            videoPlayer.addVideo(defaultUrl!)
            roomButton.isSelected = false
            roomBool = false
            videoPlayer.addVideo(partyUrl!)
            partyButton.isSelected = true
            partyBool = true
        }
        else if (deskBool) {
            videoPlayer.addVideo(deskOffUrl!)
            //            videoPlayer.addVideo(defaultUrl!)
            deskButton.isSelected = false
            deskBool = false
            videoPlayer.addVideo(partyUrl!)
            partyButton.isSelected = true
            partyBool = true
        }
        else if (partyBool) {
            videoPlayer.addVideo(defaultUrl!)
            partyButton.isSelected = false
            partyBool = false
        }
        else {
            videoPlayer.addVideo(partyUrl!)
            partyButton.isSelected = true
            partyBool = true
        }
        
        if (homeInfo.isHidden) {
            homeInfo.isHidden = false
        }
    }
    @IBAction func desk(_ sender: Any) {
        if (deskBool && roomBool) {
            videoPlayer.addVideo(roomDeskOffUrl!)
            videoPlayer.addVideo(roomUrl!)
            deskButton.isSelected = false
            deskBool = false
        }
        else if (roomBool) {
            videoPlayer.addVideo(roomDeskOnUrl!)
            videoPlayer.addVideo(roomDeskUrl!)
            deskButton.isSelected = true
            deskBool = true
        }
        else if (deskBool) {
            videoPlayer.addVideo(deskOffUrl!)
            videoPlayer.addVideo(defaultUrl!)
            deskButton.isSelected = false
            deskBool = false
        }
        else if (partyBool) {
            videoPlayer.addVideo(deskOnUrl!)
            videoPlayer.addVideo(deskUrl!)
            deskButton.isSelected = true
            deskBool = true
            partyButton.isSelected = false
            partyBool = false
        }
        else {
            videoPlayer.addVideo(deskOnUrl!)
            videoPlayer.addVideo(deskUrl!)
            deskButton.isSelected = true
            deskBool = true
        }
    }
    @IBAction func room(_ sender: Any) {
        if (deskBool && roomBool) {
            videoPlayer.addVideo(deskRoomOffUrl!)
            videoPlayer.addVideo(deskUrl!)
            roomButton.isSelected = false
            roomBool = false
        }
        else if (roomBool) {
            videoPlayer.addVideo(roomOffUrl!)
            videoPlayer.addVideo(defaultUrl!)
            roomButton.isSelected = false
            roomBool = false
        }
        else if (deskBool) {
            videoPlayer.addVideo(deskRoomOnUrl!)
            videoPlayer.addVideo(roomDeskUrl!)
            roomButton.isSelected = true
            roomBool = true
        }
        else if (partyBool) {
            videoPlayer.addVideo(roomOnUrl!)
            videoPlayer.addVideo(roomUrl!)
            roomButton.isSelected = true
            roomBool = true
            partyButton.isSelected = false
            partyBool = false
        }
        else {
            videoPlayer.addVideo(roomOnUrl!)
            videoPlayer.addVideo(roomUrl!)
            roomButton.isSelected = true
            roomBool = true
        }
    }
    @IBAction func fan(_ sender: Any) {
        if (fanBool) {
            fanBool = false
            fanButton.isSelected = false
            audioPlayer.addVideo(fanOffUrl!)
            audioPlayer.looped = false
            audioPlayer.itemsInQueue += 1
        }
        else {
            fanBool = true
            fanButton.isSelected = true
            audioPlayer.addVideo(fanOnUrl!)
            audioPlayer.looped = true
            audioPlayer.itemsInQueue += 1
            audioPlayer.addVideo(fanUrl!)
            audioPlayer.itemsInQueue += 1
        }
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        videoPlayer = VideoPlayer(frame: videoView.frame)
        audioPlayer = AudioPlayer()
        videoView.addSubview(audioPlayer)
        videoView.addSubview(videoPlayer)
        videoView.sendSubview(toBack: videoPlayer)
        let url = Bundle.main.url(forResource: "Default", withExtension: "mp4")
        videoPlayer.playVideoWithURL(url!)
        var rotationWithPerspective = CATransform3DIdentity;
        rotationWithPerspective.m34 = -1.0/200.0
        var radians = 2.0 * .pi / 180
        rotationWithPerspective = CATransform3DRotate(rotationWithPerspective, CGFloat(radians), 1, 0, 0); // 1 0 0 = x axis
        radians = 1.0 * .pi / 180
        rotationWithPerspective = CATransform3DRotate(rotationWithPerspective, CGFloat(radians), 0, 1, 0); // 1 0 0 = x axis
        radians = -2 * .pi / 180
        rotationWithPerspective = CATransform3DRotate(rotationWithPerspective, CGFloat(radians), 0, 0, 1); // 1 0 0 = x axis
        phoneView.layer.transform = rotationWithPerspective
        phoneView.layer.zPosition = 100
        let img = UIImage(named: "chatbotPreview.JPG")
        let lpview = LivePhotoView(image: img!,
                                   imageURL: Bundle.main.url(forResource: "chatbotPreview", withExtension: "JPG")!,
                                   videoURL: Bundle.main.url(forResource: "chatbotPreview", withExtension: "MOV")!,
                                   width: emoteView.frame.width,
                                   height: emoteView.frame.height,
                                   infoButton: emoteInfo)
        emoteView.addSubview(lpview)
        lpview.prepareLivePhoto()
        rotationWithPerspective = CATransform3DIdentity;
        rotationWithPerspective.m34 = 1.0/1000.0
        radians = -35.0 * .pi / 180
        rotationWithPerspective = CATransform3DRotate(rotationWithPerspective, CGFloat(radians), 1, 0, 0); // 1 0 0 = x axis
        radians = -5.0 * .pi / 180
        rotationWithPerspective = CATransform3DRotate(rotationWithPerspective, CGFloat(radians), 0, 1, 0); // 1 0 0 = x axis
        radians = 6.0 * .pi / 180
        rotationWithPerspective = CATransform3DRotate(rotationWithPerspective, CGFloat(radians), 0, 0, 1); // 1 0 0 = x axis
        emoteView.layer.transform = rotationWithPerspective
        emoteView.layer.zPosition = 100
        
        rotationWithPerspective = CATransform3DIdentity;
        rotationWithPerspective.m34 = 1.0/1500.00
        radians = 15.0 * .pi / 180
        rotationWithPerspective = CATransform3DRotate(rotationWithPerspective, CGFloat(radians), 1, 0, 0); // 1 0 0 = x axis
        radians = 0 * .pi / 180
        rotationWithPerspective = CATransform3DRotate(rotationWithPerspective, CGFloat(radians), 0, 1, 0); // 1 0 0 = x axis
        radians = 0 * .pi / 180
        rotationWithPerspective = CATransform3DRotate(rotationWithPerspective, CGFloat(radians), 0, 0, 1); // 1 0 0 = x axis
        screenView.layer.transform = rotationWithPerspective
        screenView.layer.zPosition = 100
        let img2 = UIImage(named: "soccerPreview.JPG")
        let lpview2 = LivePhotoView(image: img2!,
                                    imageURL: Bundle.main.url(forResource: "soccerPreview", withExtension: "JPG")!,
                                    videoURL: Bundle.main.url(forResource: "soccerPreview", withExtension: "MOV")!,
                                    width: soccerView.frame.width,
                                    height: soccerView.frame.height,
                                    infoButton: soccerInfo)
        soccerView.addSubview(lpview2)
        lpview2.prepareLivePhoto()
        let img3 = UIImage(named: "bachelorPreview.JPG")
        let lpview3 = LivePhotoView(image: img3!,
                                    imageURL: Bundle.main.url(forResource: "bachelorPreview", withExtension: "JPG")!,
                                    videoURL: Bundle.main.url(forResource: "bachelorPreview", withExtension: "MOV")!,
                                    width: bachelorView.frame.width,
                                    height: bachelorView.frame.height,
                                    infoButton: bachelorInfo)
        bachelorView.addSubview(lpview3)
        lpview3.prepareLivePhoto()
        detailView.layer.zPosition = 1000
        detailView.layer.shadowColor = UIColor.black.cgColor
        detailView.layer.shadowOpacity = 1
        detailView.layer.shadowOffset = CGSize.zero
        detailView.layer.shadowRadius = 10
        detailView.layer.cornerRadius = 8.0
        detailView.clipsToBounds = true
        NSLayoutConstraint.activate([
            safeArea.topAnchor.constraint(equalTo: liveViewSafeAreaGuide.topAnchor),
            safeArea.bottomAnchor.constraint(equalTo: liveViewSafeAreaGuide.bottomAnchor)
            ])
        resetConstraintsForViewSize()
    }
    private func resetConstraintsForViewSize() {
//        var currentWidth = UIScreen.main.bounds.size.width
//        var currentHeight = UIScreen.main.bounds.size.height
        var currentWidth = liveViewSafeAreaGuide.layoutFrame.width
        var currentHeight = liveViewSafeAreaGuide.layoutFrame.height
        let originalHeight: CGFloat = 1024
        let originalWidth: CGFloat = 1366
        var heightScaleFactor: CGFloat = 1
        var widthScaleFactor: CGFloat = 1
        
        if (currentWidth < currentHeight)
        {
            let temp = currentWidth
            currentWidth = currentHeight
            currentHeight = temp
        }
        
        heightScaleFactor = currentHeight / originalHeight
        widthScaleFactor = currentWidth / originalWidth
        if (heightScaleFactor > widthScaleFactor) {
            videoView.transform = CGAffineTransform(scaleX: heightScaleFactor, y: heightScaleFactor);
        }
        else {
            videoView.transform = CGAffineTransform(scaleX: widthScaleFactor, y: widthScaleFactor);
        }
        videoView.center = self.view.center
    }
    public override func viewDidLayoutSubviews() {
        resetConstraintsForViewSize()
    }
    
    public override func updateViewConstraints() {
        resetConstraintsForViewSize()
        super.updateViewConstraints()
    }
}
public extension MainViewController {
    class func loadFromStoryboard() -> MainViewController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        return storyboard.instantiateInitialViewController() as! MainViewController
    }
}

