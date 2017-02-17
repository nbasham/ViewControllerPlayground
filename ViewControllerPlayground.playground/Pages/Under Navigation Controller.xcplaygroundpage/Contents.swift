import UIKit

let vc = UIViewController(screenType: .phone3_5Inch, isPortrait: false, barVisibility: .withNavigationController(isUnderTopBar: true))
let image = #imageLiteral(resourceName: "sm.jpg")
let imageView = UIImageView(image: image)
imageView.center = vc.view.center

vc.view.addSubview(imageView)
vc.title = "Thank you vets!"
