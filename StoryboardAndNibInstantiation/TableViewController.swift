//
//  Created by Simon Kågedal Reimer in 2017.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        ClassTableViewCell.register(in: tableView)
        NibTableViewCell.register(in: tableView)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        switch indexPath.row {
        case 0:
            let cell = NibTableViewCell.dequeue(in: tableView, for: indexPath)
            return cell
            
        case 1:
            let cell = ClassTableViewCell.dequeue(in: tableView, for: indexPath)
            cell.textLabel?.text = "Simple non-nib table view cell"
            return cell
            
        default:
            fatalError("shoul'd be reached")
        }
    }
}
