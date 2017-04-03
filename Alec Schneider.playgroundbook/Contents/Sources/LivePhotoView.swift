import UIKit
import Photos
import PhotosUI

public class LivePhotoView: UIView {
    
    let image: UIImage
    let imageURL: URL
    let videoURL: URL
    let infoButton: UIButton
    
    let liveView: PHLivePhotoView
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(image: UIImage, imageURL: URL, videoURL: URL, width: CGFloat, height: CGFloat, infoButton: UIButton) {
        self.image = image
        self.imageURL = imageURL
        self.videoURL = videoURL
        let rect = CGRect(x: 0, y: 0, width: width, height: height)
        self.liveView = PHLivePhotoView(frame: rect)
        self.infoButton = infoButton
        super.init(frame: rect)
        self.addSubview(self.liveView)
    }
    
    public func prepareLivePhoto() {
        makeLivePhotoFromItems { (livePhoto) in
            self.liveView.livePhoto = livePhoto
        }
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        infoButton.isHidden = false
    }
    
    private func makeLivePhotoFromItems(completion: @escaping (PHLivePhoto) -> Void) {
        PHLivePhoto.request(withResourceFileURLs: [imageURL, videoURL], placeholderImage: image, targetSize: CGSize.zero, contentMode: .aspectFit) {
            (livePhoto, infoDict) -> Void in
            
            if let canceled = infoDict[PHLivePhotoInfoCancelledKey] as? NSNumber,
                canceled == 0,
                let livePhoto = livePhoto
            {
                completion(livePhoto)
            }
        }
    }
    
}
