//
//  XPCServiceProtocol.h
//  XPCService
//
//  Created by Angelos Staboulis on 19/1/25.
//

#import <Foundation/Foundation.h>

// The protocol that this service will vend as its API. This header file will also need to be visible to the process hosting the service.
@protocol XPCServiceProtocol <NSObject>

- (void)createRandomNumber:(void (^)(long))reply;



@end


/*
 To use the service from an application or other process, use NSXPCConnection to establish a connection to the service by doing something like this:

     _connectionToService = [[NSXPCConnection alloc] initWithServiceName:@"com.template.XPCService"];
     _connectionToService.remoteObjectInterface = [NSXPCInterface interfaceWithProtocol:@protocol(XPCServiceProtocol)];
     [_connectionToService resume];

Once you have a connection to the service, you can use it like this:

     [[_connectionToService remoteObjectProxy] performCalculationWithNumber:@23 andNumber:@19 withReply:^(NSNumber *reply) {
         // We have received a response.
         NSLog(@"Result from calculation is: %@", reply);
     }];

 And, when you are finished with the service, clean up the connection like this:

     [_connectionToService invalidate];
*/
