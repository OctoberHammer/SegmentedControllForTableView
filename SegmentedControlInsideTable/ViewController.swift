//
//  ViewController.swift
//  SegmentedControlInsideTable
//
//  Created by Ocotober Hammer on 10/13/15.
//  Copyright © 2015 Ocotober Hammer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var mySegmentedControll: UISegmentedControl!
    @IBOutlet weak var myTableView: UITableView!
    
    let ingridients = ["12 шт. картофеля","1 морковь", "1 ст. ложка муки", "400г свинины"];
    let stages = ["Порезать картофель","Помыть Морков", "Всыпать муку", "Пожарить свинину", "Варить до готовность 500 секунд"];
    let reviews = ["Аффтар мудак, я блевал!","Охуени блюдо, хочу исчо!", "А есть такое же блюдо, но с рыбой вместо свинины?"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mySegmentedControll.setTitle("Отзывы (\(reviews.count))", forSegmentAtIndex: 2);
    }

    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        var returnValue = 0;
        switch (mySegmentedControll.selectedSegmentIndex){
        case 0:
            returnValue = ingridients.count;
            break
        case 1:
            returnValue = stages.count;
            break
        case 2:
            returnValue = reviews.count;
            break
        default:
            break
        }
        return returnValue;
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath);
        
        switch (mySegmentedControll.selectedSegmentIndex){
        case 0:
            myCell.textLabel!.text = ingridients[indexPath.row];
            break
        case 1:
            myCell.textLabel!.text = stages[indexPath.row];
            break
        case 2:
            myCell.textLabel!.text = reviews[indexPath.row];
            break
        default:
            break
        }
        return myCell;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func refreshButtonTapped(sender: UIBarButtonItem) {
    }

    @IBAction func selectSegment(sender: UISegmentedControl) {
        myTableView.reloadData();
    }
}

