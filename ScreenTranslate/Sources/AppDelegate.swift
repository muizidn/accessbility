import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {


//    - (IBAction)lockCurrentUIElement:(id)sender;
//    - (void)unlockCurrentUIElement:(id)sender;
//
//    - (IBAction)navigateToUIElement:(id)sender;
//    - (IBAction)refreshInteractionUIElement:(id)sender;
    
    @IBAction func lockCurrentUIElement(_ sender: NSObject) {
        
    }
    
    @IBAction func navigateToUIElement(_ sender: NSObject) {
        
    }
    
    @IBAction func refreshInteractionUIElement(_ sender: NSObject) {
        
    }
    
    private lazy var systemWideElement = AXUIElementCreateSystemWide()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {

        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateAXElementStatus), userInfo: nil, repeats: true)
    }
    
    private lazy var lastPosition = NSEvent.mouseLocation
    
    private var prevElement: AXUIElement? {
        didSet {
            guard let el = prevElement else { return }
            onElementUpdate(el)
        }
    }
    
    @objc private func updateAXElementStatus() {
        let point = NSEvent.mouseLocation
        
        guard !NSEqualPoints(point, lastPosition) else { return }
        defer { lastPosition = point }
        
        let screenPoint = UIElementUtilities
            .carbonScreenPoint(fromCocoaScreenPoint: point)
        var element: AXUIElement?
        let err = AXUIElementCopyElementAtPosition(
            systemWideElement,
            Float(screenPoint.x),
            Float(screenPoint.y),
            &element)
        defer { prevElement = element }
        // FIXME: Dont work yet
        var isElementEqual: Bool { prevElement == nil ? false : element == nil ? false : CFEqual(element,prevElement) }
        if err == .success, let el = element, !isElementEqual {
            print(el)
        } else {
            print(err)
        }
    }

    
    private func onElementUpdate(_ element: AXUIElement) {
        if let attr = UIElementUtilities
            .value(ofAttribute: kAXValueAttribute, of: element) as? String {
            print("ax.Value:",attr)
        } else if let attr = UIElementUtilities
            .value(ofAttribute: kAXTitleAttribute, of: element) as? String {
            print("ax.Title:",attr)
        } else if let attrs = UIElementUtilities
            .attributeNames(of: element) as? [String] {
            print("ax.Attributes.count",attrs.count)
        }
        
    }
}

enum TranslatableAttribute {
    case value(String)
    case title(String)
    case description(String)
}
