plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.diginews_app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.diginews_app"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

def dartEnvironmentVariables = []
if (project.hasProperty('dart-defines')) {
    dartEnvironmentVariables = project.property('dart-defines').split(',').collectEntries {
        def pair = new String(it.decodeBase64(), 'UTF-8').split('=')
        [(pair[0]): pair[1]]
    }
}

android {
    defaultConfig {
        // Mengambil variabel APP_MODE dari --dart-define Flutter
        def appMode = dartEnvironmentVariables.APP_MODE ?: "DEV"
        
        if (appMode == "PROD") {
            resValue "string", "app_name", "UTD - 20123061" 
        } else {
            resValue "string", "app_name", "DEV - Naia"
        }
    }
}
