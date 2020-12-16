
import ObjectiveC

public class Association<Target: NSObject> {
    unowned private let target: Target
    
    private var associations: [String : UnsafeMutablePointer<UInt8>] = [:]
    
    init(target: Target) {
        self.target = target
    }
    
    public subscript<Result>(key: String, policy: objc_AssociationPolicy = .OBJC_ASSOCIATION_RETAIN_NONATOMIC) -> Result? {
        set {
            
            if let associationKey = associations[key] {
                objc_setAssociatedObject(target, associationKey, newValue, policy)
                if newValue == nil {
                    associationKey.deinitialize(count: 1)
                    associationKey.deallocate()
                    associations.removeValue(forKey: key)
                }
            }else {
                guard let value = newValue else { return }
                let associationKey = UnsafeMutablePointer<UInt8>.allocate(capacity: 1)
                associations[key]  = associationKey
                objc_setAssociatedObject(target, associationKey, value, policy)
            }
        }
        get {
            if let key = associations[key] {
                return objc_getAssociatedObject(target, key) as? Result
            }
            return nil
        }
    }
    
    deinit {
        associations.forEach { _, key in
            key.deinitialize(count: 1)
            key.deallocate()
        }
    }
}

private var key: String = ""

extension NSObject {
    public var associationObject: Association<NSObject> {
        guard let object = objc_getAssociatedObject(self, &key) else {
            let object = Association(target: self)
            objc_setAssociatedObject(self, &key, object, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return object
        }
        return object as! Association<NSObject>
    }
}
