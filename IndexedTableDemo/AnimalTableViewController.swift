//
//  AnimalTableViewController.swift
//  IndexedTableDemo
//
//  Created by Simon Ng on 3/10/2016.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit

class AnimalTableViewController: UITableViewController {
    
    
    var animalsDict = [String: [String]]()
    var animalSectionTitles = [String]()
    
    func createAnimalDict() {
        //Retrieving first letter of the animal and building dictionary
        for animal in animals {
            let firstLetterIndex = animal.index(animal.startIndex, offsetBy: 1)
            let animalKey = String(animal[..<firstLetterIndex])
            
            if var animalValues = animalsDict[animalKey] {
                animalValues.append(animal)
                animalsDict[animalKey] = animalValues }
            else {
                animalsDict[animalKey] = [animal]
            }
        }
        
        //Retrieving section title from animal and sorting it.
        animalSectionTitles = [String](animalsDict.keys)
    }
    
    let animals = ["Bear", "Black Swan", "Buffalo", "Camel", "Cockatoo", "Dog", "Donkey", "Emu", "Giraffe", "Greater Rhea", "Hippopotamus", "Horse", "Koala", "Lion", "Llama", "Manatus", "Meerkat", "Panda", "Peacock", "Pig", "Platypus", "Polar Bear", "Rhinoceros", "Seagull", "Tasmania Devil", "Whale", "Whale Shark", "Wombat"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return animals.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = animals[indexPath.row]
        
        // Convert the animal name to lower case and
        // then replace all occurences of a space with an underscore
        let imageFileName = animals[indexPath.row].lowercased().replacingOccurrences(of: " ", with: "_")
        cell.imageView?.image = UIImage(named: imageFileName)
        
        return cell
    }


}



//    let animals: [String: [String]] =
//        ["B": ["Bear", "Black Swan", "Buffalo"],
//         "C": ["Camel", "Cockatoo"],
//         "D": ["Dog", "Donkey"],
//         "E": ["Emu"],
//         "G": ["Giraffe", "Greater Rhea"],
//         "H": ["Hippopotamus", "Horse"],
//         "K": ["Koala"],
//         "L": ["Lion", "Llama"],
//         "M": ["Manatus", "Meerkat"],
//         "P": ["Panda", "Peacock", "Pig", "Platypus", "Polar Bear"],
//         "R": ["Rhinoceros"],
//         "S": ["Seagull"],
//         "T": ["Tasmania Devil"],
//         "W": ["Whale", "Whale Shark", "Wombat"]]
//
