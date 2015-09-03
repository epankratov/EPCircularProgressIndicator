//
//  MainViewController.h
//  EPCircularProgressIndicator
//
//  Created by Eugene Pankratov on 03.09.15.
//  Copyright (c) 2015 pankratov.net.ua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EPCircularProgressIndicator.h"

@interface MainViewController : UIViewController

@property (nonatomic, strong) IBOutlet EPCircularProgressIndicator *progressIndicator1;
@property (nonatomic, strong) IBOutlet EPCircularProgressIndicator *progressIndicator2;

@end
