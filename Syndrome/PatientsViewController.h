//
//  PatientsViewController.h
//  Syndrome
//
//  Created by Eric García on 03/11/16.
//  Copyright © 2016 Procodific. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface PatientsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
