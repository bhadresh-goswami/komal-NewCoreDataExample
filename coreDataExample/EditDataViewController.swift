//
//  EditDataViewController.swift
//  coreDataExample
//
//  Created by tops-mac on 05/12/18.
//  Copyright © 2018 tops-mac. All rights reserved.
//

import UIKit
import CoreData


class EditDataViewController: UIViewController {
    @IBOutlet weak var txtEmailId: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    
    var managedContext:NSManagedObjectContext!
    var objectUserInfor:NSManagedObject!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        
        managedContext = appdelegate.persistentContainer.viewContext
        
        
        txtUserName.text = objectUserInfor.value(forKey: "name") as? String
        txtEmailId.text = objectUserInfor.value(forKey: "emailid") as? String
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(self.DeleteRecord))
        
        // Do any additional setup after loading the view.
    }
    
    @objc func DeleteRecord()  {
        do{
            managedContext.delete(objectUserInfor)            //self.dismiss(animated: true, completion: nil)
            try managedContext.save()
            self.navigationController?.popViewController(animated: true)
        }
        catch let err as NSError{
            print("error is \(err.localizedDescription)")
        }
    }
    
    @IBAction func btnUpdateRecord(_ sender: UIButton) {
      
        objectUserInfor.setValue(txtEmailId.text!, forKey: "emailid")
        objectUserInfor.setValue(txtUserName.text!, forKey: "name")
        
        do{
            try managedContext.save()
            //self.dismiss(animated: true, completion: nil)
            
            self.navigationController?.popViewController(animated: true)
        }
        catch let err as NSError{
            print("error is \(err.localizedDescription)")
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
