//
//  ViewController.h
//  ObjectiveCXPCDemo
//
//  Created by Angelos Staboulis on 19/1/25.
//

#import <Cocoa/Cocoa.h>
#import "XPCClient.h"
@interface ViewController : NSViewController

@property (nonatomic, strong) NSString *inputText;
@property (nonatomic, strong) NSString *upperText; // #1
@property (nonatomic, strong) XPCClient *xpcClient; // #2
@property (weak) IBOutlet NSTextField *txtEnterText;
@property (weak) IBOutlet NSTextField *lblConvertText;
- (IBAction)btnConvert:(id)sender;

@end

