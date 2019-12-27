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


    private var inspectorWindowController: InspectorWindowController? = nil
    private var descriptionInspectorWindowController: DescriptionInspectorWindowController? = nil
    private var interactionWindowController: InteractionWindowController? = nil
    private var highlightWindowController: HighlightWindowController? = nil
    
    private lazy var systemWideElement: AXUIElement = { AXUIElementCreateSystemWide() }()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
//        #if USE_DESCRIPTION_INSPECTOR
//        descriptionInspectorWindowController = DescriptionInspectorWindowController(windowNibName: "DescriptionInspectorWindow")
//        descriptionInspectorWindowController?.windowFrameAutosaveName = "DescriptionInspectorWindow"
//        descriptionInspectorWindowController?.showWindow(nil)
//        #else
//        inspectorWindowController = InspectorWindowController(windowNibName: "InspectorWindow")
//        inspectorWindowController?.windowFrameAutosaveName = "InspectorWindow"
//        inspectorWindowController?.showWindow(nil)
//        #endif
//
//
//        interactionWindowController = InteractionWindowController(windowNibName: "InteractionWindow")
//        interactionWindowController?.windowFrameAutosaveName = "InteractionWindow"

        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateAXElementStatus), userInfo: nil, repeats: true)
    }
    
    @objc private func updateAXElementStatus() {
        let point = NSEvent.mouseLocation
        let screenPoint = UIElementUtilities
            .carbonScreenPoint(fromCocoaScreenPoint: point)

        var element: AXUIElement?
        let err = AXUIElementCopyElementAtPosition(
            systemWideElement,
            Float(screenPoint.x),
            Float(screenPoint.y),
            &element)
        if err == .success {
            print(element!)
        } else {
            print(err)
        }
    }

}
