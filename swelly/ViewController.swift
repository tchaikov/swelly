//
//  ViewController.swift
//  swelly
//
//  Created by ZhangChen on 05/10/2016.
//
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var termView : TermView!
    @IBOutlet weak var connectButton : NSButton!
    
    @IBOutlet weak var siteAddressField: NSTextField!
    
    override func viewDidAppear() {
        super.viewDidAppear()
        self.view.window?.makeFirstResponder(siteAddressField)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func didPressConnect(_ sender: Any) {
        if !termView.connected {
            let site = Site()
            site.address = siteAddressField.stringValue
            let connection = Connection(site: site)
            let term = Terminal()
            term.delegate = termView
            connection.terminal = term
            //term.connection = connection
            termView.connection = connection
            connectButton.title = "Disconnect"
            siteAddressField.isEditable = false
            
        } else {
            termView.connection?.close()
            siteAddressField.isEditable = true
            connectButton.title = "Connect"
        }
    }

}

