//
//  ViewController.swift
//  loopArrayMiniApp
//
//  Created by NICHOLAS VINTARTAS on 10/16/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var errorExistsLabel: UILabel!
    
    @IBOutlet weak var songField: UITextField!
    
    @IBOutlet weak var listView: UITextView!
    
    @IBOutlet weak var filterSegmentOutlet: UISegmentedControl!
    
    @IBOutlet weak var filterHiddenOutlet: UIButton!
    
    var songs : [String] = []
    
    var ratings : [Int] = []
    
    var rating = 1
    
    var position = 0
    
    var text = ""
    
    var filter = 1
    
    var filterHidden = true
    
    func update() {
        text = ""
        listView.text = text
        for song in songs {
            if ratings[songs.firstIndex(of: song)!] >= filter {
                position = songs.firstIndex(of: song)!
                text = "\(String(describing: listView.text ?? ""))" + " \n "  + "\(song) - \(ratings[songs.firstIndex(of: song)!]) stars"
                listView.text = text
            }
        }
        print(rating)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        errorExistsLabel.isHidden = true
        filterSegmentOutlet.isHidden = true
    }

    @IBAction func ratingSegment(_ sender: Any) {
        var choice = (sender as AnyObject).selectedSegmentIndex
        if choice == 0 {
            rating = 1
        }
        else if choice == 1 {
            rating = 2
        }
        else if choice == 2 {
            rating = 3
        }
        else if choice == 3 {
            rating = 4
        }
        else if choice == 4 {
            rating = 5
        }
        print(rating)
    }
    
    @IBAction func addButton(_ sender: Any) {
        if songs.contains(songField.text ?? "") == false {
            if songField.text != "" {
                songs.insert(songField.text!, at: songs.count)
                ratings.insert(rating, at: ratings.count)
                update()
                errorExistsLabel.isHidden = true
            }
            errorExistsLabel.isHidden = true
            errorExistsLabel.text = "Error: Empty field!"
        }
        else {
            errorExistsLabel.isHidden = false
            errorExistsLabel.text = "Error: Media already exists!"
        }
        songField.text = ""
        songField.resignFirstResponder()
    }
    
    @IBAction func removeButton(_ sender: Any) {
        if songs.count > 0 {
            if songs.contains(songField.text ?? "") {
                ratings.remove(at: songs.firstIndex(of: songField.text ?? "")!)
                songs.remove(at: songs.firstIndex(of: songField.text ?? "")!)
                errorExistsLabel.isHidden = true
            }
            else {
                errorExistsLabel.isHidden = false
                errorExistsLabel.text = "Error: Media doesn't exist!"
            }
        }
        else {
            errorExistsLabel.isHidden = false
            errorExistsLabel.text = "Error: Empty list!"
        }
        update()
        songField.text = ""
        songField.resignFirstResponder()
    }
    
    @IBAction func resetButton(_ sender: Any) {
        songs = []
        ratings = []
        update()
        errorExistsLabel.isHidden = false
        errorExistsLabel.text = "Reset complete."
        songField.resignFirstResponder()
    }
    
    @IBAction func filterSegment(_ sender: Any) {
        filter = (sender as AnyObject).selectedSegmentIndex + 1
        update()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    @IBAction func filterHideButton(_ sender: Any) {
        if filterHidden == true {
            filterHidden = false
            filterSegmentOutlet.isHidden = false
            filterHiddenOutlet.setTitle("Close Filter", for: .normal)
        }
        else {
            filterHidden = true
            filterSegmentOutlet.isHidden = true
            filterHiddenOutlet.setTitle("Open Filter", for: .normal)
        }
    }
    
}

