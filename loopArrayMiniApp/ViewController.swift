//
//  ViewController.swift
//  loopArrayMiniApp
//
//  Created by NICHOLAS VINTARTAS on 10/16/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var errorExistsLabel: UILabel!
    
    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var listView: UITextView!
    
    @IBOutlet weak var filterSegmentOutlet: UISegmentedControl!
    
    @IBOutlet weak var filterHiddenOutlet: UIButton!
    
    var titles : [String] = []
    
    var ratings : [Int] = []
    
    var rating = 1
    
    var position = 0
    
    var text = ""
    
    var filter = 1
    
    var filterHidden = true
    
    func update() {
        text = ""
        listView.text = text
        for title in titles {
            if ratings[titles.firstIndex(of: title)!] >= filter {
                position = titles.firstIndex(of: title)!
                text = "\(String(describing: listView.text ?? ""))" + " \n "  + "\(title) - \(ratings[titles.firstIndex(of: title)!]) stars"
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
        if titles.contains(titleField.text ?? "") == false {
            if titleField.text != "" {
                titles.insert(titleField.text!, at: titles.count)
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
        titleField.text = ""
        titleField.resignFirstResponder()
    }
    
    @IBAction func removeButton(_ sender: Any) {
        if titles.count > 0 {
            if titles.contains(titleField.text ?? "") {
                ratings.remove(at: titles.firstIndex(of: titleField.text ?? "")!)
                titles.remove(at: titles.firstIndex(of: titleField.text ?? "")!)
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
        titleField.text = ""
        titleField.resignFirstResponder()
    }
    
    @IBAction func resetButton(_ sender: Any) {
        titles = []
        ratings = []
        update()
        errorExistsLabel.isHidden = false
        errorExistsLabel.text = "Reset complete."
        titleField.resignFirstResponder()
    }
    
    @IBAction func filterSegment(_ sender: Any) {
        filter = (sender as AnyObject).selectedSegmentIndex + 1
        update()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        titleField.resignFirstResponder()
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

