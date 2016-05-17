//
//  MovieViewController.swift
//  Testing
//
//  Created by Paul Benbrook on 4/11/16.
//  Copyright © 2016 Team IPC. All rights reserved.
//

import UIKit

var activeMovie = -1
var indexPaths : [NSIndexPath] = []
var currentCategory = "Now Showing"

class MovieViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var table: UITableView!
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var mainView: UIView!
    @IBOutlet var categoryButton: UIBarButtonItem!
    
    var timeLabel : String = ""
    
    let dataManager = datamanager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.selectRow(categories.indexOf(currentCategory)!, inComponent: 0, animated: false)
        table.estimatedRowHeight = 265
        categoryButton.title = currentCategory
        //dataManager.beginParsing()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count + 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let headerCell = table.dequeueReusableCellWithIdentifier("bannercell")
            return headerCell!
        } else {
            indexPaths.append(indexPath)
            let movieCell = table.dequeueReusableCellWithIdentifier("moviecell", forIndexPath: indexPath) as! MovieTableViewCell
            
            for i in 0 ..< movieCell.showtimebuttons.count {
                movieCell.showtimebuttons[i].hidden = true
            }
            
            if movies[indexPath.row - 1].showtimes?.count != nil {
                for i in 0 ..< movies[indexPath.row - 1].showtimes!.count {
                    movieCell.showtimebuttons[i].hidden = false
                    
                    let components = movieCalendar.components([.Hour, .Minute], fromDate: movies[indexPath.row - 1].showtimes![i].time)
                    
                    timeLabel = "\(components.hour):\(components.minute)"
                    
                    if movies[indexPath.row - 1].showtimes![i].available {
                        movieCell.showtimebuttons[i].setTitle(timeLabel, forState: UIControlState.Normal)
                    } else {
                        movieCell.showtimebuttons[i].enabled = false
                        movieCell.showtimebuttons[i].setTitle(timeLabel, forState: UIControlState.Disabled)
                    }
                }
            }
        
            let movie = movies[indexPath.row - 1]
            var movieHeader = movie.title
        
            if movie.rating != "" {
                movieHeader += " (" + movie.rating! + ")"
            }
            
            movieCell.poster.image = movie.poster
            movieCell.textarea.text = movieHeader
            movieCell.category = movie.category
        
            if !movie.doneLoading {
                movies[indexPath.row - 1].containerCell = movieCell
            }
            return movieCell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 108
        } else {
            if movies[indexPath.row - 1].category == currentCategory {
                return 265
            } else {
                return 0
            }
        }
    }
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        if indexPath.row != 0 {
            activeMovie = ( indexPath.row - 1 )
            performSegueWithIdentifier("showmoviedetail", sender: self)
            return indexPath
        } else {
            return nil
        }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count;
    }
    
    // MARK: - UIPickerViewDelegate
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        currentCategory = categories[row]
        categoryButton.title = currentCategory
        table.reloadRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Automatic)
        //table.reloadSections(NSIndexSet(index: 0), withRowAnimation: UITableViewRowAnimation.Automatic)
        pickerView.hidden = true
        //table.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }

    @IBAction func CategoryButton(sender: AnyObject) {
        if pickerView.hidden {
            pickerView.hidden = false
            mainView.bringSubviewToFront(pickerView)
        } else {
            pickerView.hidden = true
        }
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
