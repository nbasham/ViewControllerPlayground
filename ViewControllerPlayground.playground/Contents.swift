/*:
 # Playground View Controllers
 
 Add the `Playground.swift` file to the `Sources` folder in your playground to **easily** produce live views for any iPhone or iPad device. Live views show your playground's UI update as you modify your playground, as well as being interactive. For example, you can create an iPhone 7 Plus landscape view controller with a navigation bar that contains touchable bar button items.
 
 **Sizes**
 
 Choose from iPhone 3.5", 4", 4.7", 5.5", iPad, iPad Pro, or TV screen sizes.
 
    let vc = UIViewController(screenType: .phone3_5)
 
 **Orientation**
 
 Support for landscape and portrait (default).
 
    let vc = UIViewController(screenType: .phone5_5, isPortrait: false)
 
 **Navigation Controller**
 
 The `UIViewController` can be contained in a `UINavigationController` by including a `barVisibility` parameter.
 
    let vc = UIViewController(screenType: .phone3_5, barVisibility: .withNavigation(isUnderTopBar: false))
 
 To layout the UIViewController under the top bar change the `isUnderTopBar` parameter to `true`:
 
    let vc = UIViewController(screenType: .phone3_5, barVisibility: .withNavigation(isUnderTopBar: true))
 
 
 ## Putting It All Together
 
 Here's a complete example, the view controller is a live view so you can see changes as you modify the code. In this example a 3.5" iPhone UIViewController is subclassed by MyViewController to handle bar button touch events.
 */
import UIKit

class MyViewController: UIViewController {
    func tapped(sender: AnyObject) {
        print("bar button tapped")
    }
}

let vc = MyViewController(screenType: .phone3_5, isPortrait: false, barVisibility: .withNavigation(isUnderTopBar: false))

let image = #imageLiteral(resourceName: "sm.jpg")
let imageView = UIImageView(image: image)
imageView.frame = CGRect(x: 10, y: 5, width: 460, height: 266)

let barButton = UIBarButtonItem(barButtonSystemItem: .camera, target: vc, action: #selector(vc.tapped(sender:)))

vc.view.addSubview(imageView)
vc.navigationItem.rightBarButtonItem = barButton
vc.title = "Thank you vets!"
vc.view.backgroundColor = .lightGray
