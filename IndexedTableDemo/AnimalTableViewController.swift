//
//  AnimalTableViewController.swift
//  IndexedTableDemo
//
// Makan Fofana
//

import UIKit

class AnimalTableViewController: UITableViewController {
    
    
    var animalsDict = [String: [String]]()
    var animalSectionTitles = [String]()
    
    let animals = ["Bear", "Black Swan", "Buffalo", "Camel", "Cockatoo", "Dog", "Donkey", "Emu", "Giraffe", "Greater Rhea", "Hippopotamus", "Horse", "Koala", "Lion", "Llama", "Manatus", "Meerkat", "Panda", "Peacock", "Pig", "Platypus", "Polar Bear", "Rhinoceros", "Seagull", "Tasmania Devil", "Whale", "Whale Shark", "Wombat"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createAnimalDict()
        
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
        return animalSectionTitles.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        let animalKey = animalSectionTitles[section]
        guard let animalValues = animalsDict[animalKey] else {
            return 0
        }
        
        return animalValues.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return animalSectionTitles[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Configure the cell...
        let animalKey = animalSectionTitles[indexPath.section]
        if let animalValues = animalsDict[animalKey] {
            cell.textLabel?.text = animalValues[indexPath.row]
        }
        
        // Convert the animal name to lower case and
        // then replace all occurences of a space with an underscore
        let imageFileName = animals[indexPath.row].lowercased().replacingOccurrences(of: " ", with: "_")
        cell.imageView?.image = UIImage(named: imageFileName)
        
        return cell
    }

    
    //Function Call To Group & Sort in Ascending Order
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
        animalSectionTitles.sort(by: {$0 < $1})
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
