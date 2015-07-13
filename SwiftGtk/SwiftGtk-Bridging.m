//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

#import "SwiftGtk-Bridging.h"

gulong g_signal_connect_data_swift(gpointer instance, const gchar *detailed_signal, void (*c_handler)(gpointer, gpointer), const void *data, GClosureNotify destroy_data, GConnectFlags connect_flags) {
    return g_signal_connect_data(instance, detailed_signal, (GCallback) c_handler, (gpointer) data, destroy_data, connect_flags);
}