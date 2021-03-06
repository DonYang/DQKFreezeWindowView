//
//  DQKMainViewCell.m
//  DQKFreezeWindowView
//
//  Created by 宋宋 on 15/7/15.
//  Copyright © 2015年 dianqk. All rights reserved.
//

#import "DQKMainViewCell.h"

@interface DQKMainViewCell ()

@property (strong, nonatomic) UIView *leftLine;
@property (strong, nonatomic) UIView *rightLine;
@property (strong, nonatomic) UIView *topLine;
@property (strong, nonatomic) UIView *bottomLine;

@property (strong, nonatomic) UILabel *titleLabel;

@end

@implementation DQKMainViewCell

- (instancetype)initWithStyle:(DQKMainViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super init];
    if (self) {
        _reuseIdentifier = reuseIdentifier;
        _rowNumber = 1;
        _sectionNumber = 1;
        _lineColor = [UIColor colorWithRed:205./255. green:205./255. blue:205./255. alpha:1];
        _hideLeftLine = NO;
        _hideRightLine = NO;
        _hideTopLine = NO;
        _hideBottomLine = NO;
        [self addLine];
        switch (style) {
            case DQKMainViewCellStyleDefault:
            {
                _style = style;
                _titleLabel = [[UILabel alloc] init];
                _titleLabel.textAlignment = NSTextAlignmentCenter;
                [self addSubview:_titleLabel];
            }
                break;
            case DQKMainViewCellStyleCustom:
            {
                _style = style;
            }
                break;
            default:
                break;
        }
    }
    return self;
}


- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}

- (void)setSeparatorStyle:(DQKMainViewCellSeparatorStyle)separatorStyle {
    _separatorStyle = separatorStyle;
    if (separatorStyle == DQKMainViewCellSeparatorStyleNone) {
        [self removeLine];
    }
}

- (void)setLineColor:(UIColor *)lineColor {
    if(lineColor == nil){
        return;
    }
    
    _lineColor = lineColor;
    _leftLine.backgroundColor = _lineColor;
    _rightLine.backgroundColor = _lineColor;
    _topLine.backgroundColor = _lineColor;
    _bottomLine.backgroundColor = _lineColor;
}

- (void)addLine {
    _leftLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0.5, self.frame.size.height)];
    _leftLine.backgroundColor = _lineColor;
    [self addSubview:_leftLine];
    _rightLine = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width, 0, 0.5, self.frame.size.height)];
    _rightLine.backgroundColor = _lineColor;
    [self addSubview:_rightLine];
    _topLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 0.5)];
    _topLine.backgroundColor = _lineColor;
    [self addSubview:_topLine];
    _bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, 0.5)];
    _bottomLine.backgroundColor = _lineColor;
    [self addSubview:_bottomLine];
}

- (void)setHideLeftLine:(BOOL)hideLeftLine {
    [_leftLine setHidden: hideLeftLine];
}

- (void)setHideRightLine:(BOOL)hideRightLine {
    [_rightLine setHidden: hideRightLine];
}

- (void)setHideTopLine:(BOOL)hideTopLine {
    [_topLine setHidden: hideTopLine];
}

- (void)setHideBottomLine:(BOOL)hideBottomLine {
    [_bottomLine setHidden: hideBottomLine];
}

- (void)removeLine {
    [self.leftLine removeFromSuperview];
    [self.rightLine removeFromSuperview];
    [self.topLine removeFromSuperview];
    [self.bottomLine removeFromSuperview];
}

- (void)setLine {
    [self.leftLine setFrame:CGRectMake(0, 0, 0.5, self.frame.size.height)];
    [self.rightLine setFrame:CGRectMake(self.frame.size.width, 0, 0.5, self.frame.size.height)];
    [self.topLine setFrame:CGRectMake(0, 0, self.frame.size.width, 0.5)];
    [self.bottomLine setFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, 0.5)];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.style == DQKMainViewCellStyleDefault) {
        [self.titleLabel setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    }
    if (self.separatorStyle == DQKMainViewCellSeparatorStyleSingleLine) {
        [self setLine];
    }
}

@end
