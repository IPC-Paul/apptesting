//
//  MoviePurchaseViewController.swift
//  Testing
//
//  Created by Paul Benbrook on 4/20/16.
//  Copyright © 2016 Team IPC. All rights reserved.
//

import UIKit
import WebKit

class MoviePurchaseViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet var purchaseWebView: UIWebView!
    
    let purchaseBaseURL : String = "https://www.hollywoodblvdcinema.com/index.php?src=directory&view=movies&submenu=Movies&srctype=movies_ticket_purchase_minimal&filmId="
    let purchaseURLPart2 = "&showingId="
    
    var fullPurchaseURL : NSURL = NSURL()
    var compiledURL : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var currentFilmID = movies[activeMovie].showtimes![0].parentID
        var currentShowtimeID = movies[activeMovie].showtimes![0].showingID
        
        if movies[activeMovie].showtimes![0].showingID <= 0 {
            currentFilmID = "BA28683"
            currentShowtimeID = 035024000056
        }
        
        compiledURL = purchaseBaseURL + currentFilmID + purchaseURLPart2 + String(currentShowtimeID)
        
        fullPurchaseURL = NSURL(string: compiledURL)!
        
        purchaseWebView.loadRequest(NSURLRequest(URL: fullPurchaseURL))
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func BackButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
