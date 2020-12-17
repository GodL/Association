# Association

Easier to use oc's Runtime association API

## Usage

```swift

extension UIView {
    public var myColor: UIColor {
        set {
            self.associationObject["myColor"] = newValue
        }
        get {
            self.associationObject["myColor"]
        }
    }
}
```

## Installation
**Using the Swift Package Manager**
Add **Association** as a dependency to your `Package.swift` file. For more information, see the [Swift Package Manager documentation](https://github.com/apple/swift-package-manager/tree/master/Documentation).

```
.package(url: "https://github.com/GodL/Association.git", from: "1.0.0")

```

## Help & Feedback
- [Open an issue](https://github.com/GodL/Association/issues/new) if you need help, if you found a bug, or if you want to discuss a feature request.
- [Open a PR](https://github.com/GodL/Association/pull/new/master) if you want to make some change to `Association`.
- Contact [@GodL](547188371@qq.com) .

