## Flutter wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }
-dontwarn io.flutter.embedding.**
-dontwarn com.google.android.play.core.splitcompat.SplitCompatApplication

# Kakao SDK
-keep class com.kakao.** { *; }
-dontwarn com.kakao.**