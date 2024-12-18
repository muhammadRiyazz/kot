# Keep all classes in the javax.transaction package
-dontwarn javax.transaction.**
-keep class javax.transaction.** { *; }

# Keep all classes in the net.sourceforge.jtds.jdbc package
-keep class net.sourceforge.jtds.jdbc.** { *; }

# Keep all classes in the org.ietf.jgss package (needed for GSSContext, GSSCredential, etc.)
-dontwarn org.ietf.jgss.**
-keep class org.ietf.jgss.** { *; }
