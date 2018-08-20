//
//  ViewController.swift
//  Pick Up Lines Proto
//
//  Created by Kyle Lee on 10/14/17.
//  Copyright © 2017 Kilo Loco. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var pickUpLines: Results<PickUpLine>!
    var notificationToken: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //read fron a realm file
        let realm = RealmService.shared.realm
        pickUpLines = realm.objects(PickUpLine.self)
        
        //realm notifies you whenever there is a change in the ui
        notificationToken = realm.observe { (notification, realm) in
            self.tableView.reloadData()
            //returns notification token
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notificationToken?.invalidate()
    }

    @IBAction func onAddTapped() {
        AlertService.addAlert(in: self) { (line, score, email) in

            let newPickUpLine = PickUpLine(line: line, score: score, email: email)
            RealmService.shared.create(newPickUpLine)
        }
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pickUpLines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PickUpLineCell") as? PickUpLineCell else { return UITableViewCell() }
        let pickUpLine = pickUpLines[indexPath.row]
        cell.configure(with: pickUpLine)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 63
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected")
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        print("delete")
    }
}
















