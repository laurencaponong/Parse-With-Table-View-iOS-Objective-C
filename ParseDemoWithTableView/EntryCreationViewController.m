//
//  EntryCreationViewController.m
//  ParseDemoWithTableView
//
//  Created by Lauren Caponong on 10/22/15.
//  Copyright © 2015 Lauren Caponong. All rights reserved.
//

#import "EntryCreationViewController.h"
#import <Parse/Parse.h>
#import "Entry.h"

@interface EntryCreationViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *entryTextField;

@end

@implementation EntryCreationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)doneButtonTapped:(id)sender {
    
    PFObject *entry = [PFObject objectWithClassName:@"Entry"];
    [entry setObject:self.titleTextField.text forKey:@"title"];
    [entry setObject:self.entryTextField.text forKey:@"entry"];
    
        [self dismissViewControllerAnimated:YES completion:nil];
    
    
    [entry saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        
        if (!error) {
            // Show success message
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Upload Complete" message:@"Successfully saved the note - please refresh." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
            // Notify table view to reload the recipes from Parse cloud
            [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshTable" object:self];
            
            // Dismiss the controller
            [self dismissViewControllerAnimated:YES completion:nil];
            
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Upload Failure" message:[error localizedDescription] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
        }
        
    }];
    
   
    
    
}

@end
