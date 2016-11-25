//
//  MyView.h
//  MyRefresh
//
//  Created by tonniegao on 2016/11/24.
//  Copyright © 2016年 lagou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyView : UIView

/**
 *@brief 设置三个值  y=ax2 + bx + c
 *@param a CGFloat
 *@param b CGFloat
 *@param c CGFloat
 *@return 返回void
  */
- (void)setA:(CGFloat)a b:(CGFloat)b c:(CGFloat)c;
- (void)setA:(CGFloat)a;
- (void)setB:(CGFloat)b;
- (void)setC:(CGFloat)c;

@end
