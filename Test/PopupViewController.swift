//
//  PopupViewController.swift
//  Test Storyboard macOS
//
//  Created by Jakub Charvat on 29.01.2021.
//

import Cocoa

class PopupViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear() {
        view.window?.isMovableByWindowBackground = true
    }
    
    @IBAction func closeButtonTapped(_ sender: NSButton) {
        view.window?.close()
    }
}
