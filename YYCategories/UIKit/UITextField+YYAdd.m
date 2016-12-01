//
//  UITextField+YYAdd.m
//  YYCategories <https://github.com/ibireme/YYCategories>
//
//  Created by ibireme on 14/5/12.
//  Copyright (c) 2015 ibireme.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "UITextField+YYAdd.h"
#import "YYCategoriesMacro.h"
#import <objc/runtime.h>

YYSYNTH_DUMMY_CLASS(UITextField_YYAdd)


@implementation UITextField (YYAdd)

- (void)selectAllText {
    UITextRange *range = [self textRangeFromPosition:self.beginningOfDocument toPosition:self.endOfDocument];
    [self setSelectedTextRange:range];
}

- (void)setSelectedRange:(NSRange)range {
    UITextPosition *beginning = self.beginningOfDocument;
    UITextPosition *startPosition = [self positionFromPosition:beginning offset:range.location];
    UITextPosition *endPosition = [self positionFromPosition:beginning offset:NSMaxRange(range)];
    UITextRange *selectionRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
    [self setSelectedTextRange:selectionRange];
}


- (UIImage *)leftImage {
    UIImageView *imgView = (UIImageView *)self.leftView;
    return imgView.image;
}

- (UIImage *)rightImage {
    UIImageView *imgView = (UIImageView *)self.rightView;
    return imgView.image;
}

- (void)setLeftImage:(UIImage *)leftImage {
    [self setLeftImageView:leftImage highlightedImage:leftImage];
}

- (void)setLeftString:(NSString *)leftString {
    [self setLeftLabelWithTitle:leftString];
}

- (void)setLeftStringColor:(UIColor *)aColor {
    UILabel *leftLabel = (UILabel *)self.leftView;
    leftLabel.textColor = aColor;
}

- (UIColor *)leftStringColor {
    UILabel *leftLabel = (UILabel *)self.leftView;
    return  leftLabel.textColor;
}

- (NSString *)leftString {
    UILabel *leftLabel = (UILabel *)self.leftView;
    return leftLabel.text;
}

- (void)setRightImage:(UIImage *)image {
    [self setRightImageView:image highlightedImage:image];
}

- (void)setRightString:(NSString *)string {
    [self setRightLabelWithTitle:string];
}

- (void)setRightStringColor:(UIColor *)aColor {
    UILabel *rightLabel = (UILabel *)self.rightView;
    rightLabel.textColor = aColor;
}

- (NSString *)rightString {
    UILabel *rightLabel = (UILabel *)self.rightView;
    return rightLabel.text;
}

- (void)setLeftImageWidth:(CGFloat)w {
    [self setLeftViewWidth:w];
}

- (void)setLeftViewWidth:(CGFloat)w {
    UIView *view = self.leftView;
    CGRect f = view.frame;
    f.size.width = w;
    view.frame = f;
}

-(UIImageView *)setLeftImageView:(UIImage *)img highlightedImage:(UIImage *)hImg
{
    UIImageView *imgView = [[UIImageView alloc]initWithImage:img highlightedImage:hImg];
    self.leftView = imgView;
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    self.leftViewMode = UITextFieldViewModeAlways;
    return imgView;
}

-(UILabel *)setLeftLabelWithTitle:(NSString *)title
{
    UILabel *leftLabel = [UILabel new];
    leftLabel.text = title;
    leftLabel.font = self.font;
    [leftLabel sizeToFit];
    self.leftView = leftLabel;
    self.leftViewMode = UITextFieldViewModeAlways;
    return leftLabel;
}

-(UILabel *)setRightLabelWithTitle:(NSString *)title
{
    UILabel *rightLabel = [UILabel new];
    rightLabel.text = title;
    rightLabel.font = self.font;
    [rightLabel sizeToFit];
    self.rightView = rightLabel;
    self.rightViewMode = UITextFieldViewModeAlways;
    return rightLabel;
}

-(UIImageView *)setRightImageView:(UIImage *)img highlightedImage:(UIImage *)hImg
{
    UIImageView *imgView = [[UIImageView alloc]initWithImage:img highlightedImage:hImg];
    self.rightView = imgView;
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    self.rightViewMode = UITextFieldViewModeAlways;
    return imgView;
}

static const char maxLengthKey = '\a';

- (void)setMaxLength:(NSInteger)maxLength {
    [self addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    objc_setAssociatedObject(self, &maxLengthKey,@(maxLength),OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSInteger)maxLength {
    return [objc_getAssociatedObject(self, &maxLengthKey) integerValue];
}

- (void)textFieldDidChange:(UITextField *)textField
{
    if (textField == self) {
        if (textField.text.length > self.maxLength) {
            textField.text = [textField.text substringToIndex:self.maxLength];
        }
    }
}


@end
