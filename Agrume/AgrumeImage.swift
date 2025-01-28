//
//  Copyright © 2018 Schnaub. All rights reserved.
//

import UIKit

public enum AgrumeImage: Equatable {
  case local(UIImage)
  case remote(URL)
  
  var url: URL? {
    switch self {
    case .local:
      return nil
    case .remote(let url):
      return url
    }
  }
  
  var image: UIImage? {
    switch self {
    case .local(let image):
      return image
    case .remote:
      return nil
    }
  }
}

public enum AgrumeMedia: Equatable {
  case image(AgrumeImage, title: NSAttributedString? = nil)
  case video(URL, thumbnail: AgrumeImage, title: NSAttributedString? = nil)
  
  var title: NSAttributedString? {
    switch self {
    case .image(_, let title),
        .video(_, _, let title):
      return title
    }
  }
  
  var image: AgrumeImage {
    switch self {
    case .image(let agrumeImage, _):
      return agrumeImage
    case .video(_, let thumbnail, _):
      return thumbnail
    }
  }
  
  var imageURL: URL? {
    image.url
  }
  
  var localImage: UIImage? {
    image.image
  }
}
