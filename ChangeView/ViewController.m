//
//  ViewController.m
//  ChangeView
//
//  Created by sycf_ios on 2017/4/5.
//  Copyright © 2017年 shibiao. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
@property (nonatomic, strong) IBOutlet NSView *redView;
@property (nonatomic,strong) IBOutlet NSView *blueView;
@property (nonatomic,strong) IBOutlet NSView *yelloView;


@property (weak) IBOutlet NSView *contentView;
@property (nonatomic,strong) NSView *currentView;
@property (weak) IBOutlet NSButton *btn1;

@property (nonatomic,strong) NSButton *currentBtn;
@end
@implementation ViewController
-(void)setRedView:(NSView *)redView{
    _redView = redView;
    _redView.wantsLayer = YES;
    _redView.layer.backgroundColor = [NSColor redColor].CGColor;
}
-(void)setBlueView:(NSView *)blueView{
    _blueView = blueView;
    _blueView.wantsLayer = YES;
    _blueView.layer.backgroundColor = [NSColor blueColor].CGColor;
}
-(void)setYelloView:(NSView *)yelloView{
    _yelloView = yelloView;
    _yelloView.wantsLayer = YES;
    _yelloView.layer.backgroundColor = [NSColor yellowColor].CGColor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btn1.state = YES;
    [self.contentView addSubview:self.redView];
    [self addConstraintToView:self.redView];
    self.currentView = self.contentView.subviews[0];
    self.currentBtn = self.btn1;
    
}
- (IBAction)changeView:(id)sender {
    NSButton *btn = sender;
    if (self.currentBtn) {
        self.currentBtn.state = NO;
    }
    if ([btn.title isEqualToString:@"View1"]) {
        [self.contentView replaceSubview:self.currentView with:self.redView];
    }else if ([btn.title isEqualToString:@"View2"]){
        [self.contentView replaceSubview:self.currentView with:self.blueView];
    }else{
        [self.contentView replaceSubview:self.currentView with:self.yelloView];
    }
    self.currentView = self.contentView.subviews[0];
    [self addConstraintToView:self.currentView];
    self.currentBtn = sender;
    self.currentBtn.state = YES;
}
//添加约束
-(void)addConstraintToView:(NSView *)view{
    [view setTranslatesAutoresizingMaskIntoConstraints:NO];
    [view.topAnchor constraintEqualToAnchor:self.contentView.topAnchor].active = YES;
    [view.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor].active = YES;
    [view.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor].active = YES;
    [view.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor].active = YES;
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
