//
//  XHNewsTemplateContainerView.m
//  MessageDisplayExample
//
//  Created by 曾 宪华 on 14-5-29.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import "XHNewsTemplateContainerView.h"
#import <MessageDisplayKit/XHMacro.h>

#import "XHNewsContainerView.h"


@interface XHNewsTemplateContainerView ()

@property (nonatomic, strong) UIView *containerView;

@end

@implementation XHNewsTemplateContainerView

#pragma mark - Propertys

- (UIImageView *)backgroundImageView {
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _backgroundImageView.image = XH_STRETCH_IMAGE([UIImage imageNamed:@"NewsBackgroundImage"], UIEdgeInsetsMake(7, 7, 7, 7));
    }
    return _backgroundImageView;
}

- (UIImageView *)topNewsImageView {
    if (!_topNewsImageView) {
        _topNewsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, CGRectGetWidth(self.bounds) - 20, CGRectGetHeight(self.bounds) - 180)];
        _topNewsImageView.contentMode = UIViewContentModeScaleAspectFill;
        _topNewsImageView.layer.masksToBounds = YES;
        _topNewsImageView.image = [UIImage imageNamed:@"AlbumHeaderBackgrounImage"];
        [_topNewsImageView addSubview:self.topNewsTitleLabel];
    }
    return _topNewsImageView;
}
- (UILabel *)topNewsTitleLabel {
    if (!_topNewsTitleLabel) {
        _topNewsTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(_topNewsImageView.bounds) - 30, CGRectGetWidth(_topNewsImageView.bounds), 30)];
        _topNewsTitleLabel.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.500];
        _topNewsTitleLabel.textColor = [UIColor whiteColor];
        _topNewsTitleLabel.font = [UIFont systemFontOfSize:14];
        _topNewsTitleLabel.text = @"我们是一个专业的团队，群聊开始做吧！";
    }
    return _topNewsTitleLabel;
}

- (UIImageView *)sepatorImageViewWithWidth:(CGFloat)width {
    UIImageView *sepatorImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, 0.5)];
    sepatorImageView.backgroundColor = [UIColor colorWithRed:0.711 green:0.747 blue:0.755 alpha:1.000];
    return sepatorImageView;
}

- (UIView *)containerView {
    if (!_containerView) {
        UIImageView *sepatorImageView = [self sepatorImageViewWithWidth:CGRectGetWidth(self.bounds)];
        CGRect sepatorImageViewFrame = sepatorImageView.frame;
        sepatorImageViewFrame.origin.y = CGRectGetMaxY(self.topNewsImageView.frame) + 10;
        sepatorImageView.frame = sepatorImageViewFrame;
        [self addSubview:sepatorImageView];
        
        _containerView = [[UIView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(sepatorImageViewFrame), CGRectGetWidth(self.bounds) - 20, 50 * 3 + 2)];
        for (int i = 0; i < 3; i ++) {
            XHNewsContainerView *currentNewsView = [[XHNewsContainerView alloc] initWithFrame:CGRectMake(0, i * (50 + 1), CGRectGetWidth(_containerView.bounds), 50)];
            if (i < 2) {
                UIImageView *sepatorImageView = [self sepatorImageViewWithWidth:CGRectGetWidth(self.topNewsImageView.bounds)];
                CGRect sepatorImageViewFrame = sepatorImageView.frame;
                sepatorImageViewFrame.origin.y = CGRectGetMaxY(currentNewsView.frame);
                sepatorImageView.frame = sepatorImageViewFrame;
                [_containerView addSubview:sepatorImageView];
            }
            [_containerView addSubview:currentNewsView];
        }
    }
    return _containerView;
}

#pragma mark - Life Cycle

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self addSubview:self.backgroundImageView];
        [self addSubview:self.topNewsImageView];
        [self addSubview:self.containerView];
    }
    return self;
}

@end
