//
//  ViewController.m
//  ObjectiveCXPCDemo
//
//  Created by Angelos Staboulis on 19/1/25.
//

#import "ViewController.h"
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}
- (void)viewDidAppear{
    [super viewDidAppear];
    _xpcClient = [[XPCClient alloc] init];
    [_xpcClient establishConnection];
    [[_xpcClient xpcClient] createRandomNumber:^(long reply) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self->_lblConvertText setStringValue:[NSString stringWithFormat:@"%ld",reply]];
        });
    }];

}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    
    // Update the view, if already loaded.
}

- (IBAction)btnConvert:(id)sender {
    

    [[_xpcClient xpcClient] createRandomNumber:^(long reply) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self->_lblConvertText setStringValue:[NSString stringWithFormat:@"%ld",reply]];
        });
    }];
   

    
}
@end
