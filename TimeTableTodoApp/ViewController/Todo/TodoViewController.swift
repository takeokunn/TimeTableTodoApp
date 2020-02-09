import Foundation
import UIKit

class TodoViewController: UITableViewController {

    var todos: [String] = ["fdsfs", "fdsafas"]

    override func viewDidLoad () {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning () {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: logic
extension TodoViewController {

    private func initializeTableView() {
        tableView.rowHeight = 60
    }
}

// MARK: tableview
extension TodoViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)

        let label1 = cell.viewWithTag(1) as? UILabel
        label1?.text = self.todos[indexPath.row]

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
}
