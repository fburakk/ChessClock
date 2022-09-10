//
//  TimesVC.swift
//  ChessClock
//
//  Created by Burak Köse on 9.09.2022.
//

import UIKit

class TimesVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var times = Times()
    var chosenMin = 0
    var chosenPlus = 0
    
    let devWidth = UIScreen.main.bounds.size.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    @IBAction func createButton(_ sender: Any) {
        let alert = UIAlertController(title: "⏱", message: nil, preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addTextField { UITextField in
            UITextField.placeholder = "minute:"
            UITextField.keyboardType = .numberPad
        }
        alert.addTextField { UITextField in
            UITextField.placeholder = "plus:"
            UITextField.keyboardType = .numberPad
        }
        
        let okButton = UIAlertAction(title: "Ok", style: .default) { [self] UIAlertAction in
            let minField = alert.textFields![0] as UITextField
            let plusField = alert.textFields![1] as UITextField
            
            if let min = minField.text as? String {
                chosenMin = Int(min) ?? 0
                
                if let plus = plusField.text as? String {
                    chosenPlus = Int(plus) ?? 0
                    performSegue(withIdentifier: "toTimer", sender: nil)
                    
                }
            }
            
           
        }
        alert.addAction(cancelButton)
        alert.addAction(okButton)
        present(alert, animated: true)
        
    }
    
    func cellH() -> CGFloat {
        if devWidth >= 390 {
            return 140
        }else{
            return 127
        }
    }
    
    func cellW() -> CGFloat {
        if devWidth >= 390 {
            return 120
        }else{
            return 115
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTimer" {
            let vc = segue.destination as! TimerVC
            vc.counter1 = chosenMin - 1
            vc.counter2 = chosenMin - 1
            vc.plus = chosenPlus
        }
    }
    

}
extension TimesVC: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TimesCell
        
        cell.design()
        cell.timeLabel.text = "\(times.timeArray[indexPath.row].min)+\(times.timeArray[indexPath.row].plus)"
        
        cell.cellHeight.constant = cellH()
        cell.cellWidth.constant = cellW()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return times.timeArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        chosenMin = times.timeArray[indexPath.row].min
        chosenPlus = times.timeArray[indexPath.row].plus
        
        performSegue(withIdentifier: "toTimer", sender: nil)
    }
    
}
extension UICollectionViewCell {
    func design() {
        layer.masksToBounds = true
        layer.cornerRadius = 7
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 0.2
    }
}
