import UIKit

class MyViewController: UIViewController {
    func tapped(sender: AnyObject) {
        print("bar button tapped")
    }
}
let vc = MyViewController(screenType: .phone3_5Inch, isPortrait: false, barVisibility: .withNavigationController)
let image = #imageLiteral(resourceName: "sm.jpg")
let imageView = UIImageView(image: image)
imageView.frame = CGRect(x: 10, y: 5, width: 460, height: 266)

vc.view.addSubview(imageView)
vc.title = "Thank you vets!"
vc.view.backgroundColor = .lightGray
let barButton = UIBarButtonItem(barButtonSystemItem: .camera, target: vc, action: #selector(vc.tapped(sender:)))
vc.navigationItem.rightBarButtonItem = barButton