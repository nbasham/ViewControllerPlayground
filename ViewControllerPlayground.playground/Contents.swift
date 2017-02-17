import UIKit

let image = #imageLiteral(resourceName: "sm.jpg")
let sampleView = UIImageView(image: image)

let vc = UIViewController(screenType: .phone3_5Inch, isPortrait: false)
sampleView.center = vc.view.center
vc.view.addSubview(sampleView)

//  with Navigation
extension UIViewController {
    func tapped(sender: AnyObject) {
        print("button tapped")
    }
}

let barButton = UIBarButtonItem(barButtonSystemItem: .camera, target: vc, action: #selector (vc.tapped))
vc.navigationItem.setRightBarButtonItems([barButton], animated: false)
vc.title = "Thank you vets!"
