//
//  UILabel+ChangeLineSpaceAndWordSpace.h
//  Encounter
//
//  Created by mozhu on 17/2/10.
//  Copyright © 2017年 zf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (ChangeLineSpaceAndWordSpace)


/**
 *  改变行间距
 */
- (UILabel *)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变字间距
 */
- (UILabel *)changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变行间距和字间距
 */
- (UILabel *)changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace;

@end
