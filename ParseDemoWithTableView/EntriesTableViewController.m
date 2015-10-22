//
//  EntriesTableViewController.m
//  ParseDemoWithTableView
//
//  Created by Lauren Caponong on 10/13/15.
//  Copyright © 2015 Lauren Caponong. All rights reserved.
//

#import "EntriesTableViewController.h"
#import <Parse/Parse.h>
#import "Entry.h"

@interface EntriesTableViewController ()

@end

@implementation EntriesTableViewController



- (IBAction)refreshButtonTapped:(id)sender {
    
    [self.tableView reloadData];
    [self performSelector:@selector(retrieveFromParse)];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];

     [self.tableView reloadData];
    
    
    Entry *entry = [[Entry alloc] init];
    entry.descriptionOfEntry = @"Description Here";
    entry.titleOfEntry = @"Title here";

    
    
    [self performSelector:@selector(retrieveFromParse)];
    
    
}


- (void) retrieveFromParse {
    
    PFQuery *retrieveEntries = [PFQuery queryWithClassName:@"Entry"];

    [retrieveEntries findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        
        NSLog(@"%@", objects);
        
        if (!error) {
            entriesArray = [[NSArray alloc] initWithArray:objects];
        }
        
        
        [self.tableView reloadData];
        
    }];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    
    return entriesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    PFObject *tempObject = [entriesArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [tempObject objectForKey:@"title"];
    cell.detailTextLabel.text = [tempObject objectForKey:@"entry"];
    
    return cell;
    
    
}






@end
