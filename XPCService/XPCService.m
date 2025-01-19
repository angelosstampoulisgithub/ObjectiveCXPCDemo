//
//  XPCService.m
//  XPCService
//
//  Created by Angelos Staboulis on 19/1/25.
//

#import "XPCService.h"

@implementation XPCService
- (instancetype)init {
    self = [super init];
    if (self) {
        _listener = [[NSXPCListener alloc] initWithMachServiceName:xpcServiceLabel];
        _listener.delegate = self;
    }
    return self;
}

- (void)start {
    [self.listener resume];
}

- (void)stop {
    [self.listener suspend];
}



- (BOOL)listener:(NSXPCListener *)listener shouldAcceptNewConnection:(NSXPCConnection *)newConnection {
    newConnection.exportedObject = self;
    newConnection.exportedInterface = [NSXPCInterface interfaceWithProtocol:@protocol(XPCServiceProtocol)];
    newConnection.remoteObjectInterface = [NSXPCInterface interfaceWithProtocol:@protocol(XPCServiceProtocol)];
    [newConnection resume];
    self.connection = newConnection;
    return YES;
}

// MARK: XPCServiceProtocol

- (void)createRandomNumber:(void (^)(long))reply{
    long randomNumber = arc4random_uniform(100000);
    reply(randomNumber);
}




@end
