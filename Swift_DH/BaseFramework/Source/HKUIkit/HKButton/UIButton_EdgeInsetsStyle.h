//
//  UIButton_EdgeInsetsStyle.h
//  BaseFramework
//
//  Created by mac on 2020/1/20.
//  Copyright © 2020 DH add LK. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, HKButtonEdgeInsetsStyle) {
    HKTop, // image在上，label在下
    HKLeft, // image在左，label在右
    HKBottom, // image在下，label在上
    HKRight // image在右，label在左
};

@interface UIButton (style)

- (void)layoutButtonWithEdgeInsetsStyle:(HKButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;


@end

NS_ASSUME_NONNULL_END
