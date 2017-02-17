import UIKit
import PlaygroundSupport

public enum BarVisibility {
    case viewControllerOnly, withNavigationController, underNavigationController
}
public enum ScreenType : String {
    case phone3_5Inch = "iPhone 3.5 inch screen"
    case phone4Inch = "iPhone 4 inch screen"
    case phone4_7Inch = "iPhone 4.7 inch screen"
    case phone5_5Inch = "iPhone 5.5 inch screen"
    case pad = "iPad screen"
    case pad_12_9Inch = "iPad Pro screen"
    case tv = "TV screen"
    
    public func size(isPortrait: Bool = true) -> CGSize {
        var wh: CGSize
        switch self {
        case .phone3_5Inch:
            wh = CGSize(width: 320, height: 480)
            case .phone4Inch:
                wh = CGSize(width: 320, height: 568)
            case .phone4_7Inch:
                wh = CGSize(width: 375, height: 667)
            case .phone5_5Inch:
                wh = CGSize(width: 414, height: 736)
            case .pad:
                wh = CGSize(width: 768, height: 1024)
            case .pad_12_9Inch:
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
        
        if barVisibility == .viewControllerOnly {
            w.rootViewController = self
            preferredContentSize = size
            PlaygroundPage.current.liveView = self.view
        } else {
            let nc = UINavigationController(rootViewController: self)
            nc.view.frame = rect
            w.rootViewController = nc
            if barVisibility != .underNavigationController { edgesForExtendedLayout = [] }
            PlaygroundPage.current.liveView = nc.view
        }
    }
}

//open class PlaygroundNavigationViewController: UIViewController {
//    public let screenType: ScreenType
////    public init(screenType: ScreenType, isPortrait: Bool = true, underNavbar: Bool = false) {
////        self.screenType = screenType
////        let size = screenType.size(isPortrait: isPortrait)
////        let w = UIWindow(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
////        super.init(nibName: nil, bundle: nil)
////        preferredContentSize = size
////        let nc = UINavigationController(rootViewController: self)
////        nc.view.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
////        w.rootViewController = nc
////        if !underNavbar {
////            edgesForExtendedLayout = []
////        }
////        view.backgroundColor = .white
////        PlaygroundPage.current.liveView = nc.view
////    }
//    
//    required public init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
//}
//
//open class PlaygroundViewController: UIViewController {
//    public init(screenType: ScreenType, isPortrait: Bool = true) {
//        let size = screenType.size(isPortrait: isPortrait)
//        super.init(nibName: nil, bundle: nil)
//        view.backgroundColor = .white
//        let w = UIWindow(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
//        w.rootViewController = self
//        PlaygroundPage.current.liveView = self
//    }
//    
//    required public init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
//}
//
//public class Playground {
//    
//    public static func NC(screenType: ScreenType, isPortrait: Bool = true, underNavbar: Bool = false) -> (navigationController: UINavigationController, viewController: UIViewController) {
//        let size = screenType.size(isPortrait: isPortrait)
//        let w = UIWindow(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
//        let vc = UIViewController.init(nibName: nil, bundle: nil)
//        let nc = UINavigationController(rootViewController: vc)
//        nc.view.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
//        w.rootViewController = nc
//        if !underNavbar {
//            vc.edgesForExtendedLayout = []
//        }
//        vc.view.backgroundColor = .white
//        PlaygroundPage.current.liveView = nc.view
//        return (navigationController: nc, viewController: vc)
//    }
//
//    public static func VC(screenType: ScreenType, isPortrait: Bool = true) -> UIViewController {
//        let size = screenType.size(isPortrait: isPortrait)
//        let w = UIWindow(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
//        let vc = UIViewController.init(nibName: nil, bundle: nil)
//        vc.view.backgroundColor = .white
//        w.rootViewController = vc
//        PlaygroundPage.current.liveView = vc
//        return vc
//    }
//}
