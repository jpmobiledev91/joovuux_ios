//
//  ConntectionVC.m
//  JooVuuX
//
//  Created by Vladislav on 02.10.15.
//  Copyright (c) 2015 lsoft. All rights reserved.
//

#import "ConnectionVC.h"
#import "CameraManager.h"
#import "AppDelegate.h"
@interface ConnectionVC ()
@property (nonatomic,retain) AppDelegate *appDelegate;
@end

@implementation ConnectionVC

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.appDelegate = [[UIApplication sharedApplication] delegate];
    NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
}


-(void) viewDidLoad {
    [super viewDidLoad];
    
}


-(void) alertNoInternetConnection
{
    UIAlertView *subAlert = [[UIAlertView alloc] initWithTitle:@""
                                                       message:@"Connection fail. Check on WiFi settings and try to connect again."
                                                      delegate:self
                                             cancelButtonTitle:@"Close"
                                             otherButtonTitles:nil];
    [subAlert show];
}

-(void) alertConnection
{
    UIAlertView *subAlert = [[UIAlertView alloc] initWithTitle:@""
                                                       message:@"The connection was successful"
                                                      delegate:self
                                             cancelButtonTitle:@"Close"
                                             otherButtonTitles:nil];
    [subAlert show];
}

-(void) alreadyConnected
{
    UIAlertView *subAlert = [[UIAlertView alloc] initWithTitle:@""
                                                       message:@"Already connected"
                                                      delegate:self
                                             cancelButtonTitle:@"Close"
                                             otherButtonTitles:nil];
    [subAlert show];
}

- (IBAction)connectionButton:(UIButton *)sender {
    self.connectionLabel.backgroundColor = [UIColor colorWithRed:149/256.0 green:149/256.0 blue:149/256.0 alpha:1];
    if ([self.appDelegate isConnected]) {
        [self alreadyConnected];
    }
    else
    {
        [self alertNoInternetConnection];
        [[CameraManager cameraManager] getToken];
    }
}

- (IBAction)backButton:(UIBarButtonItem*)sender {
    [self.navigationController popViewControllerAnimated:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"getToken" object:nil];
}

@end