//
//  ViewController.swift
//  Annotated
//
//  Created by Christopher Sexton on 12/29/15.
//  Copyright © 2015 Christopher Sexton. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

  @IBAction func openFile(sender: AnyObject) {
    let fileDialog: NSOpenPanel = NSOpenPanel()
    fileDialog.runModal()
    
    if let url = fileDialog.URL, let path = url.path {
      copyFileToTempDirectoryAsync(path) { temp in
        self.annotate(temp)
      }
    }
  }
  
  func annotate(path:String) {
    let annotator = Annotator()
    annotator.annotateImageFileInPlace(path)

    NSWorkspace.sharedWorkspace().openURL(NSURL(fileURLWithPath: path))
  }
  

  // This is a big ball of nope. Totally ignoring error cases and unwrapping
  // everything. This was just a quick hack that does the following things:
  //
  // - Create a Temp Dir
  // - Copy the file to the new Temp File
  // - Delete Temp File if it exists
  // - Dispatch on the background thread
  // - Invoke the block, passing in the new tempFile
  //
  func copyFileToTempDirectoryAsync(path:String, handler:String -> Void){

    let tempDir = NSURL(fileURLWithPath: NSTemporaryDirectory()).URLByAppendingPathComponent("Annotated")
    do {
      try NSFileManager.defaultManager().createDirectoryAtURL(tempDir, withIntermediateDirectories: true, attributes: nil)
    }
    catch { print("ZOMG: \(error)") }
    
    do {
      
      let name = NSURL(string: path)!.lastPathComponent!
      let tempFile = NSURL(string: tempDir.relativePath!)?.URLByAppendingPathComponent(name).relativePath!
      do {
        try NSFileManager.defaultManager().removeItemAtPath(tempFile!)
      }
      catch { /* LOL */ }
      
      try NSFileManager.defaultManager().copyItemAtPath(path, toPath: tempFile!)

      let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
      dispatch_async(dispatch_get_global_queue(priority, 0)) {
        handler(tempFile!)
      }
    }
    catch { print("ZOMG: \(error)") }
  }
  
  
  
}

