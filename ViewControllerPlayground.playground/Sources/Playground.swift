import UIKit
import PlaygroundSupport

public enum BarVisibility {
    case viewControllerOnly
    case withNavigation(isUnderTopBar: Bool)
}

public enum ScreenType : String {
    case phone3_5 = "iPhone 3.5 inch screen"
    case phone4 = "iPhone 4 inch screen"
    case phone4_7 = "iPhone 4.7 inch screen"
    case phone5_5 = "iPhone 5.5 inch screen"
    case pad = "iPad screen"
    case pad_12_9 = "iPad Pro screen"
    case tv = "TV screen"
    
    public func size(isPortrait: Bool = true) -> CGSize {
        var wh: CGSize
        switch self {
        case .phone3_5:
            wh = CGSize(width: 320, height: 480)
            case .phone4:
                wh = CGSize(width: 320, height: 568)
            case .phone4_7:
                wh = CGSize(width: 375, height: 667)
            case .phone5_5:
                wh = CGSize(width: 414, height: 736)
            case .pad:
                wh = CGSize(width: 768, height: 1024)
            case .pad_12_9:
                wh = CGSize(width: 1024, height: 1366)
            case .tv:
                wh = CGSize(width: 1980, height: 1020)
        }
        if !isPortrait, self != .tv {
            return CGSize(width: wh.height, height: wh.width)
        }
        return wh
    }
    
    public func rect(isPortrait: Bool = true) -> CGRect {
        return CGRect(origin: .zero, size: self.size(isPortrait: isPortrait))
    }
}

extension UIViewController {
    
    public convenience init(screenType: ScreenType, isPortrait: Bool = true, barVisibility: BarVisibility = .viewControllerOnly) {
        self.init(nibName: nil, bundle: nil)

        let size = screenType.size(isPortrait: isPortrait)
        let rect = screenType.rect(isPortrait: isPortrait)
        self.view.frame = rect
        view.backgroundColor = .white
        let w = UIWindow(frame: rect)
        switch barVisibility {
        case .viewControllerOnly:
            w.rootViewController = self
            preferredContentSize = size
            PlaygroundPage.current.liveView = self.view
        case .withNavigation(let isUnderTopBar):
            let nc = UINavigationController(rootViewController: self)
            nc.view.frame = rect
            w.rootViewController = nc
            if !isUnderTopBar { edgesForExtendedLayout = [] }
            PlaygroundPage.current.liveView = nc.view
        }
    }
}
