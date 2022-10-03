//
//  ViewController.swift
//  UItestCase
//
//  Created by phonestop on 10/1/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    
    var names: [String] = []
    
    var math = Arithmetic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Addition of two numbers: ", math.Add(num1: 2, num2: 2))
        print("Substraction of two numbers: ", math.Sub(num1: 2, num2: 2))
        print("Multiplication of two numbers: ", math.Mul(num1: 2, num2: 5))
        print("Division of two numbers: ", math.Div(num1: 2, num2: 2))
        
        tblView.delegate = self
        tblView.dataSource = self
    }

    
    @IBAction func addNameList(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add Noise Maker", message: "What's the name of the noise maker?", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Enter Name"
        }
        
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [weak alert, weak self] (_) in
            guard let textField = alert?.textFields?[0],
                  let userText = textField.text, !userText.isEmpty,
                  let self = self else { return }
            self.names.insert(userText, at: 0)
            self.tblView.insertRows(at: [.init(row: 0, section: 0)], with: .automatic)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (_) in }))
        
        self.present(alert, animated: true, completion: nil)
    }

  }


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! NoiseMakerTVCell
        
        cell.nameLbl.text = names[indexPath.row]
        
        return cell
    }
    
    //To delete the rows
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            names.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
