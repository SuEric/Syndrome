//
//  PatientsViewController.m
//  Syndrome
//
//  Created by Eric García on 03/11/16.
//  Copyright © 2016 Procodific. All rights reserved.
//

#import "PatientsViewController.h"

@interface PatientsViewController ()

@property (nonatomic, strong) NSMutableArray<NSDictionary *> *patients;

@end

@implementation PatientsViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    _patients = [NSMutableArray arrayWithArray:@[
                                                 @{
                                                     @"name": @"Fulanito",
                                                     @"age": @15,
                                                     @"gender": @0,
                                                     @"has_migraines": @NO,
                                                     @"drugs": @[@"1", @"2"]
                                                     },
                                                 @{
                                                     @"name": @"Perenganito",
                                                     @"age": @15,
                                                     @"gender": @0,
                                                     @"has_migraines": @NO,
                                                     @"drugs": @[@"1", @"2"]
                                                     }
                                                 ]];
    
    return [super initWithCoder:aDecoder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.patients count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"patientCell"];
    
    NSDictionary *patient = [self.patients objectAtIndex:indexPath.row];
    
    tableViewCell.textLabel.text = [patient objectForKey:@"name"];
    
    return tableViewCell;
}

#pragma mark - UITableViewDelegate

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
