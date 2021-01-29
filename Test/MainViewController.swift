//
//  MainViewController.swift
//  Test Storyboard macOS
//
//  Created by Jakub Charvat on 29.01.2021.
//

import Cocoa

class MainViewController: NSViewController {

    @IBOutlet var label: NSTextField!
    @IBOutlet var sublabel: NSTextField!
    @IBOutlet var openButton: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.stringValue = "Second window not opened"
        sublabel.stringValue = "Press the button below to open it"
    }
    
    func clearLabels() {
        label.stringValue = "Second window closed"
        sublabel.stringValue = "Press the button below to open a new one"
    }
    
    override func viewDidAppear() {
        view.window?.isMovableByWindowBackground = true
    }
    

    @IBAction func openButtonTapped(_ sender: NSButton) {
        guard let wc = storyboard?.instantiateController(withIdentifier: "PopupWindowController") as? NSWindowController else {
            return
        }
        
        wc.window?.delegate = self
        wc.showWindow(self)
        label.stringValue = "Second window opened"
        sublabel.stringValue = "Close it to open a new one"
        openButton.isEnabled = false
    }
}



extension MainViewController: NSWindowDelegate {
    func windowWillClose(_ notification: Notification) {
        clearLabels()
        openButton.isEnabled = true
    }
}
