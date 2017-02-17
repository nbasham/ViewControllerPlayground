import UIKit

/*:
 
 ## Playground View Controllers
 
 Add the `Playground.swift` file to the `Sources` folder in your playground to **easily** produce live views for any iPhone or iPad device. Live views show your playground's UI update as you modify your playground, as well as being interactive. For example, you can create an iPhone 7 Plus landscape view controller with a navigation bar that contains touchable bar button items.
 
 
![Navigation View Controller](nvc.png)
 
 ### Sizes
 
 All current device aspect ratios:
 
 - iPhone 3.5 inch scree
 - iPhone 4 inch screen
 - iPhone 4.7 inch screen
 - iPhone 5.5 inch screen
 - iPad screen
 - iPad Pro screen
 - tv
 */
let vc = UIViewController(screenType: .phone3_5Inch)
vc.view.backgroundColor = .orange
/*:
 ### Orientation
 
 Defaults to portrait, specify landscape as follows:
 */
let lvc = UIViewController(screenType: .phone3_5Inch, isPortrait: false)
lvc.view.backgroundColor = .yellow
/*:
 ### Navigation Controller
 
 Add a navigation controller to a view controller using:
 */
let nc = UIViewController(screenType: .phone3_5Inch, barVisibility: .withNavigationController(isUnderTopBar: false))
let image = #imageLiteral(resourceName: "sm.jpg")
let imageView = UIImageView(image: image)
imageView.center = nc.view.center
nc.view.addSubview(imageView)
/*:
 To  place the view controller under the top bar:
 */
let image1 = #imageLiteral(resourceName: "sm.jpg")
let imageView1 = UIImageView(image: image1)
let unc = UIViewController(screenType: .phone3_5Inch,barVisibility: .withNavigationController(isUnderTopBar: true))
imageView1.center = unc.view.center
unc.view.addSubview(imageView1)
unc.title = "Image Under Top Bar"
/*:
 ### Events
 
 This example creates `MyViewController` to handle button messages, but you can use any object you choose.
 */
class MyViewController: UIViewController {
    func tapped(sender: AnyObject) {
        print("bar button tapped")
    }
}
let myvc = MyViewController(screenType: .phone3_5Inch, isPortrait: false, barVisibility: .withNavigationController(isUnderTopBar: false))
myvc.title = "Thank you vets!"
myvc.view.backgroundColor = .lightGray
let barButton = UIBarButtonItem(barButtonSystemItem: .camera, target: myvc, action: #selector(myvc.tapped(sender:)))
myvc.navigationItem.rightBarButtonItem = barButton
myvc.view
