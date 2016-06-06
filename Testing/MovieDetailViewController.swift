//
//  MovieDetailViewController.swift
//  Testing
//
//  Created by Paul Benbrook on 4/8/16.
//  Copyright © 2016 Team IPC. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var videoFrame: UIWebView!
    @IBOutlet var videomask: UIImageView!
    
    @IBOutlet var movietitle: UILabel!
    @IBOutlet var poster: UIImageView!
    @IBOutlet var blurb: UILabel!
    
    @IBOutlet var showtimeDate: UILabel!
	@IBOutlet var ShowTimeButtons: [UIButton]!
	
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.scrollEnabled = true
        
        poster.image = movies[activeMovie].poster
        movietitle.text = movies[activeMovie].title
        blurb.text = movies[activeMovie].blurb
        videomask.image = movies[activeMovie].trailerImg
        
        showtimeDate.text = "Placeholder Date Info"
        
        let youtubeLink : String = youtubeVideoBaseURL + movies[activeMovie].trailerURL! + youtubeVideoOptions
        self.videoFrame.loadRequest(NSURLRequest(URL: NSURL(string: youtubeLink)!))
        
        if movies[activeMovie].showtimes?.count != nil {
            for i in 0 ..< movies[activeMovie].showtimes!.count {
                ShowTimeButtons[i].hidden = false
                
                let components = movieCalendar.components([.Hour, .Minute], fromDate: movies[activeMovie].showtimes![i].time)
                
                let timeLabel = "\(components.hour):\(components.minute)"
				
                if movies[activeMovie].showtimes![i].available {
                    ShowTimeButtons[i].setTitle(timeLabel, forState: UIControlState.Normal)
                } else {
                    ShowTimeButtons[i].enabled = false
                    ShowTimeButtons[i].setTitle(timeLabel, forState: UIControlState.Disabled)
                }
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func testalternatebackbutton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func pressesEnded(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
        
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
