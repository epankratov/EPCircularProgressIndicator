//
//  EPCircularProgressIndicator.h
//  EPCircularProgressIndicator
//
//  Created by Eugene Pankratov on 03.09.15.
//  Copyright (c) 2015 pankratov.net.ua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EPCircularProgressIndicator : UIView

@property (nonatomic, assign) CGFloat strokeWidth;
@property (nonatomic, strong) UIColor *fillColor;
@property (nonatomic, strong) UIColor *fillBackgroundColor;
// Progress in percents 0 means no fill, 100 means full circle is filled
@property(nonatomic, assign) CGFloat percentage;

@end
