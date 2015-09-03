//
//  MainViewController.m
//  EPCircularProgressIndicator
//
//  Created by Eugene Pankratov on 03.09.15.
//  Copyright (c) 2015 pankratov.net.ua. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.progressIndicator1 setFillBackgroundColor:[UIColor colorWithWhite:0 alpha:0.5]];
    [self.progressIndicator1 setStrokeWidth:1];
    [self.progressIndicator1 setFillColor:[UIColor colorWithRed:0.5 green:0.6 blue:0.9 alpha:1]];

    [self.progressIndicator2 setFillColor:[UIColor colorWithRed:0xff/255.0 green:0x60/255.0 blue:0x49/255.0 alpha:1]];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0f
                                     target:self
                                   selector:@selector(updateIndicator1:)
                                   userInfo:nil
                                    repeats:YES];
    [NSTimer scheduledTimerWithTimeInterval:0.033f
                                     target:self
                                   selector:@selector(updateIndicator2:)
                                   userInfo:nil
                                    repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)updateIndicator1:(NSTimer *)timer
{
    self.progressIndicator1.percentage += 10;
    if (self.progressIndicator1.percentage > 100)
        self.progressIndicator1.percentage = 0;
}

- (void)updateIndicator2:(NSTimer *)timer
{
    self.progressIndicator2.percentage += 0.5;
    if (self.progressIndicator2.percentage > 100)
        self.progressIndicator2.percentage = 0;
}

@end
