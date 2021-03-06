//
//  DQKMainViewCell.h
//  DQKFreezeWindowView
//
//  Created by 宋宋 on 15/7/15.
//  Copyright © 2015年 dianqk. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DQKMainViewCellStyle) {
    DQKMainViewCellStyleDefault,
    DQKMainViewCellStyleCustom
};

typedef NS_ENUM(NSInteger, DQKMainViewCellSeparatorStyle) {
    DQKMainViewCellSeparatorStyleSingleLine,
    DQKMainViewCellSeparatorStyleNone
};

@interface DQKMainViewCell : UIView


- (instancetype)initWithStyle:(DQKMainViewCellStyle) style reuseIdentifier:(NSString *)reuseIdentifier;

@property (nonatomic, readonly, copy) NSString *reuseIdentifier;
@property (strong, nonatomic) NSString *title;
@property (readonly, assign, nonatomic) DQKMainViewCellStyle style;
@property (assign, nonatomic) DQKMainViewCellSeparatorStyle separatorStyle;
@property (assign, nonatomic) NSInteger rowNumber;
@property (assign, nonatomic) NSInteger sectionNumber;
@property (strong, nonatomic) UIColor *lineColor;

@property (assign, nonatomic) BOOL hideLeftLine;
@property (assign, nonatomic) BOOL hideRightLine;
@property (assign, nonatomic) BOOL hideTopLine;
@property (assign, nonatomic) BOOL hideBottomLine;

@end
