//
//  Datatypes.swift
//  Testing
//
//  Created by Paul Benbrook on 4/7/16.
//  Copyright © 2016 Paul Benbrook. All rights reserved.
//

import UIKit

let theaterLatitude = 41.749214
let theaterLongitude =  -88.016690

let dataURL : NSURL = NSURL(string: "http://www.hollywoodblvdcinema.com/index.php?src=reports&srctype=publish&name=movie%20XML")!
let termsURL : NSURL = NSURL(string: "http://www.hollywoodblvdcinema.com/index.php?src=gendocs&ref=privacy_testing")!

let posterRetrievalURL : String = "http://www.hollywoodblvdcinema.com/clientuploads/directory/movies/"
let youtubeImageBaseURL : String = "http://img.youtube.com/vi/"
let youtubeVideoBaseURL : String = "http://www.youtube.com/embed/"
let youtubeVideoOptions : String = "?modestbranding=1&iv_load_policy=3&playsinline=1&showinfo=0"

let disclaimer = ""

var movies : [Movie] = []

var categories : [String] = []

let movieCalendar = NSCalendar.currentCalendar()
let dateFormatter = NSDateFormatter()

class datamanager : NSObject, NSXMLParserDelegate {
    
    var parser = NSXMLParser()
    var posts = NSMutableArray()
    var element : String = ""
    
    var movieTitle : String = ""
    var posterURL : String = ""
    var category : String = ""
    var blurb : String = ""
    var filmID : String = ""
    var visible : Bool = true
    
    var ignore : Bool = false
    
    var showDateTime : String = ""
    var showID : IntMax = 0
    var showAvailable : Bool = false
    var newShowtime : Showtime = Showtime(time: NSDate(),showingID: 0,available: false, parentID: "")!
    
    var rating : String?
    var showtimes : [Showtime]?
    var trailerURL : String?
    
    var urlContent : NSString = ""
    
    func beginParsing() {
        
        posts = []
        parser = NSXMLParser(contentsOfURL:(dataURL))!
        parser.delegate = self
        
        dateFormatter.dateFormat = "yyyyMMddHHmm"
        
        
        
        parser.parse()
        
        
         let task = NSURLSession.sharedSession().dataTaskWithURL(dataURL, completionHandler:  {
         (data, response, error) in
         
         if error == nil {
         
         self.urlContent = NSString(data:data!, encoding: NSASCIIStringEncoding)!
         // NSString(data: data!, encoding: NSUTF8StringEncoding)
         
         print(self.urlContent)
         
         }
         })
         task.resume()
        
        
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        element = elementName
        
        if element == "record" {
            
            movieTitle = ""
            posterURL = ""
            category = ""
            filmID = ""
            visible = true
            
            rating = ""
            blurb = ""
            trailerURL = ""
            showtimes = []
        } else if element == "showtime" {
            showDateTime = ""
            showID = -1
            showAvailable = false
        }
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        if string != "\n" {
            switch element {
                case "name":
                    movieTitle = string
                case "image":
                    posterURL = string
                case "category" :
                    category = string
                case "filmid":
                    filmID = string
                case "visible":
                    if string == "yes" {
                        visible = true
                    } else {
                        visible = false
                    }
                case "description":
                    if string != "<" && string != ">" && string != "p" && string != "/p" && !ignore {
                        if !blurb.isEmpty {
                            blurb = blurb + "\n"
                        }
                        blurb = blurb + string
                    }
                    
                    if string == "<" {
                        ignore = true
                    }
                    
                    if string == ">" {
                        ignore = false
                    }
                case "rating":
                    rating = string
                case "youtube":
                    trailerURL = string
                case "datetime":
                    print("Show DateTime = \(string)")
                case "showtimeid":
                    print("Showtime ID = \(string)")
                case "available":
                    print("Showtime availability status = \(string)")
                default:
                    print("Unrecognized element: '\(element)' containing '\(string)'")
            }
        }
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if (elementName as NSString).isEqualToString("showtime"){
            newShowtime = Showtime(time: dateFormatter.dateFromString(showDateTime)!,showingID: showID,available: visible, parentID: filmID)!
            showtimes?.append(newShowtime)
        }
        
        if (elementName as NSString).isEqualToString("record"){
            
            var dropit = false
            
            for i in 0 ..< movies.count {
                if movies[i].filmID == filmID {
                    dropit = true
                    break
                }
            }
            
            if !dropit {
                
                newShowtime = Showtime(time: dateFormatter.dateFromString(showDateTime)!,showingID: showID,available: visible, parentID: filmID)!
                showtimes?.append(newShowtime)
                
                if categories.indexOf(category) == nil {
                    categories.append(category)
                    print(categories)
                }
                
                if blurb == "" {
                    blurb = "No description available."
                }

                movies.append(Movie(title: movieTitle, filmID: filmID, category: category, blurb: blurb, visible: visible, posterURL: posterURL, trailerURL: trailerURL, rating: rating, showtimes: showtimes)!)
            }
        }
    }
}

