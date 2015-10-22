//
//  EntriesTableViewController.h
//  ParseDemoWithTableView
//
//  Created by Lauren Caponong on 10/13/15.
//  Copyright © 2015 Lauren Caponong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface EntriesTableViewController : UITableViewController <UITableViewDelegate> {
    
    NSArray *entriesArray;
}

@end
