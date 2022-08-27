//
//  NSStoryboard+Instantiation.swift
//  Macarbon
//
//  Created by HIROKI IKEUCHI on 2022/03/22.
//
//  ref: CotEditor

import AppKit

protocol StoryboardInstantiatable: AnyObject {
    
    /// Instantinate control from a storyboard.
    ///
    /// - Parameters:
    ///   - name: The name of the storyboard.
    ///   - identifier: The unique identifier for the controller. When nil, the initital controller will be used.
    ///   - bundle: The bundle where the storyboard file exists. When nil, the app’s main bundle will be used.
    /// - Returns: A instance of the receiver class that is instantiated from the storyboard.
    static func instantiate(storyboard: NSStoryboard.Name, identifier: NSStoryboard.SceneIdentifier?, bundle: Bundle?) -> Self
}


extension StoryboardInstantiatable {
    
    /// instantinate control from a storyboard
    static func instantiate(storyboard name: NSStoryboard.Name, identifier: NSStoryboard.SceneIdentifier? = nil, bundle: Bundle? = nil) -> Self {
        
        let storyboard = NSStoryboard(name: name, bundle: bundle)
        
        if let identifier = identifier {
            return storyboard.instantiateController(withIdentifier: identifier) as! Self
        } else {
            return storyboard.instantiateInitialController() as! Self
        }
    }
    
}


extension NSWindowController: StoryboardInstantiatable { }
extension NSViewController: StoryboardInstantiatable { }



// MARK: -

extension NSStoryboard {
    
    convenience init(name: NSStoryboard.Name) {
        
        self.init(name: name, bundle: nil)
    }
    
}

