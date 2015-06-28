//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

#import <gtk/gtk.h>

gulong g_signal_connect_data_swift(gpointer instance, const gchar *detailed_signal, void (*c_handler)(gpointer, gpointer), gpointer data, GClosureNotify destroy_data, GConnectFlags connect_flags);
