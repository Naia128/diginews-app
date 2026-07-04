plugins {
    id("com.android.application")
    id("kotlin-android")
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

        jvmTarget = "17"

    }

    defaultConfig {

        applicationId = "com.example.diginews_app"

        minSdk = flutter.minSdkVersion

        targetSdk = flutter.targetSdkVersion

        versionCode = flutter.versionCode

        versionName = flutter.versionName

        resValue(
            "string",
            "app_name",
            "DEV - Naia"
        )

    }

    buildTypes {

        release {

            signingConfig =
                signingConfigs.getByName(
                    "debug"
                )

        }

    }

}

flutter {

    source = "../.."

}