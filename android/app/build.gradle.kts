plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.murphy.flutter_echo"
    compileSdk = 35
    ndkVersion = "28.2.13676358"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.credigo.rapidos.prestamos.app"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = 24
        targetSdk = 35
        versionCode = flutter.versionCode
        versionName = flutter.versionName

        ndk {
            abiFilters.addAll(arrayOf("armeabi-v7a", "arm64-v8a" /*"x86", "x86_64"*/))
        }
    }

    signingConfigs {
        create("test") {
            storeFile = file("test.jks")
            storePassword = "123456"
            keyPassword = "123456"
            keyAlias = "key0"
        }
    }

    buildTypes {
        release {
            isMinifyEnabled = true
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("test")
        }
    }

    packaging {
        jniLibs {
            // so 文件压缩
            useLegacyPackaging = true
        }
    }
}

flutter {
    source = "../.."
}
