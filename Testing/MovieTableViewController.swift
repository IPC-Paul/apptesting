//
//  FirstViewController.swift
//  Testing
//
//  Created by Paul Benbrook on 4/4/16.
//  Copyright © 2016 Team IPC. All rights reserved.
//
/*
import UIKit

var activeMovie = -1

class FirstViewController: UITableViewController, NSXMLParserDelegate {
    
    var parser = NSXMLParser()
    var posts = NSMutableArray()
    var element : String = ""
    
    var movieTitle : String = ""
    var posterURL : String = ""
    var category : String = ""
    var filmID : Int = 0
    var visible : Bool = true
    
    var rating : String?
    var showtimes : [Showtime]?
    var blurb : String?
    var trailerURL : String?
    
    var urlContent : NSString = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if movies.count == 0 {
            self.beginParsing()
        }
    }
    
    func beginParsing() {
        
        movies = []
        posts = []
        parser = NSXMLParser(contentsOfURL:(dataURL))!
        parser.delegate = self
        parser.parse()
        
        /*
         let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler:  {
         (data, response, error) in
         
         if error == nil {
         
         urlContent = NSString(data:data!, encoding: NSASCIIStringEncoding)!
         // NSString(data: data!, encoding: NSUTF8StringEncoding)
         
         print(urlContent)
         
         }
         })
         task.resume()
         */
        
        tableView.reloadData()
        
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        element = elementName
        if elementName == "record" {
            
            title = ""
            posterURL = ""
            category = ""
            filmID = 0
            visible = true
            
            rating = ""
            blurb = ""
            trailerURL = ""
        }
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        if string != "\n" {
            if element == "name" {
                movieTitle = string
            } else if element == "image" {
                posterURL = string
            } else if element == "category" {
                category = string
            } else if element == "id" {
                filmID = Int(string)!
            } else if element == "visible" {
                if string == "yes" {
                    visible = true
                } else {
                    visible = false
                }
            } else if element == "description" {
                if string != "<" && string != ">" && string != "p" && string != "/p" {
                    blurb = blurb! + "\n" + string
                }
            } else if element == "rating" {
                rating = string
            } else if element == "youtube" {
                trailerURL = string
            }
        }
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if (elementName as NSString).isEqualToString("record") {
            movies.append(Movie(title: movieTitle, filmID: filmID, category: category, visible: visible, posterURL: posterURL, trailerURL: trailerURL, blurb: blurb, rating: rating, showtimes: showtimes)!)
            
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return movies.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("moviecell", forIndexPath: indexPath) as! MovieTableViewCell
        
        let movie = movies[indexPath.row]
        var movieHeader = movie.title
        
        if movie.rating != "" {
            movieHeader += " (" + movie.rating! + ")"
        }
        
        cell.poster.image = movie.poster
        cell.textarea.text = movieHeader
        
        if cell.poster.image == UIImage(named: "blvd_poster_placeholder.png")! {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
                cell.reloadInputViews()
            }
        }
        
        tableView.rowHeight = 270
        
        return cell
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        
        activeMovie = indexPath.row
        
        return indexPath
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "newMovie" {
            
            activeMovie = -1
            
        }
    }


}

*/