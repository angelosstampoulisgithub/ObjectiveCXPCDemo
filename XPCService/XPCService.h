//
//  XPCService.h
//  XPCService
//
//  Created by Angelos Staboulis on 19/1/25.
//

#import <Foundation/Foundation.h>
#import "XPCServiceProtocol.h"

// This object implements the protocol which we have defined. It provides the actual behavior for the service. It is 'exported' by the service to make it available to the process hosting the service over an NSXPCConnection.

static NSString * const xpcServiceLabel = @"com.template.XPCService";

@interface XPCService : NSObject<NSXPCListenerDelegate, XPCServiceProtocol>
@property (nonatomic, strong) NSXPCListener *listener;
@property (nonatomic, strong) NSXPCConnection *connection;

- (void)createRandomNumber:(void (^)(long))reply;

@end
