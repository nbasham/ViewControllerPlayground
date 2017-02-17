 
## Playground View Controllers
 
 Add the `Playground.swift` file to the `Sources` folder in your playground to **easily** produce live views for any iPhone or iPad device. Live views show your playground's UI update as you modify your playground, as well as being interactive. For example, you can create an iPhone 7 Plus landscape view controller with a navigation bar that contains touchable bar button items.
 
![Example Navigation View Controller](https://cloud.githubusercontent.com/assets/2135673/23046044/45359566-f45c-11e6-895b-928cf14d541d.png)
 
#### Sizes
 
Current device aspect ratios:
 
 - iPhone 3.5 inch scree
 - iPhone 4 inch screen
 - iPhone 4.7 inch screen
 - iPhone 5.5 inch screen
 - iPad screen
 - iPad Pro screen
 - tv
 
```swift

let vc = UIViewController(screenType: .phone3_5Inch)

```


#### Orientation
 
Defaults to portrait, specify landscape as follows:
 
```swift

let vc = UIViewController(screenType: .phone3_5Inch, isPortrait: false)

```


#### Navigation Controller
 
 Add a navigation controller to a view controller using:
 
```swift

let vc = UIViewController(screenType: .phone3_5Inch, barVisibility: .withNavigationController)
vc.title = "iPhone Playground View Controller"

```


 To  place the view controller under the top bar:
 
```swift

let imageView = UIImageView(image: UIImage(named: "objio")
let vc = UIViewController(screenType: .phone3_5Inch,barVisibility: .underNavigationController)
imageView.center = vc.view.center
vc.view.addSubview(imageView)
vc.title = "Image Under Top Bar"

```



#### Events
 
 Add a bar button and capture it's event.
 
```swift

class MyViewController: UIViewController {
    func tapped(sender: AnyObject) {
        print("bar button tapped")
    }
}
let vc = MyViewController(screenType: .phone3_5Inch, isPortrait: false, barVisibility: .withNavigationController)
vc.title = "Thank you vets!"
let barButton = UIBarButtonItem(barButtonSystemItem: .camera, target: vc, action: #selector(vc.tapped(sender:)))
vc.navigationItem.rightBarButtonItem = barButton

```


