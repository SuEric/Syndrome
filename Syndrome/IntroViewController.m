//
//  ViewController.m
//  Syndrome
//
//  Created by Eric García on 03/11/16.
//  Copyright © 2016 Procodific. All rights reserved.
//

#import "IntroViewController.h"

#import "EAIntroView.h"

#import "AppDelegate.h"

@interface IntroViewController () <EAIntroDelegate>

@property (nonatomic,weak) IBOutlet EAIntroView *introView;

@end

@implementation IntroViewController

#pragma mark - View Lifecycle

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self initializeIntroView];
    }
    
    return self;
}

- (void)initializeIntroView {
    
    UIFont *titleFont = [UIFont fontWithName:@"Georgia-BoldItalic" size:20];
    UIFont *descFont = [UIFont fontWithName:@"Georgia-Italic" size:18];
    CGFloat titlePositionY = 220;
    CGFloat descPositionY = 200;
    
    EAIntroPage *page1 = [EAIntroPage page];
    page1.title = @"Todd's Syndrome";
    page1.titleFont = titleFont;
    page1.titlePositionY = titlePositionY;
    page1.desc = @"Welcome to the very basic Todd's Syndrome Detection App";
    page1.descFont = descFont;
    page1.descPositionY = descPositionY;
    
    EAIntroPage *page2 = [EAIntroPage page];
    page2.title = @"This is page 2";
    page2.titleFont = titleFont;
    page2.titlePositionY = titlePositionY;
    page2.desc = @"Lorem ipsum dolor";
    page2.descFont = descFont;
    page2.descPositionY = descPositionY;
    
    self.introView.pages = @[page1,page2];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // page2.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title2"]];
    self.introView.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IntroViewDelegate

- (void)introDidFinish:(EAIntroView *)introView wasSkipped:(BOOL)wasSkipped {
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    appDelegate.window.rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"rootNav"];
    
    
}

@end
