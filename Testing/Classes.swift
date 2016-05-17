//
//  Classes.swift
//  Testing
//
//  Created by Paul Benbrook on 4/7/16.
//  Copyright © 2016 Paul Benbrook. All rights reserved.
//

import UIKit

class Movie {
    
    // Properties
    
    // required
    var title : String
    var poster : UIImage
    var category : String
    var blurb : String
    var filmID : String
    var visible : Bool
    var doneLoading : Bool
    
    // optional
    var rating : String?
    var showtimes : [Showtime]?
    var trailerURL : String?
    var trailerImg : UIImage?
    var indexOf : Int?
    var containerCell : MovieTableViewCell?
    
    
    // Initialization
    
    init?(title : String, filmID : String, category : String, blurb : String, visible : Bool, posterURL : String, trailerURL : String?, rating : String?, showtimes : [Showtime]?) {
        
        // Initialize stored properties.
        
        self.title = title
        self.trailerURL = trailerURL
        self.blurb = blurb
        self.rating = rating
        self.category = category
        self.filmID = filmID
        self.showtimes = showtimes
        self.visible = visible
        self.doneLoading = false
        
        self.poster = UIImage(named: "blvd_poster_placeholder.png")!
        self.trailerImg = UIImage()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            // fetch movie poster
            let posterurl = NSURL(string: posterRetrievalURL + posterURL)
            let newposterImage = NSData(contentsOfURL : posterurl! )
            let posterimage = UIImage(data : newposterImage! )
            
            self.poster = posterimage!
            
            dispatch_async(dispatch_get_main_queue()) {
                self.doneLoading = true
                if self.containerCell != nil {
                    self.containerCell?.poster.image = self.poster
                }
            }
        }
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            //fetch youtube preview image
            let trailerimgurl = NSURL(string: youtubeImageBaseURL + trailerURL! + "/maxresdefault.jpg")
            let newtrailerimage = NSData(contentsOfURL: trailerimgurl! )
            
            if newtrailerimage != nil {
                let trailerimage = UIImage(data: newtrailerimage! )
                self.trailerImg = trailerimage!
            }
            
            dispatch_async(dispatch_get_main_queue()) {
                // update some UI
            }
        }
        
        if title.isEmpty || filmID.isEmpty || !visible {
            return nil
        }
    }
}

class Showtime {
    
    // Properties
    /*
    var month : Int
    var day : Int
    */
    var time : NSDate
    var showingID : IntMax
    var available : Bool
    var parentID : String
    
    let now = NSDate()
    
    // Initialization
    
    init?(time : NSDate, showingID: IntMax, available : Bool, parentID : String) { // month: Int, day: Int, time: Int,
        
        // Initialize stored properties.
        
        /*
        self.month = month
        self.day = month
        */
        self.time = time
        self.showingID = showingID
        self.available = available
        self.parentID = parentID
        
        if time == now || time.earlierDate(now) == time  || showingID <= 0 || parentID.isEmpty {
            self.available = false
        }
    }
}
