//
//  DQKRowViewCell.m
//  DQKFreezeWindowView
//
//  Created by 宋宋 on 15/7/15.
//  Copyright © 2015年 dianqk. All rights reserved.
//

#import "DQKRowViewCell.h"


@interface DQKRowViewCell ()
@property (strong, nonatomic) UIView *topLine;
@property (strong, nonatomic) UIView *bottomLine;
@property (strong, nonatomic) UILabel *titleLabel;
@end

@implementation DQKRowViewCell

- (instancetype)initWithStyle:(DQKRowViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super init];
    if (self) {
        _reuseIdentifier = reuseIdentifier;
        _lineColor = [UIColor colorWithRed:205./255. green:205./255. blue:205./255. alpha:1];
        [self addLine];
        switch (style) {
            case DQKRowViewCellStyleDefault:
            {
                _style = style;
                _titleLabel = [[UILabel alloc] init];
                _titleLabel.textAlignment = NSTextAlignmentCenter;
                [self addSubview:_titleLabel];
            }
                break;
            case DQKRowViewCellStyleCustom:
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

- (void)setSeparatorStyle:(DQKRowViewCellSeparatorStyle)separatorStyle {
    _separatorStyle = separatorStyle;
    if (separatorStyle == DQKRowViewCellSeparatorStyleNone) {
        [self removeLine];
    }
}

- (void)setLineColor:(UIColor *)lineColor {
    if(lineColor == nil){
        return;
    }
    
    _lineColor = lineColor;
    _topLine.backgroundColor = _lineColor;
    _bottomLine.backgroundColor = _lineColor;
}

- (void)addLine {
    _topLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 0.5)];
    _topLine.backgroundColor = _lineColor;
    [self addSubview:_topLine];
    _bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, 0.5)];
    _bottomLine.backgroundColor = _lineColor;
    [self addSubview:_bottomLine];
}

- (void)setHideTopLine:(BOOL)hideTopLine {
    [_topLine setHidden: hideTopLine];
}

- (void)setHideBottomLine:(BOOL)hideBottomLine {
    [_bottomLine setHidden: hideBottomLine];
}

- (void)removeLine {
    [self.topLine removeFromSuperview];
    [self.bottomLine removeFromSuperview];
}

- (void)setLine {
    [self.topLine setFrame:CGRectMake(0, 0, self.frame.size.width, 0.5)];
    [self.bottomLine setFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, 0.5)];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.style == DQKRowViewCellStyleDefault) {
        [self.titleLabel setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    }
    if (self.separatorStyle == DQKRowViewCellSeparatorStyleSingleLine) {
        [self setLine];
    }
}

@end
