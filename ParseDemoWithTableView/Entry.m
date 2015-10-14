//
//  Entry.m
//  ParseDemoWithTableView
//
//  Created by Lauren Caponong on 10/13/15.
//  Copyright © 2015 Lauren Caponong. All rights reserved.
//

#import "Entry.h"

@implementation Entry

@dynamic createdAt;
@dynamic descriptionOfEntry;
@dynamic titleOfEntry;

+ (NSString *) parseClassName {
    return @"Entry";
}

@end
