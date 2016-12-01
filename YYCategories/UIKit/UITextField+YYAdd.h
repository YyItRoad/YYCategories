//
//  UITextField+YYAdd.h
//  YYCategories <https://github.com/ibireme/YYCategories>
//
//  Created by ibireme on 14/5/12.
//  Copyright (c) 2015 ibireme.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 Provides extensions for `UITextField`.
 */
@interface UITextField (YYAdd)

/**
 Set all text selected.
 */
- (void)selectAllText;

/**
 Set text in range selected.
 
 @param range  The range of selected text in a document.
 */
- (void)setSelectedRange:(NSRange)range;


/**
 * 使用TextFiled自带的LeftView 和 RightView 设置一些简单的UI
 * 同一边图片和文字不能同时设置
 */
/**
 左边图片
 */
@property (nonatomic,strong) IBInspectable UIImage *leftImage;

/**
 左边字符串
 */
@property (nonatomic,strong) IBInspectable NSString *leftString;

/**
 左边字符串颜色
 */
@property (nonatomic,strong) IBInspectable UIColor *leftStringColor;

/**
 右边图片
 */
@property (nonatomic,strong) IBInspectable UIImage *rightImage;

/**
 右边字符串
 */
@property (nonatomic,strong) IBInspectable NSString *rightString;

/**
 限制可输入的最大长度
 */
@property (nonatomic,assign) IBInspectable NSInteger maxLength;


/**
 将TextField的leftView实例化为ImageView

 @param img 正常时图片
 @param hImg 高亮时图片
 @return leftView
 */
-(UIImageView *)setLeftImageView:(UIImage *)img highlightedImage:(UIImage *)hImg;

/**
 将TextFiled的leftView实例化为Label
 
 @param title Label的字符串
 @return leftView
 */
-(UILabel *)setLeftLabelWithTitle:(NSString *)title;

/**
 将TextField的rightView实例化为ImageView
 
 @param img 正常时图片
 @param hImg 高亮时图片
 @return rightView
 */
-(UIImageView *)setRightImageView:(UIImage *)img highlightedImage:(UIImage *)hImg;

/**
 将TextFiled的rightView实例化为Label
 
 @param title Label的字符串
 @return rightView
 */
-(UILabel *)setRightLabelWithTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
