//
//  AddRecordViewController.swift
//  coreDataExample
//
//  Created by tops-mac on 05/12/18.
//  Copyright © 2018 tops-mac. All rights reserved.
//

import UIKit
import CoreData


class AddRecordViewController: UIViewController {

    @IBOutlet weak var txtEmailId: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    
    
    var managedContext:NSManagedObjectContext!
    var objectUserInfor:NSManagedObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        
        managedContext = appdelegate.persistentContainer.viewContext
        
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSaveRecord(_ sender: UIButton) {
        
        let entity = NSEntityDescription.entity(forEntityName: "UserInfo", in: managedContext)
        
        objectUserInfor = NSManagedObject(entity: entity!, insertInto: managedContext)
        objectUserInfor.setValue(txtEmailId.text!, forKey: "emailid")
        objectUserInfor.setValue(txtUserName.text!, forKey: "name")
        
        do{
            try managedContext.save()
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
