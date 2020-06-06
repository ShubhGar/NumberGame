//
//  NumberGameViewController.swift
//  NumberGame
//
//  Created by shubham Garg on 20/05/20.
//  Copyright © 2020 shubham Garg. All rights reserved.
//

import UIKit

class NumberGameViewController: UIViewController {
    //MARK:- IBOutlets
    //We are connecting storyboard objects to our view controller using IBoutlet. So we can access their value or update their values.
    @IBOutlet weak var secondPlayerNameLbl: UILabel!
    @IBOutlet weak var firstPlayerEnterScoreTextField: UITextField!
    @IBOutlet weak var firstPlayerNameLbl: UILabel!
    @IBOutlet weak var secondPlayerEnterScoreTextField: UITextField!
    @IBOutlet weak var firstPlayerScoreLbl: UILabel!
    @IBOutlet weak var secondPlayerScoreLbl: UILabel!
    @IBOutlet weak var addScoreButton: UIButton!
    
    //MARK: Variables
    //Declare variable to store value at run time
    var firstPlayerScore = 0
    var secondPlayerScore = 0
    
    //MARK:- View LifeCycle
    //view did load is called first time before view is loaded in memory. we can update require initial values here
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //MARK:- IBAction
    // We are connecting IBAction from storyboard to Viewcontroller so we can connect button tap action and done require update
    @IBAction func addStoreBtnAxn(_ sender: Any) {
        // getting value from  first player enter score text field and update local variable,
        //we are converting textfield String value to Int
        // we are providing default value by using ??
        self.firstPlayerScore += Int(firstPlayerEnterScoreTextField.text ?? "0") ?? 0
        
        //update score label accordingly
        self.firstPlayerScoreLbl.text = "Score : \(self.firstPlayerScore)"
        
        //Same for second Player
        self.secondPlayerScore += Int(secondPlayerEnterScoreTextField.text ?? "0") ?? 0
        self.secondPlayerScoreLbl.text = "Score : \(self.secondPlayerScore)"
        
        // check Winner
        let winner = self.checkWinner()
        
        // Show Popup according to winner
        // we use switch condition to show popup
        switch winner {
        case 3:
            //Draw case
            // show alert
            self.showAlert(message: "Match is draw. First Player Score is \(self.firstPlayerScore) and Second Player Score is \(self.secondPlayerScore)")
        case 1,2:
            // declare winner name variable
            var winnerName = ""
            //declare winner score variable
            var winnerScore = 0
            //Check winner
            if winner == 1{
                winnerName = "First"
                winnerScore = firstPlayerScore
            }
            else{
                winnerName = "Second"
                winnerScore = secondPlayerScore
            }
            self.showAlert(message: "\(winnerName) is winner and his Score is \(winnerScore)")
            
        default:
            break
        }
        
        // clear text field
        self.firstPlayerEnterScoreTextField.text = nil
        self.secondPlayerEnterScoreTextField.text = nil
        
    }
    
    //MARK:- Show alert
    // we are dividing function for reusability
    func showAlert(message: String?){
        // Show alert
        // Create alert Object
        let alert = UIAlertController(title: "Winner", message: message, preferredStyle: .alert)
        // create action
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            self.restart()
        }
        // add Action
        alert.addAction(action)
        //present alert
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK:- resetFields
    // we are making function for restart game
    func restart(){
        //clear local Score and restart
        self.firstPlayerScore = 0
        self.firstPlayerScoreLbl.text = "Score : \(self.firstPlayerScore)"
        self.secondPlayerScore = 0
        self.secondPlayerScoreLbl.text = "Score : \(self.secondPlayerScore)"
    }
    
    //MARK:- Check Winner
    // return type : Int
    // we are declaring a function two check who is winner
    // if first is winner we return 1
    // if second is winner we return 2
    // if draw we retuen 3
    // if Noone is winner still now we return 0
    func checkWinner()-> Int{
        //who reach more than 152 is winner
        // First check draw condition, If both reach at same time means its draw
        if firstPlayerScore > 152 && secondPlayerScore > 152{
            return 3
        }
            // Check if first player is winner
        else if firstPlayerScore > 152{
            return 1
        }
            // check if second player is winner
        else if secondPlayerScore > 152{
            return 2
        }
        // if no one is winner
        return 0
    }
    
}
