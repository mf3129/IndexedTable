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
    
    let animalIndexTitles: [String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O","P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y","Z"]
    
    
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

    //Right Side Section Indexes
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return animalIndexTitles
    }
    
    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        
        guard let index = animalSectionTitles.index(of: title) else {
            return -1
        }
        
        return index
    }
    
    //Updating Height
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView = view as! UITableViewHeaderFooterView
        headerView.backgroundView?.backgroundColor = UIColor(red: 236.0/255.0, green: 240.0/255.0, blue: 241.0/255.0, alpha: 1.0)
        headerView.textLabel?.textColor = UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0)
        headerView.textLabel?.font = UIFont(name: "Avenir", size: 25.0)
    }
    
    
    // MARK: - Function Call To Group & Sort in Ascending Order
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
