//
//  ViewController.swift
//  ScratchMap
//
//  Created by Sebastien on 07/10/2018.
//  Copyright © 2018 Epseelon sprl. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var countriesView: WorldMap!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countriesView.scratch(country: "AD")
        countriesView.scratch(country: "AE")
        countriesView.scratch(country: "AF")
        countriesView.scratch(country: "AG")
        countriesView.scratch(country: "AL")
        countriesView.scratch(country: "AO")
        countriesView.scratch(country: "AR")
        countriesView.scratch(country: "AT")
        countriesView.scratch(country: "AU")
        countriesView.scratch(country: "AZ")
        countriesView.scratch(country: "US")
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func setAsDesktopWallpaperButtonClicked(_ sender: Any) {
        if let documentsDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let mapFile = documentsDirectoryUrl.appendingPathComponent("scratchmap.png")
            
            //let screenSize = NSScreen.main!.frame.size
            let mapData = self.countriesView!.imageData(withSize: NSScreen.main!.frame.size)
            do {
                try mapData.write(to: mapFile)
                print(mapFile.path)
                try Wallpaper.set(mapFile, screen: .main, scale: .fit)
            } catch(let error) {
                print(error.localizedDescription)
            }
        }
    }
    
}

