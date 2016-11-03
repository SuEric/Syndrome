//
//  AddPatientViewController.m
//  Syndrome
//
//  Created by Eric García on 03/11/16.
//  Copyright © 2016 Procodific. All rights reserved.
//

#import "AddPatientViewController.h"

@interface AddPatientViewController () <XLFormViewControllerDelegate>

@end

@implementation AddPatientViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self initializeForm];
    }
    
    return self;
}

- (void) initializeForm {
    XLFormDescriptor * form;
    XLFormSectionDescriptor * section;
    XLFormRowDescriptor * row;
    
    form = [[XLFormDescriptor alloc] init];
    
    // First section
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Patient Information"];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"name" rowType:XLFormRowDescriptorTypeText title:@"Name"];
    [row.cellConfigAtConfigure setObject:@"Enter name" forKey:@"textField.placeholder"];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"age" rowType:XLFormRowDescriptorTypeNumber title:@"Age"];
    [row.cellConfigAtConfigure setObject:@"Enter age" forKey:@"textField.placeholder"];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"gender" rowType:XLFormRowDescriptorTypeSelectorSegmentedControl title:@"Gender"];
    row.selectorOptions = @[@"Male", @"Female"];
    [section addFormRow:row];
    
    // Symptons
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Symptons"];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"has_migraines" rowType:XLFormRowDescriptorTypeSelectorSegmentedControl title:@"Suffer migraines?"];
    row.selectorOptions = @[@"YES", @"NO"];
    [section addFormRow:row];
    
    self.form = form;
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - XLFormViewControllerDelegate

- (void)formRowDescriptorValueHasChanged:(XLFormRowDescriptor *)formRow oldValue:(id)oldValue newValue:(id)newValue {
    
    [super formRowDescriptorValueHasChanged:formRow oldValue:oldValue newValue:newValue];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Value of changed thing" message:[NSString stringWithFormat:@"%@", formRow.value] preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }]];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (IBAction)save:(UIBarButtonItem *)sender {
    
}

@end
