 
## Playground View Controllers
 
 Add the `Playground.swift` file to the `Sources` folder in your playground to **easily** create UIViewControllers for any iPhone or iPad. They assigned to the playground's live view show you can see and interact with your UI. For example, you can create an iPhone 7 Plus view controller in landscape with a navigation bar that contains touchable bar button items.
 
![Example Navigation View Controller](https://cloud.githubusercontent.com/assets/2135673/23046044/45359566-f45c-11e6-895b-928cf14d541d.png)
 
#### Sizes
 
Choose from iPhone 3.5", 4", 4.7", 5.5", iPad, iPad Pro, or TV screen sizes.
 
```swift

let vc = UIViewController(screenType: .phone3_5)

```


#### Orientation
 
Defaults to portrait, specify landscape as follows:
 
```swift

let vc = UIViewController(screenType: .phone3_5, isPortrait: false)

```


#### Navigation Controller
 
 Add a navigation controller to a view controller using:
 
```swift

let vc = UIViewController(screenType: .phone3_5, barVisibility: .withNavigation(isUnderTopBar: false))
vc.title = "iPhone Playground View Controller"

```


 To  place the view controller under the top bar:
 
```swift

let imageView = UIImageView(image: UIImage(named: "talk.objc.io")
let vc = UIViewController(screenType: .phone3_5, barVisibility: .withNavigation(isUnderTopBar: true))
imageView.center = vc.view.center
vc.view.addSubview(imageView)
vc.title = "Image Under Top Bar"

```



#### Example
 
 Create `MyViewController` subclass to handle a navigation bar button's touch event.
 
```swift

class MyViewController: UIViewController {
    func tapped(sender: AnyObject) {
        print("bar button tapped")
    }
}
let vc = MyViewController(screenType: .phone3_5, isPortrait: false, barVisibility: .withNavigation(isUnderTopBar: false))
vc.title = "Thank you vets!"
let barButton = UIBarButtonItem(barButtonSystemItem: .camera, target: vc, action: #selector(vc.tapped(sender:)))
vc.navigationItem.rightBarButtonItem = barButton

```


