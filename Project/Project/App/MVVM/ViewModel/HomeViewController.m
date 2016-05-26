//
//  HomeViewController.m
//  Project
//
//  Created by PFei_He on 16/5/9.
//  Copyright © 2016年 PFei_He. All rights reserved.
//

#import "Interface.h"
#import "AppDelegate.h"

@interface HomeViewController ()

@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;

@property (strong, nonatomic) WeatherRequest *req;

@end

@implementation HomeViewController

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addRequests:@[self.req?self.req:(self.req=[WeatherRequest new])]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UserSettings *settings = [UserSettings userSettings];
    self.req.requestAPI = settings.api;
    [self.req send];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Events Management

- (IBAction)push:(id)sender
{
    [self performSegueWithIdentifier:@"push" sender:self];
}

#pragma mark - Request Management

- (void)requestSuccess
{
    WeatherResult *result = (WeatherResult *)self.successObject;
    self.cityLabel.text = result.city;
    self.temperatureLabel.text = [NSString stringWithFormat:@"%@%@", result.temp, @"℃"];
}

@end
