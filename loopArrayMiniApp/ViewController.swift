//
//  ViewController.swift
//  loopArrayMiniApp
//
//  Created by NICHOLAS VINTARTAS on 10/16/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var songField: UITextField!
    
    @IBOutlet weak var listView: UITextView!
    
    var songs : [String] = []
    
    var ratings : [Int] = []
    
    var rating = 0
    
    var text = ""
    
    func update() {
        text = ""
        listView.text = text
        for song in songs {
            text = "\(listView.text!)" + " \n "  + "\(song)"
            listView.text = text
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
    }
    
    @IBAction func addButton(_ sender: Any) {
        songs.insert(songField.text!, at: songs.count)
        ratings.insert(rating, at: ratings.count)
        update()
    }
    
    @IBAction func removeButton(_ sender: Any) {
        ratings.remove(at: songs.firstIndex(of: songField.text!)!)
        songs.remove(at: songs.firstIndex(of: songField.text!)!)
        update()
    }

}

