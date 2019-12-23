//
//  WelcomeView.h
//  CustomProject
//
//  Created by mozhu on 17/5/2.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WelcomeView : UIView<UIScrollViewDelegate>

@property UIPageControl *imagePageControl;
@property UIScrollView  *guidePageView;



- (instancetype)initWithFrame:(CGRect)frame WithImages:(NSArray *)images;

@end
